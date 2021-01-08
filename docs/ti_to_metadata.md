## Table name: metadata

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
