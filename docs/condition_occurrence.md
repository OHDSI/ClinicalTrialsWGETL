## Table name: condition_occurrence

### Reading from Adverse Events: MedDRA codes (src.AE.AELLT)

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| condition_occurrence_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = src.ae.usubjid` |  |
| condition_concept_id | msc.target_concept_id | `COALESCE(msc.target_concept_id, 0)` </br> `LEFT JOIN mapped_source_codes msc`</br> `ON msc.source_code = src.ae.aellt`</br> `AND msc.source_vocabulary_id = 'PHUSE_MedDRA'` |  |
| condition_start_date | src.ae.aestdtc |  |  |
| condition_start_datetime | NULL |  |  |
| condition_end_date | src.ae.aeendtc |  |  |
| condition_end_datetime | NULL |  |  |
| condition_type_concept_id |  | Populate with 32809 | Case Report Form |
| stop_reason | NULL |  |  |
| provider_id | NULL |  |  |
| visit_occurrence_id | NULL |  |  |
| visit_detail_id | NULL |  |  |
| condition_source_value | src.ae.aellt |  |
| condition_source_concept_id |  | Populate with 0 |  |
| condition_status_source_value | NULL |  |  |
| condition_status_concept_id |  | Populate with 0 |  |
| rule_id |  | Populate with 'AE.1.AELLT' | Temp field for ETL |
| src |  | Populate with 'AE' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |