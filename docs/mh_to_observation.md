## Medical History (mh) to observation

Each medical history record produces two observations:
- The history of the condition
- The severity of the condition

### Reading from mh.csv

![](md_files/image_mh_1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_id |  |  | Auto-increment |
| person_id | usubjid |  |  |
| observation_concept_id | mhcat | SIGNIFICANT PRE-EXISTING CONDITION - History of clinical finding in subject https://athena.ohdsi.org/search-terms/terms/4214956</br>HISTORICAL DIAGNOSIS - History of clinical finding in subject https://athena.ohdsi.org/search-terms/terms/4214956</br>PRIMARY DIAGNOSIS - ? | What is the clinical difference between these?<br> |
| observation_date | mhdtc |  |  |
| observation_datetime | mhdtc |  |  |
| observation_type_concept_id |  |  | 32809 - Case Report Form |
| value_as_number |  |  |  |
| value_as_string |  |  |  |
| value_as_concept_id | mhdecod | Lookup standard concept using MedDRA source vocabulary.</br>WHERE concept_name = mhdecod AND source_vocabulary_id = 'MedDRA' AND relationship_id = 'Maps to' | This field contains values equivalent to the Preferred Term (PT in MedDRA)<br> |
| qualifier_concept_id |  |  |  |
| unit_concept_id |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id | visit | Lookup visit_occurrence_id |  |
| visit_detail_id |  |  |  |
| observation_source_value |  |  |  |
| observation_source_concept_id |  |  |  |
| unit_source_value |  |  |  |
| qualifier_source_value |  |  |  |
| observation_event_id |  |  |  |
| obs_event_field_concept_id |  |  |  |
| value_as_datetime |  |  |  |


### Reading from mh.csv

![](md_files/image_mh_2.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_id |  |  | Auto-increment |
| person_id | usubjid |  |  |
| observation_concept_id | mhsev |  | 4077563 (‘Severity’) |
| observation_date | mhdtc |  |  |
| observation_datetime | mhdtc |  |  |
| observation_type_concept_id |  |  | 32809 - Case Report Form |
| value_as_number |  |  |  |
| value_as_string |  |  |  |
| value_as_concept_id | mhsev | If severity given:</br>Not severe - 764184</br>Mild - 4116992 </br>Moderate - 4285732</br>Severe - 4087703</br>https://athena.ohdsi.org/search-terms/terms/4153899 </br>If no severity given:</br>44805604 - Unknown severity |  |
| qualifier_concept_id |  |  |  |
| unit_concept_id |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id | visit | Lookup visit_occurrence_id |  |
| visit_detail_id |  |  |  |
| observation_source_value |  |  |  |
| observation_source_concept_id |  |  |  |
| unit_source_value |  |  |  |
| qualifier_source_value |  |  |  |
| observation_event_id | usubjid<br>mhseq | Use subjid and mhseq to lookup observation_id of history of observation to which this severity belongs.<br> |  |
| obs_event_field_concept_id |  |  | 1147762 - observation.observation_id (v6.0) |
| value_as_datetime |  |  |  |

