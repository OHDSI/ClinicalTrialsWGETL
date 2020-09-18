## Table name: cohort_definition

### Planned Arm - Placebo

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 1 |  |
| cohort_definition_name |  | 'Planned Arm - Placebo' |  |
| cohort_definition_description |  | 'Planned Arm - Placebo'  |  |
| definition_type_concept_id |  | Populate with 0 |  |
| cohort_definition_syntax |  | SELECT person_id <br> FROM cdm.person <br> INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND dm.armcd = 'Pbo' |  |
| subject_concept_id |  | Populate with 1147314 — ‘person’ |  |
| cohort_initiation_date |  | current date |  |

### Planned Arm - Xanomeline High Dose

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 2 |  |
| cohort_definition_name |  | 'Planned Arm - Xanomeline High Dose' |  |
| cohort_definition_description |  | 'Planned Arm - Xanomeline High Dose'  |  |
| definition_type_concept_id |  | Populate with 0 |  |
| cohort_definition_syntax |  | SELECT person_id <br> FROM cdm.person <br> INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND dm.armcd = 'Xan_Hi' |  |
| subject_concept_id |  | Populate with 1147314 — ‘person’ |  |
| cohort_initiation_date |  | current date |  |

### Planned Arm - Xanomeline Low Dose

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 3 |  |
| cohort_definition_name |  | 'Planned Arm - Xanomeline Low Dose' |  |
| cohort_definition_description |  | 'Planned Arm - Xanomeline Low Dose'  |  |
| definition_type_concept_id |  | Populate with 0 |  |
| cohort_definition_syntax |  | SELECT person_id <br> FROM cdm.person <br> INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND dm.armcd = 'Xan_Lo' |  |
| subject_concept_id |  | Populate with 1147314 — ‘person’ |  |
| cohort_initiation_date |  | current date |  |

### Actual Arm - Placebo

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 4 |  |
| cohort_definition_name |  | 'Actual Arm - Placebo' |  |
| cohort_definition_description |  | 'Actual Arm - Placebo'  |  |
| definition_type_concept_id |  | Populate with 0 |  |
| cohort_definition_syntax |  | SELECT person_id <br> FROM cdm.person <br> INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND dm.actarmcd = 'Pbo' |  |
| subject_concept_id |  | Populate with 1147314 — ‘person’ |  |
| cohort_initiation_date |  | current date |  |

### Actual Arm - Xanomeline High Dose

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 5 |  |
| cohort_definition_name |  | 'Actual Arm - Xanomeline High Dose' |  |
| cohort_definition_description |  | 'Actual Arm - Xanomeline High Dose'  |  |
| definition_type_concept_id |  | Populate with 0 |  |
| cohort_definition_syntax |  | SELECT person_id <br> FROM cdm.person <br> INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND dm.actarmcd = 'Xan_Hi' |  |
| subject_concept_id |  | Populate with 1147314 — ‘person’ |  |
| cohort_initiation_date |  | current date |  |

### Actual Arm - Xanomeline Low Dose

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 6 |  |
| cohort_definition_name |  | 'Actual Arm - Xanomeline Low Dose' |  |
| cohort_definition_description |  | 'Actual Arm - Xanomeline Low Dose'  |  |
| definition_type_concept_id |  | Populate with 0 |  |
| cohort_definition_syntax |  | SELECT person_id <br>FROM   cdm.person <br>INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND  dm.actarmcd = 'Xan_Lo' |  |
| subject_concept_id |  | Populate with 1147314 — ‘person’ |  |
| cohort_initiation_date |  | current date |  |
