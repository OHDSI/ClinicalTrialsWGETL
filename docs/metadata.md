## Table name: metadata


### Mapping from src.TS (Trial Summary)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| metadata_concept_id |  | Populate with 0 |  |
| metadata_type_concept_id |  | Populate with 0 |  |
| name | ts.tsparm |  |  |
| value_as_string | ts.tsval |  |  |
| value_as_concept_id |  | Populate with 0 |  |
| metadata_date |  | current date  |  |
| metadata_datetime | NULL |  |  |


### Mapping from src.TI (Trial Inclusion / Exclusion Criteria)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| metadata_concept_id |  | Populate with 0 |  |
| metadata_type_concept_id |  | Populate with 0 |  |
| name | ti.ietestcd |  |  |
| value_as_string | ti.ietest |  |  |
| value_as_concept_id |  | Populate with 0 |  |
| metadata_date |  | current date |  |
| metadata_datetime | NULL |  |  |
