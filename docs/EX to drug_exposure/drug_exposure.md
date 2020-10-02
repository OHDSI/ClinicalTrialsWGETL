## Table name: drug_exposure

### Reading from ex.csv

![](md_files/image1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| drug_exposure_id |  |  | Auto-increment |
| person_id | usubjid |  | Indirectly mapped from usubjid, which will represent the subject's person_source_value<br> |
| drug_concept_id | extrt<br>exdosu<br>exdosfrm |  | Combine extrt, exdosu and exdosfrm. A semantic mapping should be applied for the possible combinations (e.g. mapping to Xanomeline 50 mg oral tablet). |
| drug_exposure_start_date | exstdtc | if EXSTDTC includes timestamp, remove it for this target field |  |
| drug_exposure_start_datetime | exstdtc | if EXSTDTC does not include a timestamp, map time as 00:00 (midnight) |  |
| drug_exposure_end_date | exendtc | if EXENDTC includes timestamp, remove it for this target field |  |
| drug_exposure_end_datetime | exendtc | if EXENDTC does not include a timestamp, map time as 00:00 (midnight) |  |
| verbatim_end_date | exendtc | if EXENDTC includes timestamp, remove it for this target field |  |
| quantity | exdose | No EXDOSTXT in source data, so dose values will be numeric |  |
| drug_type_concept_id |  |  | Map to the new 'Case report form', concept_id 32809 |
| stop_reason |  |  |  |
| refills |  |  |  |
| days_supply |  |  |  |
| sig | exdose<br>exdosu<br>exdosfrm<br>exdosfrq |  | Concatenate exdose, exdosu, exdosfrm, exdosfrq (in that order) to capture the prescription / treatment issued. For example, 81mg patch QD |
| route_concept_id | exroute |  |  |
| lot_number |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id | visit<br>visitnum |  |  |
| visit_detail_id |  |  |  |
| drug_source_value | extrt |  |  |
| drug_source_concept_id |  |  |  |
| route_source_value | exroute |  |  |
| dose_unit_source_value | exdosu |  |  |

