## Table name: observation

### Mapping from Demographics: Trial Arm Assignment

</br>

![](md_files/image1_ta.png)

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  |  A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = dm.usubjid` |  |
| observation_concept_id |  | Populate with 37208111 | Clinical trial arm |
| observation_date | dm.dmdtc |  |  |
| observation_datetime | NULL |  |  |
| observation_type_concept_id |  | Populate with 32809 | Case Report Form |
| value_as_number | NULL |  |  |
| value_as_string | dm.arm<br>dm.actarm | `IF rule_id = 'dm.1.arm' THEN dm.arm`</br> `IF rule_id = 'dm.2.actarm' THEN dm.actarm` | Two inserts here |
| value_as_concept_id |  | Populate with 0 |  |
| qualifier_concept_id |  | `IF rule_id = 'dm.1.arm'`</br> `THEN 4161676`</br>`ELSE 0` | 4161676 - Planned |
| unit_concept_id | NULL |  |  |
| provider_id | NULL |  |  |
| visit_occurrence_id | cdm.visit_occurrence.visit_occurrence_id | `LEFT JOIN cdm.visit_occurrence` </br> <code>ON cdm.visit_occurrence.unique_visit_source = dm.usubjid &#124;&#124; '&#124;1.0'</code> |  |
| visit_detail_id | NULL |  |  |
| observation_source_value |  | Populate with 'Clinical trial arm' |  |
| observation_source_concept_id |  | Populate with 0 |  |
| unit_source_value | NULL |  |  |
| qualifier_source_value |  | `IF rule_id = 'dm.1.arm'`</br> `THEN 'Planned'`</br>`ELSE NULL` |  |
| observation_event_id | NULL |  |  |
| obs_event_field_concept_id |  | Populate with 0 |  |
| value_as_datetime | NULL |  | CDM v.6 field |
| rule_id |  | Populate with 'dm.1.arm'/'dm.2.actarm' | Temp field for ETL |
| src |  | Populate with 'dm' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br></br>

### Mapping from Disposition: Trial Enrollment and Trial Outcome

</br>

Trial outcomes

![](md_files/image2.png)

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = ds.usubjid` |  |
| observation_concept_id | dsdecod | COMPLETED - 4042840 (completed trial)  SCREEN FAILURE - xxxxx (Not eligible to participate)  WITHDRAWAL BY SUBJECT - 4163733 (withdrawn from trial)  STUDY TERMINATED BY SPONSOR - 4163733 (withdrawn from trial)  DEATH - 4163733 (withdrawn from trial)    FINAL LAB VISIT - do not capture here  FINAL RETRIEVAL VISIT - do not capture here  PROTOCOL DEVIATION - do not capture here  ADVERSE EVENT - do not capture here | There are other values possible in the dsdecod field that still have to be covered in the logic<br> |
| observation_source_value | ds.dsdecod |  |  |
| observation_date | ds.dsstdtc | `CAST(ds.dsstdtc AS date)` |  |
| observation_datetime | NULL |  |  |
| observation_type_concept_id |  | Populate with 32809  | Case Report Form |
| value_as_number | NULL |  |  |
| value_as_string | NULL |  |  |
| value_as_concept_id | dsdecod | WITHDRAWAL BY SUBJECT - xxxxx ("Patient decided to withdraw")  STUDY TERMINATED BY SPONSOR - xxxxxxx ("Withdrawn by investigator")  DEATH - 4306655 (Death) |  |
| qualifier_concept_id |  | Populate with 0 |  |
| unit_concept_id | NULL |  |  |
| provider_id | NULL |  |  |
| visit_occurrence_id | cdm.visit_occurrence.visit_occurrence_id | `LEFT JOIN cdm.visit_occurrence` </br> <code>ON cdm.visit_occurrence.unique_visit_source = ds.usubjid &#124;&#124; '&#124' &#124;&#124; ds.visitnum</code> |  |
| visit_detail_id | NULL |  |  |
| observation_source_concept_id |  | Populate with 0 |  |
| unit_source_value | NULL |  |  |
| qualifier_source_value | NULL |  |  |
| observation_event_id | NULL |  |  |
| obs_event_field_concept_id |  | Populate with 0 |  |
| value_as_datetime | NULL |  | CDM v.6 field |
| rule_id |  | Populate with 'ds.1.dsdecod' | Temp field for ETL |
| src |  | Populate with 'ds' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br></br>

### Reading from sv.csv

</br>

![](md_files/image2_v.png)

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | usubjid |  | Indirectly mapped from usubjid, which will represent the subject's person_source_value |
| observation_concept_id |  |  | new concept ID for "unscheduled visit reason"? |
| observation_date | svstdtc |  | svstdtc is STRING format but written as YYYY-MM-DD; convert to DATE (NOTE: svendtc will not be represented as there is no end date in the Observation table) |
| observation_datetime | svstdtc |  | svstdtc is STRING format but written as YYYY-MM-DD; convert to DATETIME with time as 00:00:00 (NOTE: svendtc will not be represented as there is no end date in the Observation table) |
| observation_type_concept_id |  |  | Hardcode as 32809 (Case Report Form) |
| value_as_number |  |  |  |
| value_as_string | svupdes |  | text of unscheduled visit reason |
| value_as_concept_id |  |  |  |
| qualifier_concept_id |  |  |  |
| unit_concept_id |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id |  |  | visit_occurrence_id for visit associated with the unscheduled visit reason |
| visit_detail_id |  |  |  |
| observation_source_value |  | ??? |  |
| observation_source_concept_id |  |  | new concept ID for "unscheduled visit reason"? |
| unit_source_value |  |  |  |
| qualifier_source_value |  |  |  |
| observation_event_id |  |  |  |
| obs_event_field_concept_id |  |  | visit_concept_id for visit associated with the unscheduled visit reason |
| value_as_datetime |  |  |  |
| rule_id |  | Populate with 'sv.1.'?? | Temp field for ETL |
| src |  | Populate with 'sv' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br></br>

### Mapping from Adverse Events: MedDRA codes (src.AE.AELLT)

</br>

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = ae.usubjid` |  |
| observation_concept_id | msc.target_concept_id | `COALESCE(msc.target_concept_id, 0)`</br></br> `LEFT JOIN source_codes_mapped msc`</br> `ON msc.source_code = ae.aellt`</br> `AND msc.source_vocabulary_id = 'PHUSE_MedDRA'` |  |
| observation_date | ae.aestdtc |  |  |
| observation_datetime | NULL |  |  |
| observation_type_concept_id |  | Populate with 32809 | Case Report Form |
| value_as_number | NULL |  |  |
| value_as_string | NULL |  |  |
| value_as_concept_id | msc.value_as_concept_id | `COALESCE(msc.target_concept_id, 0)`</br></br> `LEFT JOIN source_codes_mapped msc`</br> `ON msc.source_code = ae.aellt`</br> `AND msc.source_vocabulary_id = 'PHUSE_MedDRA'` |  |
| qualifier_concept_id |  | Populate with 0 |  |
| unit_concept_id | NULL |  | [THEMIS #11](https://github.com/OHDSI/Themis/issues/11) |
| provider_id | NULL |  |  |
| visit_occurrence_id | NULL |  |  |
| visit_detail_id | NULL |  |  |
| observation_source_value | ae.aellt |  |  |
| observation_source_concept_id |  | Populate with 0 |  |
| unit_source_value | NULL |  |  |
| qualifier_source_value | NULL |  |  |
| observation_event_id | NULL |  |  |
| obs_event_field_concept_id |  | Populate with 0 |  |
| value_as_datetime | NULL |  | CDM v6.0 field</br> should be excluded |
| rule_id |  | Populate with 'ae.1.aellt' | Temp field for ETL |
| src |  | Populate with 'ae' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from | Temp field for ETL |

</br></br>

### Mapping from Adverse Events: Severity/Intensity (src.AE.AESEV)

</br>

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = ae.usubjid` |  |
| observation_concept_id | msc.target_concept_id | `LEFT JOIN source_codes_mapped msc`</br> <code>ON msc.source_code = 'Severity/Intensity'</code></br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124;ae.aesev</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AESEV'` |  |
| observation_date | ae.aestdtc |  |  |
| observation_datetime | NULL |  |  |
| observation_type_concept_id |  | Populate with 32809 | Case Report Form |
| value_as_number | NULL |  |  |
| value_as_string | ae.aesev |  |  |
| value_as_concept_id | msc.value_as_concept_id | `COALESCE(msc.target_concept_id, 0)`</br></br> `LEFT JOIN source_codes_mapped msc`</br> <code>ON msc.source_code = 'Severity/Intensity'</code></br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124;ae.aesev</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AESEV'` |  |
| qualifier_concept_id |  | Populate with 0 |  |
| unit_concept_id | NULL |  | [THEMIS #11](https://github.com/OHDSI/Themis/issues/11) |
| provider_id | NULL |  |  |
| visit_occurrence_id | NULL |  |  |
| visit_detail_id | NULL |  |  |
| observation_source_value | ae.aesev | <code>'Severity/Intensity'</code></br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124;ae.aesev</code> |  |
| observation_source_concept_id |  | Populate with 0 |  |
| unit_source_value | NULL |  |  |
| qualifier_source_value | NULL |  |  |
| observation_event_id | cdm.condition_occurrence.</br>condition_occurrence_id,</br>cdm.observation.observation_id | `JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.2.aesev'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.2.aesev'`</br>`AND obs.src_row = cdm.observation.src_row`| [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| obs_event_field_concept_id |  | `IF co.condition_occurrence_id IS NOT NULL`</br>`THEN populate with 1147127 - condition_occurrence.`</br>`condition_occurrence_id`</br></br>`IF obs.observation_id IS NOT NULL`</br>`THEN populate with 1147165 - observation.observation_id`</br></br>`ELSE populate with 0 (or drop record)`</br></br>`JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.2.aesev'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.2.aesev'`</br>`AND obs.src_row = cdm.observation.src_row` | [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| value_as_datetime | NULL |  | CDM v6.0 field</br> should be excluded |
| rule_id |  | Populate with 'ae.2.aesev' | Temp field for ETL |
| src |  | Populate with 'ae' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br>

### Mapping from Adverse Events: Seriousness (src.AE.AESER)

</br>

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = ae.usubjid` |  |
| observation_concept_id | msc.target_concept_id | `LEFT JOIN source_codes_mapped msc`</br>`ON msc.source_code = 'Serious Event'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aeser</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AESER'` |  |
| observation_date | ae.aestdtc |  |  |
| observation_datetime | NULL |  |  |
| observation_type_concept_id |  | Populate with 32809 | Case Report Form |
| value_as_number | NULL |  |  |
| value_as_string | NULL |  |  |
| value_as_concept_id | msc.value_as_concept_id | `COALESCE(msc.target_concept_id, 0)`</br></br> `LEFT JOIN source_codes_mapped msc`</br> `ON msc.source_code = 'Serious Event'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aeser</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AESER'` |  |
| qualifier_concept_id |  | Populate with 0 |  |
| unit_concept_id | NULL |  | [THEMIS #11](https://github.com/OHDSI/Themis/issues/11) |
| provider_id | NULL |  |  |
| visit_occurrence_id | NULL |  |  |
| visit_detail_id | NULL |  |  |
| observation_source_value | ae.aeser | `'Serious Event'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aeser</code> |  |
| observation_source_concept_id |  | Populate with 0 |  |
| unit_source_value | NULL |  |  |
| qualifier_source_value | NULL |  |  |
| observation_event_id | cdm.condition_occurrence.</br>condition_occurrence_id,</br>cdm.observation.observation_id | `JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.3.aeser'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.3.aeser'`</br>`AND obs.src_row = cdm.observation.src_row`| [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| obs_event_field_concept_id |  | `IF co.condition_occurrence_id IS NOT NULL`</br>`THEN populate with 1147127 - condition_occurrence.`</br>`condition_occurrence_id`</br></br>`IF obs.observation_id IS NOT NULL`</br>`THEN populate with 1147165 - observation.observation_id`</br></br>`ELSE populate with 0 (or drop record)`</br></br>`JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.3.aeser'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.3.aeser'`</br>`AND obs.src_row = cdm.observation.src_row` | [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| value_as_datetime | NULL |  | CDM v6.0 field</br> should be excluded |
| rule_id |  | Populate with 'ae.3.aeser' | Temp field for ETL |
| src |  | Populate with 'ae' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br>

### Mapping from Adverse Events: Relation to the Study Drug (src.AE.AEREL)

</br>

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = ae.usubjid` |  |
| observation_concept_id | msc.target_concept_id | `LEFT JOIN source_codes_mapped msc`</br>`ON msc.source_code = 'Relationship to Study Drug (Causality)'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aerel</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AEREL'` |  |
| observation_date | ae.aestdtc |  |  |
| observation_datetime | NULL |  |  |
| observation_type_concept_id |  | Populate with 32809 | Case Report Form |
| value_as_number | NULL |  |  |
| value_as_string | NULL |  |  |
| value_as_concept_id | msc.value_as_concept_id | `COALESCE(msc.target_concept_id, 0)`</br></br> `LEFT JOIN source_codes_mapped msc`</br> `ON msc.source_code = 'Relationship to Study Drug (Causality)'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aerel</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AEREL'` |  |
| qualifier_concept_id |  | Populate with 0 |  |
| unit_concept_id | NULL |  | [THEMIS #11](https://github.com/OHDSI/Themis/issues/11) |
| provider_id | NULL |  |  |
| visit_occurrence_id | NULL |  |  |
| visit_detail_id | NULL |  |  |
| observation_source_value | ae.aerel | `'Relationship to Study Drug (Causality)'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aerel</code> |  |
| observation_source_concept_id |  | Populate with 0 |  |
| unit_source_value | NULL |  |  |
| qualifier_source_value | NULL |  |  |
| observation_event_id | cdm.condition_occurrence.</br>condition_occurrence_id,</br>cdm.observation.observation_id | `JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.4.aerel'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.4.aerel'`</br>`AND obs.src_row = cdm.observation.src_row`| [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| obs_event_field_concept_id |  | `IF co.condition_occurrence_id IS NOT NULL`</br>`THEN populate with 1147127 - condition_occurrence.`</br>`condition_occurrence_id`</br></br>`IF obs.observation_id IS NOT NULL`</br>`THEN populate with 1147165 - observation.observation_id`</br></br>`ELSE populate with 0 (or drop record)`</br></br>`JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.4.aerel'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.4.aerel'`</br>`AND obs.src_row = cdm.observation.src_row` | [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| value_as_datetime | NULL |  | CDM v6.0 field</br> should be excluded |
| rule_id |  | Populate with 'ae.4.aerel' | Temp field for ETL |
| src |  | Populate with 'ae' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br>

### Mapping from Adverse Events: Outcome of Adverse Event (src.AE.AEOUT)

</br>

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = ae.usubjid` |  |
| observation_concept_id | msc.target_concept_id | `LEFT JOIN source_codes_mapped msc`</br>`ON msc.source_code = 'Outcome of Adverse Event'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aeout</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AEOUT'` |  |
| observation_date | ae.aestdtc |  |  |
| observation_datetime | NULL |  |  |
| observation_type_concept_id |  | Populate with 32809 | Case Report Form |
| value_as_number | NULL |  |  |
| value_as_string | NULL |  |  |
| value_as_concept_id | msc.value_as_concept_id | `COALESCE(msc.target_concept_id, 0)`</br></br> `LEFT JOIN source_codes_mapped msc`</br> `ON msc.source_code = 'Outcome of Adverse Event'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aeout</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AEOUT'` |  |
| qualifier_concept_id |  | Populate with 0 |  |
| unit_concept_id | NULL |  | [THEMIS #11](https://github.com/OHDSI/Themis/issues/11) |
| provider_id | NULL |  |  |
| visit_occurrence_id | NULL |  |  |
| visit_detail_id | NULL |  |  |
| observation_source_value | ae.aeout | `'Outcome of Adverse Event'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aeout</code> |  |
| observation_source_concept_id |  | Populate with 0 |  |
| unit_source_value | NULL |  |  |
| qualifier_source_value | NULL |  |  |
| observation_event_id | cdm.condition_occurrence.</br>condition_occurrence_id,</br>cdm.observation.observation_id | `JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.5.aeout'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.5.aeout'`</br>`AND obs.src_row = cdm.observation.src_row`| [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| obs_event_field_concept_id |  | `IF co.condition_occurrence_id IS NOT NULL`</br>`THEN populate with 1147127 - condition_occurrence.`</br>`condition_occurrence_id`</br></br>`IF obs.observation_id IS NOT NULL`</br>`THEN populate with 1147165 - observation.observation_id`</br></br>`ELSE populate with 0 (or drop record)`</br></br>`JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.5.aeout'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.5.aeout'`</br>`AND obs.src_row = cdm.observation.src_row` | [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| value_as_datetime | NULL |  | CDM v6.0 field</br> should be excluded |
| rule_id |  | Populate with 'ae.5.aeout' | Temp field for ETL |
| src |  | Populate with 'ae' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br>

### Mapping from Adverse Events: Occurred with Overdose (src.AE.AESOD)

</br>

| Destination Field | Source field | Logic | Comment |
| --- | --- | --- | --- |
| observation_id |  | A unique system generated identifier | Auto-increment |
| person_id | cdm.person.person_id | `JOIN cdm.person` </br> `ON cdm.person.person_source_value = ae.usubjid` |  |
| observation_concept_id | msc.target_concept_id | `LEFT JOIN source_codes_mapped msc`</br>`ON msc.source_code = 'Occurred with Overdose'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aesod</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AESOD'` |  |
| observation_date | ae.aestdtc |  |  |
| observation_datetime | NULL |  |  |
| observation_type_concept_id |  | Populate with 32809 | Case Report Form |
| value_as_number | NULL |  |  |
| value_as_string | NULL |  |  |
| value_as_concept_id | msc.value_as_concept_id | `COALESCE(msc.target_concept_id, 0)`</br></br> `LEFT JOIN source_codes_mapped msc`</br> `ON msc.source_code = 'Occurred with Overdose'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aesod</code></br> `AND msc.source_vocabulary_id = 'PHUSE_AE_AESOD'` |  |
| qualifier_concept_id |  | Populate with 0 |  |
| unit_concept_id | NULL |  | [THEMIS #11](https://github.com/OHDSI/Themis/issues/11) |
| provider_id | NULL |  |  |
| visit_occurrence_id | NULL |  |  |
| visit_detail_id | NULL |  |  |
| observation_source_value | ae.aesod | `'Occurred with Overdose'`</br><code>&#124;&#124; '&#124;'</code></br><code>&#124;&#124; ae.aesod</code> |  |
| observation_source_concept_id |  | Populate with 0 |  |
| unit_source_value | NULL |  |  |
| qualifier_source_value | NULL |  |  |
| observation_event_id | cdm.condition_occurrence.</br>condition_occurrence_id,</br>cdm.observation.observation_id | `JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.6.aesod'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.6.aesod'`</br>`AND obs.src_row = cdm.observation.src_row`| [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| obs_event_field_concept_id |  | `IF co.condition_occurrence_id IS NOT NULL`</br>`THEN populate with 1147127 - condition_occurrence.`</br>`condition_occurrence_id`</br></br>`IF obs.observation_id IS NOT NULL`</br>`THEN populate with 1147165 - observation.observation_id`</br></br>`ELSE populate with 0 (or drop record)`</br></br>`JOIN cdm.condition_occurrence co`</br>`ON co.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.6.aesod'`</br>`AND co.src_row = cdm.observation.src_row`</br></br>`JOIN cdm.observation obs`</br>`ON obs.rule_id = 'ae.1.aellt'`</br>`AND cdm.observation.rule_id = 'ae.6.aesod'`</br>`AND obs.src_row = cdm.observation.src_row` | [see Topic 3](https://github.com/OHDSI/ClinicalTrialsWGETL/wiki/Topic-3:-Seriousness,-Severity-and-Causality) |
| value_as_datetime | NULL |  | CDM v6.0 field</br> should be excluded |
| rule_id |  | Populate with 'ae.6.aesod' | Temp field for ETL |
| src |  | Populate with 'ae' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

</br>

## Medical History (mh) to observation

</br>

Each medical history record produces two observations:
- The history of the condition
- The severity of the condition

### Reading from mh.csv

![](md_files/image_mh_1.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_id |  |  | Auto-increment |
| person_id | usubjid |  |  |
| observation_concept_id | | [History of clinical finding in subjec](https://athena.ohdsi.org/search-terms/terms/4214956)|  |
| observation_date | mhdtc |  |  |
| observation_datetime | mhdtc |  |  |
| observation_type_concept_id |  |  | 32809 - Case Report Form |
| value_as_number |  |  |  |
| value_as_string |  |  |  |
| value_as_concept_id | mhdecod | Lookup standard concept using MedDRA source vocabulary.</br>WHERE concept_name = mhdecod AND source_vocabulary_id = 'MedDRA' AND relationship_id = 'Maps to' | This field contains values equivalent to the Preferred Term (PT in MedDRA)<br> |
| qualifier_concept_id |  |  |  |
| unit_concept_id |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id | visit | Lookup visit_occurrence_id |  |
| visit_detail_id |  |  |  |
| observation_source_value | mhcat | SIGNIFICANT PRE-EXISTING CONDITION or HISTORICAL DIAGNOSIS or PRIMARY DIAGNOSIS |  |
| observation_source_concept_id |  |  |  |
| unit_source_value |  |  |  |
| qualifier_source_value |  |  |  |
| observation_event_id |  |  |  |
| obs_event_field_concept_id |  |  |  |
| value_as_datetime |  |  |  |
| rule_id |  | Populate with 'mh.1.mhcat' | Temp field for ETL |
| src |  | Populate with 'mh' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |

Note: we do loose information on the timeliness of the medical history, captured in the `mhstdtc` field as an approximate date. To capture this information, we can use the newly proposed history of concepts _within x years_: https://forums.ohdsi.org/t/history-of-condition-with-age/11470/18

### Reading from mh.csv

![](md_files/image_mh_2.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| observation_id |  |  | Auto-increment |
| person_id | usubjid |  |  |
| observation_concept_id | mhsev |  | 4077563 (‘Severity’) |
| observation_date | mhdtc |  |  |
| observation_datetime | mhdtc |  |  |
| observation_type_concept_id |  |  | 32809 - Case Report Form |
| value_as_number |  |  |  |
| value_as_string |  |  |  |
| value_as_concept_id | mhsev | If severity given:</br>Not severe - 764184</br>Mild - 4116992 </br>Moderate - 4285732</br>Severe - 4087703</br>https://athena.ohdsi.org/search-terms/terms/4153899 </br>If no severity given:</br>44805604 - Unknown severity |  |
| qualifier_concept_id |  |  |  |
| unit_concept_id |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id | visit | Lookup visit_occurrence_id |  |
| visit_detail_id |  |  |  |
| observation_source_value |  |  |  |
| observation_source_concept_id |  |  |  |
| unit_source_value |  |  |  |
| qualifier_source_value |  |  |  |
| observation_event_id | usubjid<br>mhseq | Use subjid and mhseq to lookup observation_id of history of observation to which this severity belongs.<br> |  |
| obs_event_field_concept_id |  |  | 1147762 - observation.observation_id (v6.0) |
| value_as_datetime |  |  |  |
| rule_id |  | Populate with 'mh.2.???' | Temp field for ETL |
| src |  | Populate with 'mh' | Temp field for ETL |
| src_row |  | Populate with the row number of the source table this record came from| Temp field for ETL |
