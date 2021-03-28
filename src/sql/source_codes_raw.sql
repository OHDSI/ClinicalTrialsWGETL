-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.source_codes_raw PURGE;

CREATE TABLE temp.source_codes_raw
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
INSERT INTO temp.source_codes_raw
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
INSERT INTO temp.source_codes_raw
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

-------------------------------------------------------------------
-- AE: MedDRA codes
-------------------------------------------------------------------
INSERT INTO temp.source_codes_raw
SELECT DISTINCT 'Condition'
                AS domain_id,
                Coalesce(stcm.source_vocabulary_id, 'PHUSE_Unknown_MedDRA')
                AS vocabulary_id,
                stcm.source_code
                AS concept_code,
                src.aellt
                AS source_code,
                Coalesce(stcm.source_code_description, src.aellt)
                AS concept_name
FROM   src.ae src
       LEFT JOIN vocab.source_to_concept_map stcm
              ON stcm.source_code = src.aellt
                 AND stcm.source_vocabulary_id = 'PHUSE_MedDRA'
                 AND stcm.invalid_reason IS NULL;

-------------------------------------------------------------------
-- AE: Severity
-------------------------------------------------------------------
INSERT INTO temp.source_codes_raw
SELECT DISTINCT 'Observation'
                AS domain_id,
                Coalesce(stcm.source_vocabulary_id, 'PHUSE_Unknown_AE_AESEV')
                AS vocabulary_id,
                stcm.source_code
                AS concept_code,
                'Severity/Intensity'
                     || '|'
                     || src.aesev
                AS source_code,
                Coalesce(stcm.source_code_description, 'Severity/Intensity'
                     || '|'
                     || src.aesev)
                AS concept_name
FROM   src.ae src
       LEFT JOIN vocab.source_to_concept_map stcm
              ON stcm.source_code = 'Severity/Intensity'
                   || '|'
                   || src.aesev
                 AND stcm.source_vocabulary_id = 'PHUSE_AE_AESEV'
                 AND stcm.invalid_reason IS NULL;

-------------------------------------------------------------------
-- AE: Seriousness
-------------------------------------------------------------------
INSERT INTO temp.source_codes_raw
SELECT DISTINCT 'Observation'
                AS domain_id,
                Coalesce(stcm.source_vocabulary_id, 'PHUSE_Unknown_AE_AESER')
                AS vocabulary_id,
                stcm.source_code
                AS concept_code,
                'Serious Event'
                     || '|'
                     || src.aeser
                AS source_code,
                Coalesce(stcm.source_code_description, 'Serious Event'
                     || '|'
                     || CASE
                            WHEN aeser = 'Y' THEN 'Yes'
                            WHEN aeser = 'N' THEN 'No'
                            ELSE ''
                          end)
                AS concept_name
FROM   src.ae src
       LEFT JOIN vocab.source_to_concept_map stcm
              ON stcm.source_code = 'Serious Event'
                   || '|'
                   || src.aeser
                 AND stcm.source_vocabulary_id = 'PHUSE_AE_AESER'
                 AND stcm.invalid_reason IS NULL;

-------------------------------------------------------------------
-- AE: Relation to the Study Drug
-------------------------------------------------------------------
INSERT INTO temp.source_codes_raw
SELECT DISTINCT 'Observation'
                AS domain_id,
                Coalesce(stcm.source_vocabulary_id, 'PHUSE_Unknown_AE_AEREL')
                AS vocabulary_id,
                stcm.source_code
                AS concept_code,
                'Relationship to Study Drug (Causality)'
                     || '|'
                     || src.aerel
                AS source_code,
                Coalesce(stcm.source_code_description, 'Relationship to Study Drug (Causality)'
                     || '|'
                     || src.aerel)
                AS concept_name
FROM   src.ae src
       LEFT JOIN vocab.source_to_concept_map stcm
              ON stcm.source_code = 'Relationship to Study Drug (Causality)'
                   || '|'
                   || src.aerel
                 AND stcm.source_vocabulary_id = 'PHUSE_AE_AEREL'
                 AND stcm.invalid_reason IS NULL;

-------------------------------------------------------------------
-- AE: Outcome of Adverse Event
-------------------------------------------------------------------
INSERT INTO temp.source_codes_raw
SELECT DISTINCT 'Observation'
                AS domain_id,
                Coalesce(stcm.source_vocabulary_id, 'PHUSE_Unknown_AE_AEOUT')
                AS vocabulary_id,
                stcm.source_code
                AS concept_code,
                'Outcome of Adverse Event'
                     || '|'
                     || src.aeout
                AS source_code,
                Coalesce(stcm.source_code_description, 'Outcome of Adverse Event'
                     || '|'
                     || src.aeout)
                AS concept_name
FROM   src.ae src
       LEFT JOIN vocab.source_to_concept_map stcm
              ON stcm.source_code = 'Outcome of Adverse Event'
                   || '|'
                   || src.aeout
                 AND stcm.source_vocabulary_id = 'PHUSE_AE_AEOUT'
                 AND stcm.invalid_reason IS NULL;

-------------------------------------------------------------------
-- AE: Occurred with Overdose
-------------------------------------------------------------------
INSERT INTO temp.source_codes_raw
SELECT DISTINCT 'Observation'
                AS domain_id,
                Coalesce(stcm.source_vocabulary_id, 'PHUSE_Unknown_AE_AESOD')
                AS vocabulary_id,
                stcm.source_code
                AS concept_code,
                'Occurred with Overdose'
                     || '|'
                     || src.aesod
                AS source_code,
                Coalesce(stcm.source_code_description, 'Occurred with Overdose'
                     || '|'
                     || CASE
                            WHEN aesod = 'Y' THEN 'Yes'
                            WHEN aesod = 'N' THEN 'No'
                            ELSE ''
                          end)
                AS concept_name
FROM   src.ae src
       LEFT JOIN vocab.source_to_concept_map stcm
              ON stcm.source_code = 'Occurred with Overdose'
                   || '|'
                   || src.aesod
                 AND stcm.source_vocabulary_id = 'PHUSE_AE_AESOD'
                 AND stcm.invalid_reason IS NULL;
