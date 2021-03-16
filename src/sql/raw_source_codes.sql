-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------

DROP TABLE IF EXISTS temp.raw_source_codes PURGE;

CREATE TABLE temp.raw_source_codes
  (
     domain_id     STRING,
     vocabulary_id STRING,
     concept_code  STRING,
     source_code   STRING,
     concept_name  STRING
  ) using parquet;


-------------------------------------------------------------------
-- DM: CODES FOR ETHNICITY
-------------------------------------------------------------------

INSERT INTO temp.raw_source_codes
SELECT DISTINCT 'Ethnicity'
                AS domain_id,
                Coalesce(stcm.source_vocabulary_id, 'PHUSE_Unknown_DM_ETHNIC')
                AS vocabulary_id,
                stcm.source_code
                AS concept_code,
                src.ethnic
                AS source_code,
                Coalesce(stcm.source_code_description, src.ethnic)
                AS concept_name
FROM   src.dm src
       LEFT JOIN vocab.source_to_concept_map stcm
              ON stcm.source_code = src.ethnic
                 AND stcm.source_vocabulary_id = 'PHUSE_DM_ETHNIC_maps_to'
                 AND stcm.invalid_reason IS NULL;


-------------------------------------------------------------------
-- DM: CODES FOR RACE
-------------------------------------------------------------------

INSERT INTO temp.raw_source_codes
SELECT DISTINCT 'Race'
                AS domain_id,
                Coalesce(stcm.source_vocabulary_id, 'PHUSE_Unknown_DM_RACE')
                AS vocabulary_id,
                stcm.source_code
                AS concept_code,
                src.race
                AS source_code,
                Coalesce(stcm.source_code_description, src.race)
                AS concept_name
FROM   src.dm src
       LEFT JOIN vocab.source_to_concept_map stcm
              ON stcm.source_code = src.race
                 AND stcm.source_vocabulary_id = 'PHUSE_DM_RACE_maps_to'
                 AND stcm.invalid_reason IS NULL;
