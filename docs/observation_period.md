## Table name: observation_period

The OBSERVATION_PERIOD table contains records that uniquely define the spans of time for which a Person is at-risk to have clinical events recorded within the source systems.

According to the conventions, the observation period start date should be when a person gave informed consent. However, since the current study does not capture this information in the database, the start date will be defined as the earliest date among all screening visits for a patient, so that no facts recorded at screening become outside the observation period.

### Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_period_id |  |  | Auto-increment |
| person_id | cdm.person.person_id |  |  |
| observation_period_start_date | sv.svstdtc | MIN(sv.svstdtc) <br> JOIN sv ON <br>  sv.usubjid = cdm.person.person_source_value <br> AND sv.visit = 'SCREENING' | Take the earliest date among SCREENING visits |
| observation_period_end_date | dm.rfpendtc | DATE(dm.rfpendtc) <br> JOIN dm ON <br> dm.usubjid = cdm.person.person_source_value | Extract date from the last disposition event date/timestamp |
| period_type_concept_id |  | Populate with 32809 — 'Case Report Form' | A new consolidated type concept for 4814723 — 'Period while enrolled in study' |
