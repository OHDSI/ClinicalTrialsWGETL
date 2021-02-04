## Table name: observation

### Reading from dm.csv

![](md_files/image1_ta.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_id |  |  A unique system generated identifier | Auto-increment |
| person_id | usubjid |  | usubjid actually stored as person value and mapped to auto incremented person id<br> |
| observation_concept_id |  |  | set all records to concept_id = 37208111 (clinical trial arm) |
| observation_date | dmdtc |  |  |
| observation_datetime | dmdtc |  |  |
| observation_type_concept_id |  |  | use "Case Report Form" observation type: 32809 |
| value_as_number |  |  |  |
| value_as_string | arm<br>actarm |  | Source table contains 2 observations: arm and actarm. use a qualifier concept to distinguish |
| value_as_concept_id |  |  |  |
| qualifier_concept_id |  |  | for observation records derived from 'arm' field, hardcode 'Planned' qualifier concept id: 397943006 |
| unit_concept_id |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id |  |  |  |
| visit_detail_id |  |  |  |
| observation_source_value |  |  |  |
| observation_source_concept_id |  |  |  |
| unit_source_value |  |  |  |
| qualifier_source_value |  |  |  |
| observation_event_id |  |  |  |
| obs_event_field_concept_id |  |  |  |
| value_as_datetime |  |  |  |


### Reading from ds.csv

Trial outcomes

![](md_files/image2.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | usubjid |  |  |
| observation_concept_id | dsdecod | COMPLETED - 4042840 (completed trial)  SCREEN FAILURE - xxxxx (Not eligible to participate)  WITHDRAWAL BY SUBJECT - 4163733 (withdrawn from trial)  STUDY TERMINATED BY SPONSOR - 4163733 (withdrawn from trial)  DEATH - 4163733 (withdrawn from trial)    FINAL LAB VISIT - do not capture here  FINAL RETRIEVAL VISIT - do not capture here  PROTOCOL DEVIATION - do not capture here  ADVERSE EVENT - do not capture here | There are other values possible in the dsdecod field that still have to be covered in the logic<br> |
| observation_source_value | dsdecod |  |  |
| observation_date | dsstdtc |  |  |
| observation_datetime | dsstdtc |  |  |
| observation_type_concept_id |  |  | xxxxxx - Case Report Form |
| value_as_number |  |  |  |
| value_as_string |  |  |  |
| value_as_concept_id | dsdecod | WITHDRAWAL BY SUBJECT - xxxxx ("Patient decided to withdraw")  STUDY TERMINATED BY SPONSOR - xxxxxxx ("Withdrawn by investigator")  DEATH - 4306655 (Death) |  |
| qualifier_concept_id |  |  |  |
| unit_concept_id |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id |  |  |  |
| visit_detail_id |  |  |  |
| observation_source_concept_id |  |  |  |
| unit_source_value |  |  |  |
| qualifier_source_value |  |  |  |
| observation_event_id |  |  |  |
| obs_event_field_concept_id |  |  |  |
| value_as_datetime |  |  |  |

### Reading from sv.csv

![](md_files/image2_v.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_id |  |  | auto-increment |
| person_id | usubjid |  | Indirectly mapped from usubjid, which will represent the subject's person_source_value |
| observation_concept_id |  |  | new concept ID for "unscheduled visit reason"? |
| observation_date | svstdtc |  | svstdtc is STRING format but written as YYYY-MM-DD; convert to DATE (NOTE: svendtc will not be represented as there is no end date in the Observation table) |
| observation_datetime | svstdtc |  | svstdtc is STRING format but written as YYYY-MM-DD; convert to DATETIME with time as 00:00:00 (NOTE: svendtc will not be represented as there is no end date in the Observation table) |
| observation_type_concept_id |  |  | Hardcode as 32809 (Case Report Form) |
| value_as_number |  |  |  |
| value_as_string | svupdes |  | text of unscheduled visit reason |
| value_as_concept_id |  |  |  |
| qualifier_concept_id |  |  |  |
| unit_concept_id |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id |  |  | visit_occurrence_id for visit associated with the unscheduled visit reason |
| visit_detail_id |  |  |  |
| observation_source_value |  |  |  |
| observation_source_concept_id |  |  | new concept ID for "unscheduled visit reason"? |
| unit_source_value |  |  |  |
| qualifier_source_value |  |  |  |
| observation_event_id |  |  |  |
| obs_event_field_concept_id |  |  | visit_concept_id for visit associated with the unscheduled visit reason |
| value_as_datetime |  |  |  |
