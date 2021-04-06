## Table name: condition_occurrence

### Mapping from Adverse Events: MedDRA codes (src.AE.AELLT)

</br>

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| condition_occurrence_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = src.ae.usubjid` |  |
| condition_concept_id | msc.target_concept_id | `LEFT JOIN source_codes_mapped msc`</br> `ON msc.source_code = src.ae.aellt`</br> `AND msc.source_vocabulary_id = 'PHUSE_MedDRA'` |  |
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
| rule_id |  | Populate with 'ae.1.aellt' | Temp field for ETL |
| src |  | Populate with 'ae' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br>

### Mapping from Adverse Events: Persistant or Significant Disability/Incapacity (src.AE.AESDISAB)

</br>

Such events can be linked to the Adverse events (rule_id = 'AE.1.AELLT') via cdm.fact_relationship table.

</br>

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| condition_occurrence_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = src.ae.usubjid` |  |
| condition_concept_id | msc.target_concept_id | `LEFT JOIN source_codes_mapped msc`</br> `ON msc.source_code = 'Persist or Signif Disability/Incapacity'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; src.ae.aesdisab</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AESDISAB'` |  |
| condition_start_date | src.ae.aestdtc |  |  |
| condition_start_datetime | NULL |  |  |
| condition_end_date | NULL |  |  |
| condition_end_datetime | NULL |  |  |
| condition_type_concept_id |  | Populate with 32809 | Case Report Form |
| stop_reason | NULL |  |  |
| provider_id | NULL |  |  |
| visit_occurrence_id | NULL |  |  |
| visit_detail_id | NULL |  |  |
| condition_source_value | src.ae.aesdisab | `'Persist or Signif Disability/Incapacity'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; src.ae.aesdisab</code> |
| condition_source_concept_id |  | Populate with 0 |  |
| condition_status_source_value | NULL |  |  |
| condition_status_concept_id |  | Populate with 0 |  |
| rule_id |  | Populate with 'ae.7.aesdisab' | Temp field for ETL |
| src |  | Populate with 'ae' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |
