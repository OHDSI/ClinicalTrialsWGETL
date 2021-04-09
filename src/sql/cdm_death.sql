-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
TRUNCATE TABLE cdm.death;

INSERT INTO cdm.death
SELECT DISTINCT per.person_id                      AS person_id,
                Cast(src.dthdtc AS date)           AS death_date,
                NULL                               AS death_datetime,
                32809                              AS death_type_concept_id, -- 'Case Report Form'  
                Coalesce(msc.target_concept_id, 0) AS cause_concept_id,
                ce.event_source_value              AS cause_source_value,
                msc.source_concept_id              AS cause_source_concept_id,
                'death'                            AS rule_id,
                'dm'                               AS src_tbl,
                src.row_id                         AS src_row
FROM   src.dm src
       INNER JOIN cdm.person per
               ON per.person_source_value = src.usubjid
       LEFT JOIN temp.clinical_events ce
              ON ce.person_source_value = src.usubjid
                 AND ce.stop_reason = 'FATAL'
                 AND ce.rule_id = 'ae.1.aellt'
       LEFT JOIN temp.source_codes_mapped msc
              ON msc.source_vocabulary_id IN (
                 ce.source_vocabulary_id, ce.default_vocabulary_id
                         )
                 AND msc.source_code = ce.event_source_value
WHERE  src.dthfl = 'Y'
       AND src.dthdtc IS NOT NULL;
