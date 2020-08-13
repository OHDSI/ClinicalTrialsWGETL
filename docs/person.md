## Table name: person

### Reading from dm.csv

![](md_files/image1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| person_id | subjid |  |  |
| gender_concept_id | sex | Map to standard OMOP concept  M - 8507  F - 8532 |  |
| year_of_birth | age<br>dmdtc | dmtc - age<br> |  |
| month_of_birth |  |  |  |
| day_of_birth |  |  |  |
| birth_datetime |  |  |  |
| death_datetime |  |  |  |
| race_concept_id | race | Map to standard OMOP concept |  |
| ethnicity_concept_id | ethnic | Map to standard OMOP concept |  |
| location_id |  |  |  |
| provider_id |  |  |  |
| care_site_id |  |  |  |
| person_source_value |  |  |  |
| gender_source_value | sex |  |  |
| gender_source_concept_id |  |  |  |
| race_source_value | race |  |  |
| race_source_concept_id |  |  |  |
| ethnicity_source_value | ethnic |  |  |
| ethnicity_source_concept_id |  |  |  |

