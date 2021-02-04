## Table name: cohort

### Planned Arm - Placebo

Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 1 - 'Planned Arm - Placebo' |  |
| subject_id | cdm.person.person_id | INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND  dm.armcd = 'Pbo' |  |
| cohort_start_date | dm.rfxstdtc | JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
| cohort_end_date | dm.rfpendtc | DATE(dm.rfpendtc) <br> JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |

### Planned Arm - Xanomeline High Dose

Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 2 - 'Planned Arm - Xanomeline High Dose |  |
| subject_id | cdm.person.person_id | INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND  dm.armcd = 'Xan_Hi' |  |
| cohort_start_date | dm.rfxstdtc | JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
| cohort_end_date | dm.rfpendtc | DATE(dm.rfpendtc) <br> JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |

### Planned Arm - Xanomeline Low Dose

Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 3 - 'Planned Arm - Xanomeline Low Dose |  |
| subject_id | cdm.person.person_id | INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND  dm.armcd = 'Xan_Lo' |  |
| cohort_start_date | dm.rfxstdtc | JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
| cohort_end_date | dm.rfpendtc | DATE(dm.rfpendtc) <br> JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |

### Actual Arm - Placebo

Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 4 - 'Actual Arm - Placebo' |  |
| subject_id | cdm.person.person_id | INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND  dm.actarmcd = 'Pbo' |  |
| cohort_start_date | dm.rfxstdtc | JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
| cohort_end_date | dm.rfpendtc | DATE(dm.rfpendtc) <br> JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |

### Actual Arm - Xanomeline High Dose

Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 5 - 'Actual Arm - Xanomeline High Dose' |  |
| subject_id | cdm.person.person_id | INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND  dm.actarmcd = 'Xan_Hi' |  |
| cohort_start_date | dm.rfxstdtc | JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
| cohort_end_date | dm.rfpendtc | DATE(dm.rfpendtc) <br> JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |

### Actual Arm - Xanomeline Low Dose

Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cohort_definition_id |  | Populate with 6 - 'Actual Arm - Xanomeline Low Dose' |  |
| subject_id | cdm.person.person_id | INNER JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value <br> AND  dm.actarmcd = 'Xan_Lo' |  |
| cohort_start_date | dm.rfxstdtc | JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
| cohort_end_date | dm.rfpendtc | DATE(dm.rfpendtc) <br> JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value |  |
