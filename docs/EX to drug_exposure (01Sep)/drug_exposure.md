## Table name: drug_exposure

### Reading from ex.csv

![](md_files/image1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| drug_exposure_id |  |  | Auto-increment |
| person_id | usubjid |  |  |
| drug_concept_id |  |  |  |
| drug_exposure_start_date | exstdtc | if EXSTDTC includes timestamp, remove it for this target field |  |
| drug_exposure_start_datetime | exstdtc | if EXSTDTC does not include a timestamp, don't map to this target field |  |
| drug_exposure_end_date | exendtc | if EXENDTC includes timestamp, remove it for this target field |  |
| drug_exposure_end_datetime | exendtc | if EXENDTC does not include a timestamp, don't map to this target field |  |
| verbatim_end_date | exendtc | if EXENDTC includes timestamp, remove it for this target field |  |
| quantity | exdose | No EXDOSTXT in source data, so dosa values will be numeric |  |
| drug_type_concept_id |  |  |  |
| stop_reason |  |  |  |
| refills |  |  |  |
| days_supply |  |  |  |
| sig |  |  | Do we do a concatenation of dose form, units and frequency?? |
| route_concept_id |  |  |  |
| lot_number |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id |  |  |  |
| visit_detail_id |  |  |  |
| drug_source_value | extrt |  |  |
| drug_source_concept_id |  |  |  |
| route_source_value | exroute |  |  |
| dose_unit_source_value | exdosu |  |  |

