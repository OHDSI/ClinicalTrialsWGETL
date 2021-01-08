## Table name: observation

### Reading from dm.csv

![](md_files/image1_ta.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_id |  |  |  |
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

