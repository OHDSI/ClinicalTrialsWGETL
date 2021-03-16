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

# export the cdm tables that are not goinig to be populated
# cdm.location
df = spark.sql('select * from cdm.location')
df.toPandas().to_csv('data/cdm/location.csv', index=False)

# cdm.care_site
df = spark.sql('select * from cdm.care_site')
df.toPandas().to_csv('data/cdm/care_site.csv', index=False)

# cdm.provider
df = spark.sql('select * from cdm.provider')
df.toPandas().to_csv('data/cdm/provider.csv', index=False)


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

# populate raw_source_codes
run_script(spark, 'src/sql/raw_source_codes.sql')

# populate mapped_source_codes
run_script(spark, 'src/sql/mapped_source_codes.sql')

# populate cdm.person table
run_script(spark, 'src/sql/cdm_person.sql')


# export cdm.person as csv
df = spark.sql('select * from cdm.person')
df.toPandas().to_csv('data/cdm/person.csv', index=False)


# Stop the session
spark.stop()

# cleaining up
shutil.rmtree('data/spark-warehouse')
