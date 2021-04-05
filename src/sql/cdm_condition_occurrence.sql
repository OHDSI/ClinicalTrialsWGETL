-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.condition_occurrence PURGE;

CREATE TABLE temp.condition_occurrence
using        parquet AS
SELECT co.*
FROM   cdm.condition_occurrence co
WHERE  FALSE;

-------------------------------------------------------------------
-- Populate temporary condition_occurrence table, before deduplication
-------------------------------------------------------------------
INSERT INTO temp.condition_occurrence
SELECT Row_number()
         OVER (
           ORDER BY src.src_tbl, src.src_row) AS condition_occurrence_id,
       src.person_id                          AS person_id,
       msc.target_concept_id                  AS condition_concept_id,
       src.event_start_date                   AS condition_start_date,
       NULL                                   AS condition_start_datetime,
       src.event_end_date                     AS condition_end_date,
       NULL                                   AS condition_end_datetime,
       src.event_type_concept_id              AS condition_type_concept_id,
       src.stop_reason                        AS stop_reason,
       NULL                                   AS provider_id,
       src.visit_occurrence_id                AS visit_occurrence_id,
       NULL                                   AS visit_detail_id,
       src.event_source_value                 AS condition_source_value,
       msc.source_concept_id                  AS condition_source_concept_id,
       NULL                                   AS condition_status_source_value,
       0                                      AS condition_status_concept_id,
       src.rule_id                            AS rule_id,
       src.src_tbl                            AS src_tbl,
       src.src_row                            AS src_row
FROM   temp.clinical_events_cleaned src
       INNER JOIN temp.source_codes_mapped msc
               ON msc.source_vocabulary_id IN (
                             src.source_vocabulary_id, src.default_vocabulary_id
                                              )
                  AND msc.source_code = src.event_source_value
                  AND COALESCE(msc.target_domain_id, msc.source_domain_id,
                      src.default_domain_id) =
                      'Condition';

-------------------------------------------------------------------
-- Match duplicating events with the first ones
-------------------------------------------------------------------
INSERT INTO temp.duplicates
SELECT 'Condition'                 AS domain_id,
       tmp.condition_occurrence_id AS prededup_id,
       Min(tmp.condition_occurrence_id)
         OVER (
           partition BY tmp.person_id,
           tmp.condition_concept_id,
           tmp.condition_start_date,
           tmp.condition_end_date,
           tmp.condition_type_concept_id,
           tmp.stop_reason,
           tmp.provider_id,
           tmp.visit_occurrence_id,
           tmp.condition_source_value,
           tmp.condition_source_concept_id
       )                           AS postdedup_id,
       tmp.src_tbl                 AS src_tbl,
       tmp.src_row                 AS src_row
FROM   temp.condition_occurrence tmp;

-------------------------------------------------------------------
-- Deduplicate and store as final cdm.condition_occurrence table
-------------------------------------------------------------------
TRUNCATE TABLE cdm.condition_occurrence;

INSERT INTO cdm.condition_occurrence
SELECT tmp.condition_occurrence_id,
       tmp.person_id,
       tmp.condition_concept_id,
       tmp.condition_start_date,
       tmp.condition_start_datetime,
       tmp.condition_end_date,
       tmp.condition_end_datetime,
       tmp.condition_type_concept_id,
       tmp.stop_reason,
       tmp.provider_id,
       tmp.visit_occurrence_id,
       tmp.visit_detail_id,
       tmp.condition_source_value,
       tmp.condition_source_concept_id,
       tmp.condition_status_source_value,
       tmp.condition_status_concept_id,
       tmp.rule_id,
       tmp.src_tbl,
       tmp.src_row
FROM   temp.condition_occurrence tmp
       INNER JOIN temp.duplicates dup
               ON dup.domain_id = 'Condition'
                  AND dup.prededup_id = tmp.condition_occurrence_id
WHERE  tmp.condition_occurrence_id = dup.postdedup_id;
