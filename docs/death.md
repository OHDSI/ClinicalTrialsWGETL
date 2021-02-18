## Table name: death

### Reading from dm.csv

![](md_files/image1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| person_id | dthfl<br>usubjid |  | A record should only exist if the death flag dthfl is Y.<br>Indirectly mapped from usubjid, which will represent the subject's person_source_value<br> |
| death_date | dthdtc |  | if field includes timestamp, remove it for this target field<br> |
| death_datetime | dthdtc |  | if field does not include a timestamp, map time as 00:00 (midnight)<br> |
| death_type_concept_id |  |  | Perhaps we need to link to observation to figure out more death details? |
| cause_concept_id |  |  |  |
| cause_source_value |  |  | Mike / Bess - Where is this captured in SDTM source data? |
| cause_source_concept_id |  |  |  |

