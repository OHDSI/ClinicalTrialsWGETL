# Clinical trial data conventions for the OMOP Common Data Model

The goal of this repository is to apply Clinical trial data conventions to the 'real' data.
As the first try, the PhUSE dataset has been chosen. It is a CDISC-compliant synthetic SDTM dataset.

For more information about the Clinical trials conventions, please visit our [wiki](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki) or download [pdf](docs/omop_clinical_trials_data_conventions_v1.0_July_2020.pdf) version.

## Clinical Trials Working Group

About the group - see [here](https://www.ohdsi.org/web/wiki/doku.php?id=projects:workgroups:clinicalstudy).

## Run ETL

The only thing you need to run the conversion locally is [Docker](https://www.docker.com). Instructions on how to install Docker on your system can be found at [the official site](https://www.docker.com/products/docker-desktop).
After getting it installed, follow these steps:
- Clone the repository into a folder on your machine.
~~~
$ git clone https://github.com/OHDSI/ClinicalTrialsWGETL.git
~~~
- Then, go inside the repository folder and run the following command:
~~~
$ docker-compose run --rm --service-ports phuse_etl
~~~


## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
