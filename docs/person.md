## Table name: person

### Reading from dm.csv

Remove any rows with an empty subjid

![](md_files/image1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| person_id | usubjid | Convert to integer representation of subjid  OR auto-increment the person_id |  |
| person_source_value | usubjid |  |  |
| gender_concept_id | sex | Map to standard OMOP concept  M - 8507  F - 8532 |  |
| gender_source_value | sex |  |  |
| year_of_birth | age<br>dmdtc | YEAR(dmtc) - age<br> |  |
| month_of_birth |  |  |  |
| day_of_birth |  |  |  |
| birth_datetime |  |  |  |
| death_datetime |  |  |  |
| race_concept_id | race | Map to standard OMOP concept |  |
| race_source_value | race |  |  |
| ethnicity_concept_id | ethnic | Map to standard OMOP concept |  |
| ethnicity_source_value | ethnic |  |  |
| location_id |  |  |  |
| provider_id |  |  |  |
| care_site_id |  |  |  |
| gender_source_concept_id |  |  |  |
| race_source_concept_id |  |  |  |
| ethnicity_source_concept_id |  |  |  |

