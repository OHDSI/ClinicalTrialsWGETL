-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.source_codes_mapped PURGE;

CREATE TABLE temp.source_codes_mapped
  (
     source_code             STRING,
     source_concept_id       INT,
     source_vocabulary_id    STRING,
     source_code_description STRING,
     source_domain_id        STRING,
     target_concept_id       INT,
     target_vocabulary_id    STRING,
     target_domain_id        STRING,
     value_as_concept_id     INT,
     valid_start_date        TIMESTAMP,
     valid_end_date          TIMESTAMP,
     invalid_reason          STRING
  ) using parquet;

-------------------------------------------------------------------
-- Load Table: From source_to_concept_map table
-------------------------------------------------------------------
INSERT INTO temp.source_codes_mapped
SELECT DISTINCT rsrc.source_code                                          AS
                source_code,
                stcm.source_concept_id                                    AS
                source_concept_id,
                rsrc.vocabulary_id                                        AS
                source_vocabulary_id,
                Coalesce(stcm.source_code_description, rsrc.concept_name) AS
                source_code_description,
                rsrc.domain_id                                            AS
                source_domain_id,
                Coalesce(cs.concept_id, 0)                                AS
                target_concept_id,
                Coalesce(cs.vocabulary_id, 'None')                        AS
                target_vocabulary_id,
                cs.domain_id                                              AS
                target_domain_id,
                Coalesce(vstcm.target_concept_id, 0)                      AS
                value_as_concept_id,
                stcm.valid_start_date                                     AS
                valid_start_date,
                stcm.valid_end_date                                       AS
                valid_end_date,
                NULL                                                      AS
                invalid_reason
FROM   temp.source_codes_raw rsrc
       INNER JOIN vocab.source_to_concept_map stcm
               ON stcm.source_code = rsrc.source_code
                  AND stcm.source_vocabulary_id = rsrc.vocabulary_id
                  AND stcm.invalid_reason IS NULL
       LEFT JOIN vocab.concept cs
              ON cs.concept_id = stcm.target_concept_id
                 AND cs.concept_id != 0
                 AND cs.invalid_reason IS NULL
                 AND cs.standard_concept = 'S'
       LEFT JOIN vocab.source_to_concept_map vstcm
              ON vstcm.source_code = rsrc.source_code
                 AND vstcm.source_vocabulary_id = rsrc.vocabulary_id
                                                  || '_value'
                 AND vstcm.invalid_reason IS NULL
WHERE  NOT EXISTS (SELECT 1
                   FROM   vocab.concept
                   WHERE  concept_code = rsrc.source_code
                          AND vocabulary_id = rsrc.vocabulary_id);

-------------------------------------------------------------------
-- Load Table: Unmapped codes
-------------------------------------------------------------------
INSERT INTO temp.source_codes_mapped
SELECT DISTINCT rsrc.source_code                              AS source_code,
                0                                             AS
                source_concept_id,
                rsrc.default_vocabulary_id                    AS
                source_vocabulary_id,
                Coalesce(rsrc.concept_name, rsrc.source_code) AS
                source_code_description,
                rsrc.domain_id                                AS
                source_domain_id,
                0                                             AS
                target_concept_id,
                'None'                                        AS
                target_vocabulary_id,
                NULL                                          AS
                target_domain_id,
                0                                             AS
                value_as_concept_id,
                To_date('1970-01-01')                         AS
                valid_start_date,
                To_date('2099-12-31')                         AS valid_end_date,
                NULL                                          AS invalid_reason
FROM   temp.source_codes_raw rsrc
WHERE  NOT EXISTS (SELECT 1
                   FROM   vocab.concept
                   WHERE  concept_code = rsrc.source_code
                          AND vocabulary_id = rsrc.vocabulary_id)
       AND NOT EXISTS (SELECT 1
                       FROM   vocab.source_to_concept_map
                       WHERE  source_code = rsrc.source_code
                              AND source_vocabulary_id = rsrc.vocabulary_id);
