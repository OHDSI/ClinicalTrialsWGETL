## Table name: cohort

### Planned Arm - Placebo

Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 1 - 'Planned Arm - Placebo' |  |
| subject_id | cdm.person.person_id | INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND  dm.armcd = 'Pbo' |  |
| cohort_start_date | dm.rfxstdtc | JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
| cohort_end_date | dm.rfpendtc | DATE(dm.rfpendtc) <br> JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
