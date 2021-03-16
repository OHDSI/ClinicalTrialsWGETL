import os


def get_fnames(path):
    list_of_fnames = []
    for dirname, dirs, files in os.walk(path, topdown=True):
        for fname in files:
            if fname.endswith('.csv'):
                list_of_fnames.append((os.path.join(dirname, fname), fname))
    return list_of_fnames


def run_script(spark, scriptname):
    with open(scriptname, 'r') as script:
        queries = script.read()
    queries = queries.split(';')[: -1]
    for query in queries:
        spark.sql(query)
