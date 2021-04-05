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

# change current database to src
spark.sql("DROP DATABASE IF EXISTS src CASCADE")
spark.sql("CREATE DATABASE src")
spark.sql("USE src")

# save source dataframes as managed tables in the src database (schema)
for key, df in src_dfs.items():
    df.write.format("parquet")\
        .mode("overwrite")\
        .option("compression", "snappy")\
        .saveAsTable(key)

# create empty cdm tables
run_script(spark, 'src/sql/cdm_ddl.sql')

# load vocabs
vocab_std_path = 'vocab/omop'
vocab_std_file_names = get_fnames(vocab_std_path)

# create a python dictionary of dataframes
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

# populate vocab.* tables from temp views
run_script(spark, 'src/sql/load_stnd_vocabs.sql')

spark.sql("DROP DATABASE IF EXISTS temp CASCADE")
spark.sql("CREATE DATABASE temp")
spark.sql("USE temp")

# populate source_codes_raw
run_script(spark, 'src/sql/source_codes_raw.sql')

# populate source_codes_mapped
run_script(spark, 'src/sql/source_codes_mapped.sql')

# populate cdm.person table
run_script(spark, 'src/sql/cdm_person.sql')

# populate cdm.observation_period table
# run_script(spark, 'src/sql/cdm_observation_period.sql')

# create the clinical_events lokkup table
run_script(spark, 'src/sql/clinical_events.sql')

# create the clinical_events lookup table
run_script(spark, 'src/sql/clinical_events_cleaned.sql')

# create a table for storing duplicates ids
run_script(spark, 'src/sql/duplicates.sql')

# populate cdm.condition_occurrence
run_script(spark, 'src/sql/cdm_condition_occurrence.sql')


# ------------------- export results --------------------

# export cdm.location (empty)
df = spark.sql('select * from cdm.location')
df.toPandas().to_csv('data/cdm/location.csv', index=False)

# export cdm.care_site (empty)
df = spark.sql('select * from cdm.care_site')
df.toPandas().to_csv('data/cdm/care_site.csv', index=False)

# export cdm.provider (empty)
df = spark.sql('select * from cdm.provider')
df.toPandas().to_csv('data/cdm/provider.csv', index=False)

# export cdm.person as csv
df = spark.sql('select * from cdm.person')
df.toPandas().to_csv('data/cdm/person.csv', index=False)

# export cdm.observation_period
# df = spark.sql('select * from cdm.observation_period')
# df.toPandas().to_csv('data/cdm/observation_period.csv', index=False)

# export the clinical_events lookup for testing purposes
df = spark.sql('select * from temp.clinical_events')
df.toPandas().to_csv('data/cdm/clinical_events_lk.csv', index=False)

# export the clinical_events lookup for testing purposes
df = spark.sql('select * from temp.clinical_events_cleaned')
df.toPandas().to_csv('data/cdm/clinical_events_cleaned_lk.csv', index=False)

# export cdm.condition_occurrence as csv
df = spark.sql('select * from cdm.condition_occurrence')
df.toPandas().to_csv('data/cdm/condition_occurrence.csv', index=False)

# run tests
run_script(spark, 'qa/integration_tests.sql')

# export test report
df = spark.sql('select * from temp.test_report')
df.toPandas().to_csv('data/cdm/test_report.csv', index=False)


# Stop the session
spark.stop()

# cleaning up
shutil.rmtree('data/spark-warehouse')
