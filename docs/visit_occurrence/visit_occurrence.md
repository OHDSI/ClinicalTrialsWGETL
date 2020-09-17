## Table name: visit_occurrence

### Reading from sv.csv

![](md_files/image1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| visit_occurrence_id |  |  | Auto-increment |
| person_id | usubjid |  | Indirectly mapped from usubjid, which will represent the subject's person_source_value |
| visit_concept_id | epoch |  | Derived from visit_source_concept_id |
| visit_start_date | svstdtc |  | svstdtc is STRING format but written as YYYY-MM-DD; convert to DATE |
| visit_start_datetime | svstdtc |  | svstdtc is STRING format but written as YYYY-MM-DD; convert to DATETIME with time as 00:00:00 |
| visit_end_date | svendtc |  |  |
| visit_end_datetime | svendtc |  | svendtc is DATE format; convert to DATETIME with time as 00:00:00 |
| visit_type_concept_id |  |  | Hardcode as 32809 (Case Report Form) |
| provider_id |  |  |  |
| care_site_id |  |  |  |
| visit_source_value | visit<br>epoch |  | concatenation of epoch:visit |
| visit_source_concept_id | epoch |  | epoch mapped to one of 4 new concept IDs:   Screening visit  Follow-up visit  Scheduled visit  Unscheduled visit |
| admitting_source_concept_id |  |  |  |
| admitting_source_value |  |  |  |
| discharge_to_concept_id |  |  |  |
| discharge_to_source_value |  |  |  |
| preceding_visit_occurrence_id |  |  | Derived in ETL |

