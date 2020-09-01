## Table name: observation_period

### Mapping from cdm.person

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_period_id |  |  | Auto-increment |
| person_id | cdm.person.person_id |  |  |
| observation_period_start_date | src.dm.rficdtc | JOIN src.dm ON <br> src.dm.usubjid = cdm.person.person_source_value |  |
| observation_period_end_date | src.dm.rfpendtc | JOIN src.dm ON <br>  src.dm.usubjid = cdm.person.person_source_value  |  |
| period_type_concept_id |  | Populate with 44814723 — 'Period while enrolled in study' |  |
