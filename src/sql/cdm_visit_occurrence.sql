-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
TRUNCATE TABLE cdm.visit_occurrence;

DROP TABLE IF EXISTS temp.visit_occurrence;

CREATE TABLE temp.visit_occurrence
(
   visit_occurrence_id           INT,
   person_id                     INT,
   visit_concept_id              INT,
   visit_start_date              TIMESTAMP,
   visit_start_datetime          TIMESTAMP,
   visit_end_date                TIMESTAMP,
   visit_end_datetime            TIMESTAMP,
   visit_type_concept_id         INT,
   provider_id                   INT,
   care_site_id                  INT,
   visit_source_value            STRING,
   unique_visit_source           STRING,  -- field to store unique visit IDs
   visit_source_concept_id       INT,
   admitting_source_concept_id   INT,
   admitting_source_value        STRING,
   discharge_to_concept_id       INT,
   discharge_to_source_value     STRING,
   preceding_visit_occurrence_id INT,
   rule_id                       STRING,
   src_tbl                       STRING,
   src_row                       INT
) using parquet;

-------------------------------------------------------------------
-- Populate temporary visit_occurrence table
-------------------------------------------------------------------
INSERT INTO temp.visit_occurrence
SELECT DISTINCT Row_number()
                  OVER (
                    ORDER BY src.row_id)           AS visit_occurrence_id,
                per.person_id                      AS person_id,
                COALESCE(msc.target_concept_id, 0) AS visit_concept_id,
                Cast(src.svstdtc AS DATE)          AS visit_start_date,
                NULL                               AS visit_start_datetime,
                Cast(src.svendtc AS DATE)          AS visit_end_date,
                NULL                               AS visit_end_datetime,
                32809                              AS visit_type_concept_id,
                NULL                               AS provider_id,
                NULL                               AS care_site_id,
                src.epoch
                || ':'
                || src.visit                       AS visit_source_value,
                src.usubjid
                || '|'
                || src.visitnum                    AS unique_visit_source,
                0                                  AS visit_source_concept_id,
                0                                  AS admitting_source_concept_id,
                NULL                               AS admitting_source_value,
                0                                  AS discharge_to_concept_id,
                NULL                               AS discharge_to_source_value,
                NULL                               AS preceding_visit_occurrence_id, 
                'sv.1.visitnum'                    AS rule_id,
                'sv'                               AS src_tbl,
                src.row_id                         AS src_row
FROM   src.sv src
       INNER JOIN cdm.person per
               ON per.person_source_value = src.usubjid
       LEFT JOIN temp.source_codes_mapped msc
              ON msc.source_code = src.epoch
                                   || ':'
                                   || src.visit
                 AND msc.source_vocabulary_id = 'PHUSE_SV_VISIT'
WHERE  src.svstdtc IS NOT NULL
       AND Cast(src.svstdtc AS DATE) BETWEEN Cast(
           Concat(per.year_of_birth, '-01-01') AS
           DATE) AND Cast('2015-03-31' AS DATE)   -- Interim Analysis Data Cutoff Date
       AND src.svendtc IS NOT NULL
       AND ( Cast(src.svendtc AS DATE) BETWEEN Cast(
             Concat(per.year_of_birth, '-01-01') AS
                   DATE) AND
              Cast ('2015-03-31' AS DATE)   -- Interim Analysis Data Cutoff Date
             AND Cast(src.svendtc AS DATE) >= Cast(src.svstdtc AS DATE) )
       AND NOT EXISTS (SELECT 1
                       FROM   src.dm dm
                       WHERE  dm.usubjid = per.person_source_value
                              AND dm.dthfl = 'Y'
                              AND dm.dthdtc IS NOT NULL
                              AND COALESCE(Cast(src.svendtc AS DATE), Cast(
                                  src.svstdtc AS DATE)
                                  ) >
                                  Date_add(Cast(dm.dthdtc AS DATE), 60));

-------------------------------------------------------------------
-- update preceding_visit_occurrence_id
-------------------------------------------------------------------
INSERT INTO cdm.visit_occurrence
SELECT tmp.visit_occurrence_id              AS visit_occurrence_id,
       tmp.person_id                        AS person_id,
       tmp.visit_concept_id                 AS visit_concept_id,
       tmp.visit_start_date                 AS visit_start_date,
       tmp.visit_start_datetime             AS visit_start_datetime,
       tmp.visit_end_date                   AS visit_end_date,
       tmp.visit_end_datetime               AS visit_end_datetime,
       tmp.visit_type_concept_id            AS visit_type_concept_id,
       tmp.provider_id                      AS provider_id,
       tmp.care_site_id                     AS care_site_id,
       tmp.visit_source_value               AS visit_source_value,
       tmp.visit_source_concept_id          AS visit_source_concept_id,
       tmp.admitting_source_concept_id      AS admitting_source_concept_id,
       tmp.admitting_source_value           AS admitting_source_value,
       tmp.discharge_to_concept_id          AS discharge_to_concept_id,
       tmp.discharge_to_source_value        AS discharge_to_source_value,
       Lag(tmp.visit_occurrence_id)
         OVER (
           partition BY tmp.person_id
           ORDER BY tmp.visit_start_date,
                    tmp.visit_end_date,
                    tmp.unique_visit_source
                )                           AS preceding_visit_occurrence_id,
       tmp.rule_id                          AS rule_id,
       tmp.src_tbl                          AS src_tbl,
       tmp.src_row                          AS src_row
FROM   temp.visit_occurrence tmp;
