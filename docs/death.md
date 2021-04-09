## Table name: death

### Reading from dm.csv

![](md_files/image1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = dm.usubjid` </br> `AND dm.dthfl = 'Y'` | A record should only exist if the death flag dthfl is 'Y' |
| death_date | dm.dthdtc |  |  |
| death_datetime | NULL |  |  |
| death_type_concept_id |  | Populate with 32809 | Case Report Form |
| cause_concept_id | msc.target_concept_id | `Coalesce(msc.target_concept_id, 0)` </br> `LEFT JOIN ae` </br> `ON ae.usubjid = dm.usubjid` </br> `AND ae.aeout = 'FATAL'` </br> `LEFT JOIN source_codes_mapped msc` </br> `ON msc.source_code = ae.aellt` </br> `AND msc.source_vocabulary_id = 'PHUSE_MedDRA'` |  |
| cause_source_value | ae.aellt | `LEFT JOIN ae` </br> `ON ae.usubjid = dm.usubjid` </br> `AND ae.aeout = 'FATAL'` |  |
| cause_source_concept_id |  | Populate with 0 |  |
