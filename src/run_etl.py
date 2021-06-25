import shutil

from pyspark.sql import SparkSession
from pyspark.sql.window import Window
from pyspark.sql.functions import *

from helper import get_fnames, run_script


spark = SparkSession\
    .builder\
    .appName('PhuseETL')\
    .config('spark.sql.warehouse.dir', 'data/spark-warehouse')\
    .getOrCreate()


# Load the source
src_path = 'data/source/csv'
src_file_names = get_fnames(src_path)

# create a python dictionary of dataframes
src_dfs = {}
for path, name in src_file_names:
    df_name = name.replace('.csv', '')
    src_dfs[df_name] = spark.read.csv(path, header=True, inferSchema=True)

# create row number field for every table and populate it
window = Window.orderBy(lit(1))
for key, df in src_dfs.items():
    src_dfs[key] = df.withColumn("row_id", row_number().over(window))

spark.sql("DROP DATABASE IF EXISTS src CASCADE")
spark.sql("CREATE DATABASE src")

# save source dataframes as managed tables in the src database (schema)
for key, df in src_dfs.items():
    df.write.format("parquet")\
        .mode("overwrite")\
        .option("compression", "snappy")\
        .saveAsTable(f'src.{key}')

# load supplementary tables, like dose frequencies mapping
resources_path = 'resources'
resources_file_names = get_fnames(resources_path)

resources_dfs = {}
for path, name in resources_file_names:
    df_name = name.replace('.csv', '')
    resources_dfs[df_name] = spark\
        .read\
        .csv(path, header=True, inferSchema=True, sep=',')

spark.sql("DROP DATABASE IF EXISTS temp CASCADE")
spark.sql("CREATE DATABASE temp")

for key, df in resources_dfs.items():
    df.write.format("parquet")\
        .mode("overwrite")\
        .option("compression", "snappy")\
        .saveAsTable(f'temp.{key}')

# create empty cdm tables
run_script(spark, 'src/sql/cdm_ddl.sql')

# load vocabs
vocab_std_path = 'vocab/omop'
vocab_std_file_names = get_fnames(vocab_std_path)

std_vocab_dfs = {}
for path, name in vocab_std_file_names:
    df_name = name.replace('.csv', '')
    std_vocab_dfs[df_name] = spark.read.csv(
        path,
        header=True,
        inferSchema=True,
        sep='\t')

for table_name, df in std_vocab_dfs.items():
    df.createOrReplaceTempView("src_" + table_name.lower())

# load custom vocabularies as one source_to_concept_map dataset
custom_vocab_df = spark.read.csv(
    'vocab/custom/*.csv',
    header=True,
    inferSchema=True)
custom_vocab_df.createOrReplaceTempView('src_source_to_concept_map')

# load custom concepts
custom_concepts_path = 'vocab/custom_concept'
custom_concepts_file_names = get_fnames(custom_concepts_path)

custom_concepts_dfs = {}
for path, name in custom_concepts_file_names:
    df_name = name.replace('.csv', '')
    custom_concepts_dfs[df_name] = spark\
        .read\
        .csv(path, header=True, inferSchema=True, sep=',')

for table_name, df in custom_concepts_dfs.items():
    df.createOrReplaceTempView("src_custom_" + table_name.lower())

# populate vocab.* tables from temp views
run_script(spark, 'src/sql/load_stnd_vocabs.sql')

# insert to the vocab.* tables custom concepts and relations
run_script(spark, 'src/sql/load_custom_concepts.sql')

# populate source_codes_raw
run_script(spark, 'src/sql/source_codes_raw.sql')

# populate source_codes_mapped
run_script(spark, 'src/sql/source_codes_mapped.sql')

# populate cdm.person table
run_script(spark, 'src/sql/cdm_person.sql')

# populate cdm.observation_period table
run_script(spark, 'src/sql/cdm_observation_period.sql')

# populate cdm.visit_occurrence table
run_script(spark, 'src/sql/cdm_visit_occurrence.sql')

# create the clinical_events lookup table
run_script(spark, 'src/sql/clinical_events.sql')

# populate cdm.death table
run_script(spark, 'src/sql/cdm_death.sql')

# create the clinical_events_cleaned lookup table
run_script(spark, 'src/sql/clinical_events_cleaned.sql')

# create a table for storing duplicates ids
run_script(spark, 'src/sql/duplicates.sql')

# populate cdm.condition_occurrence
run_script(spark, 'src/sql/cdm_condition_occurrence.sql')


# populate cdm.observation
run_script(spark, 'src/sql/cdm_observation.sql')


# populate cdm.cohort_definition
run_script(spark, 'src/sql/cdm_cohort_definition.sql')

# populate cdm.cohort
run_script(spark, 'src/sql/cdm_cohort.sql')

# populate cdm.metadata
run_script(spark, 'src/sql/cdm_metadata.sql')

# populate cdm.cdm_source
run_script(spark, 'src/sql/cdm_source.sql')

# ------------------- export cdm tables --------------------
cdm_schema = spark.sql('show tables in cdm')
cdm_tables = [row['tableName'] for row in cdm_schema.rdd.collect()
              if not row['isTemporary']]

for tbl in cdm_tables:
    export_tbl = spark.sql(f'select * from cdm.{tbl}')
    export_tbl.toPandas().to_csv(f'data/cdm/{tbl}.csv', index=False)


# export the clinical_events lookup for testing purposes
df = spark.sql('select * from temp.clinical_events')
df.toPandas().to_csv('data/cdm/clinical_events_lk.csv', index=False)

# export the clinical_events_cleaned lookup for testing purposes
df = spark.sql('select * from temp.clinical_events_cleaned')
df.toPandas().to_csv('data/cdm/clinical_events_cleaned_lk.csv', index=False)

# run tests
run_script(spark, 'src/qa/integration_tests.sql')

# export test report
df = spark.sql('select * from temp.test_report order by test_id')
df.toPandas().to_csv('data/cdm/test_report.csv', index=False)


# Stop the session
spark.stop()

# cleaning up
shutil.rmtree('data/spark-warehouse')
