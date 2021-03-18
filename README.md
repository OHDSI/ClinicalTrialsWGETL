# Clinical trial data conventions for the OMOP Common Data Model

The goal of this repository is to apply Clinical trial data conventions to the 'real' data.
As the first try, the PhUSE dataset has been chosen. It is a CDISC-compliant synthetic SDTM dataset.

For more information about the Clinical trials conventions, please visit our [wiki](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki) or download [pdf](docs/omop_clinical_trials_data_conventions_v1.0_July_2020.pdf) version.

## Clinical Trials Working Group

About the group - see [here](https://www.ohdsi.org/web/wiki/doku.php?id=projects:workgroups:clinicalstudy).

## Run ETL

The ETL process is based on [Apache Spark&trade;](https://spark.apache.org) analytics engine running in a docker container. So the only thing you need is [Docker](https://www.docker.com). You can find instructions on how to install Docker on your system at [the official site](https://www.docker.com/products/docker-desktop).
After getting Docker installed, run the conversion in easy three steps:
1. Clone the repository into a folder on your machine:
~~~
$ git clone https://github.com/OHDSI/ClinicalTrialsWGETL.git
~~~
2. Download all the [necessary vocabularies](vocab/omop/README.md) from the Athena and put them into vocab/omop folder
3. And finally, from the root repository folder, run the following command:
~~~
$ docker-compose run --rm --service-ports phuse_etl  
~~~

After the conversion is done, resultant CDM tables (in csv format) are in the data/cdm folder.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
