## Table name: metadata


### Mapping from src.TS (Trial Summary)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| metadata_concept_id |  | Populate with 0 |  |
| metadata_type_concept_id |  | Populate with 0 |  |
| name | src.TS.TSPARM |  |  |
| value_as_string | src.TS.TSVAL |  |  |
| value_as_concept_id | cdm.concept.concept_id | JOIN cdm.concept ON </br> cdm.concept.concept_code = src.TS.TSVALCD </br> AND cdm.concept.vocabulary_id = src.TS.TSVALCD |  |
| metadata_date |  | current date  |  |
| metadata_datetime | NULL |  |  |

### Mapping from src.TI (Trial Inclusion / Exclusion Criteria)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| metadata_concept_id |  | Populate with 0 |  |
| metadata_type_concept_id |  | Populate with 0 |  |
| name | src.TI.IETESTCD |  |  |
| value_as_string | src.TI.IETEST |  |  |
| value_as_concept_id | NULL |  |  |
| metadata_date |  | current date |  |
| metadata_datetime | NULL |  |  |