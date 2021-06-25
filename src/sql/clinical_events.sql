-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.clinical_events PURGE;

CREATE TABLE temp.clinical_events
  (
     person_source_value        STRING,
     event_start_date           TIMESTAMP,
     event_start_datetime       TIMESTAMP,
     event_end_date             TIMESTAMP,
     event_end_datetime         TIMESTAMP,
     operator_source_value      STRING,
     unique_visit_source        STRING,
     event_source_value         STRING,
     value_source_value         STRING,
     value_as_number            DOUBLE,
     value_as_string            STRING,
     range_low                  DOUBLE,
     range_high                 DOUBLE,
     unit_source_value          STRING,
     frequency                  STRING,
     quantity                   DOUBLE,
     days_supply                INT,
     sig                        STRING,
     stop_reason                STRING,
     route_source_value         STRING,
     source_vocabulary_id       STRING,
     default_vocabulary_id      STRING,
     value_source_vocabulary_id STRING,
     default_domain_id          STRING,
     event_type_concept_id      INT,
     rule_id                    STRING,
     src_tbl                    STRING,
     src_row                    INT
  ) using parquet;


-------------------------------------------------------------------
-- AE: MedDRA
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                    AS person_source_value,
       CAST(src.aestdtc AS date)      AS event_start_date,
       NULL                           AS event_start_datetime,
       IFNULL(
           CAST(src.aeendtc AS date),
           imp.end_date                                     -- impute with the max date in the src.ds table
            )                         AS event_end_date,
       NULL                           AS event_end_datetime,
       NULL                           AS operator_source_value,
       NULL                           AS unique_visit_source,
       src.aellt                      AS event_source_value,
       NULL                           AS value_source_value,
       NULL                           AS value_as_number,
       NULL                           AS value_as_string,
       NULL                           AS range_low,
       NULL                           AS range_high,
       NULL                           AS unit_source_value,
       NULL                           AS frequency,
       NULL                           AS quantity,
       NULL                           AS days_supply,
       NULL                           AS sig,
       IF(
           src.AEOUT IN ('FATAL', 'RECOVERED/RESOLVED'),
           src.AEOUT,
           NULL
       )                              AS stop_reason,
       NULL                           AS route_source_value,
       'PHUSE_MedDRA_maps_to'         AS source_vocabulary_id,
       'PHUSE_Unknown_MedDRA'         AS default_vocabulary_id,
       NULL                           AS value_source_vocabulary_id,
       'Condition'                    AS default_domain_id,
       32809                          AS event_type_concept_id,  -- Case Report Form
       'ae.1.aellt'                   AS rule_id,
       'ae'                           AS src_tbl,
       src.row_id                     AS src_row
FROM   src.ae src
LEFT JOIN (SELECT usubjid,
                  Row_number()
                    OVER(
                      partition BY usubjid
                      ORDER BY dsstdy DESC) AS num,
                  Cast(dsstdtc AS DATE)     AS end_date
            FROM   src.ds) imp
              ON imp.usubjid = src.usubjid
                 AND imp.num = 1;

-------------------------------------------------------------------
-- AE: Severity
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                      AS person_source_value,
       CAST(src.aestdtc AS date)        AS event_start_date,
       NULL                             AS event_start_datetime,
       NULL                             AS event_end_date,
       NULL                             AS event_end_datetime,
       NULL                             AS operator_source_value,
       NULL                             AS unique_visit_source,
       'Severity/Intensity'
            || '|'
            || src.aesev                AS event_source_value,
       NULL                             AS value_source_value,
       NULL                             AS value_as_number,
       NULL                             AS value_as_string,
       NULL                             AS range_low,
       NULL                             AS range_high,
       NULL                             AS unit_source_value,
       NULL                             AS frequency,
       NULL                             AS quantity,
       NULL                             AS days_supply,
       NULL                             AS sig,
       NULL                             AS stop_reason,
       NULL                             AS route_source_value,
       'PHUSE_AE_AESEV_maps_to'         AS source_vocabulary_id,
       'PHUSE_Unknown_AE_AESEV'         AS default_vocabulary_id,
       NULL                             AS value_source_vocabulary_id,
       'Observation'                    AS default_domain_id,
       32809                            AS event_type_concept_id,  -- Case Report Form
       'ae.2.aesev'                     AS rule_id,
       'ae'                             AS src_tbl,
       src.row_id                       AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Seriousness
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                      AS person_source_value,
       CAST(src.aestdtc AS date)        AS event_start_date,
       NULL                             AS event_start_datetime,
       NULL                             AS event_end_date,
       NULL                             AS event_end_datetime,
       NULL                             AS operator_source_value,
       NULL                             AS unique_visit_source,
       'Serious Event'
            || '|'
            || src.aeser                AS event_source_value,
       NULL                             AS value_source_value,
       NULL                             AS value_as_number,
       NULL                             AS value_as_string,
       NULL                             AS range_low,
       NULL                             AS range_high,
       NULL                             AS unit_source_value,
       NULL                             AS frequency,
       NULL                             AS quantity,
       NULL                             AS days_supply,
       NULL                             AS sig,
       NULL                             AS stop_reason,
       NULL                             AS route_source_value,
       'PHUSE_AE_AESER_maps_to'         AS source_vocabulary_id,
       'PHUSE_Unknown_AE_AESER'         AS default_vocabulary_id,
       NULL                             AS value_source_vocabulary_id,
       'Observation'                    AS default_domain_id,
       32809                            AS event_type_concept_id,  -- Case Report Form
       'ae.3.aeser'                     AS rule_id,
       'ae'                             AS src_tbl,
       src.row_id                       AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Relation to the Study Drug
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                      AS person_source_value,
       CAST(src.aestdtc AS date)        AS event_start_date,
       NULL                             AS event_start_datetime,
       NULL                             AS event_end_date,
       NULL                             AS event_end_datetime,
       NULL                             AS operator_source_value,
       NULL                             AS unique_visit_source,
       'Relationship to Study Drug (Causality)'
            || '|'
            || src.aerel                AS event_source_value,
       NULL                             AS value_source_value,
       NULL                             AS value_as_number,
       NULL                             AS value_as_string,
       NULL                             AS range_low,
       NULL                             AS range_high,
       NULL                             AS unit_source_value,
       NULL                             AS frequency,
       NULL                             AS quantity,
       NULL                             AS days_supply,
       NULL                             AS sig,
       NULL                             AS stop_reason,
       NULL                             AS route_source_value,
       'PHUSE_AE_AEREL_maps_to'         AS source_vocabulary_id,
       'PHUSE_Unknown_AE_AEREL'         AS default_vocabulary_id,
       NULL                             AS value_source_vocabulary_id,
       'Observation'                    AS default_domain_id,
       32809                            AS event_type_concept_id,  -- Case Report Form
       'ae.4.aerel'                     AS rule_id,
       'ae'                             AS src_tbl,
       src.row_id                       AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Outcome of Adverse Event
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                      AS person_source_value,
       CAST(src.aestdtc AS date)        AS event_start_date,
       NULL                             AS event_start_datetime,
       NULL                             AS event_end_date,
       NULL                             AS event_end_datetime,
       NULL                             AS operator_source_value,
       NULL                             AS unique_visit_source,
       'Outcome of Adverse Event'
           || '|'
           || src.aeout                 AS event_source_value,
       NULL                             AS value_source_value,
       NULL                             AS value_as_number,
       NULL                             AS value_as_string,
       NULL                             AS range_low,
       NULL                             AS range_high,
       NULL                             AS unit_source_value,
       NULL                             AS frequency,
       NULL                             AS quantity,
       NULL                             AS days_supply,
       NULL                             AS sig,
       NULL                             AS stop_reason,
       NULL                             AS route_source_value,
       'PHUSE_AE_AEOUT_maps_to'         AS source_vocabulary_id,
       'PHUSE_Unknown_AE_AEOUT'         AS default_vocabulary_id,
       NULL                             AS value_source_vocabulary_id,
       'Observation'                    AS default_domain_id,
       32809                            AS event_type_concept_id,  -- Case Report Form
       'ae.5.aeout'                     AS rule_id,
       'ae'                             AS src_tbl,
       src.row_id                       AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Occurred with Overdose
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                      AS person_source_value,
       CAST(src.aestdtc AS date)        AS event_start_date,
       NULL                             AS event_start_datetime,
       NULL                             AS event_end_date,
       NULL                             AS event_end_datetime,
       NULL                             AS operator_source_value,
       NULL                             AS unique_visit_source,
       'Occurred with Overdose'
           || '|'
           || src.aesod                 AS event_source_value,
       NULL                             AS value_source_value,
       NULL                             AS value_as_number,
       NULL                             AS value_as_string,
       NULL                             AS range_low,
       NULL                             AS range_high,
       NULL                             AS unit_source_value,
       NULL                             AS frequency,
       NULL                             AS quantity,
       NULL                             AS days_supply,
       NULL                             AS sig,
       NULL                             AS stop_reason,
       NULL                             AS route_source_value,
       'PHUSE_AE_AESOD_maps_to'         AS source_vocabulary_id,
       'PHUSE_Unknown_AE_AESOD'         AS default_vocabulary_id,
       NULL                             AS value_source_vocabulary_id,
       'Observation'                    AS default_domain_id,
       32809                            AS event_type_concept_id,  -- Case Report Form
       'ae.6.aesod'                     AS rule_id,
       'ae'                             AS src_tbl,
       src.row_id                       AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Persistant or Significant Disability/Incapacity
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                          AS person_source_value,
       Cast(src.aestdtc AS date)            AS event_start_date,
       NULL                                 AS event_start_datetime,
       NULL                                 AS event_end_date,
       NULL                                 AS event_end_datetime,
       NULL                                 AS operator_source_value,
       NULL                                 AS unique_visit_source,
       'Persist or Signif Disability/Incapacity'
       || '|'
       || src.aesdisab                      AS event_source_value,
       NULL                                 AS value_source_value,
       NULL                                 AS value_as_number,
       NULL                                 AS value_as_string,
       NULL                                 AS range_low,
       NULL                                 AS range_high,
       NULL                                 AS unit_source_value,
       NULL                                 AS frequency,
       NULL                                 AS quantity,
       NULL                                 AS days_supply,
       NULL                                 AS sig,
       NULL                                 AS stop_reason,
       NULL                                 AS route_source_value,
       'PHUSE_AE_AESDISAB_maps_to'          AS source_vocabulary_id,
       'PHUSE_Unknown_AE_AESDISAB'          AS default_vocabulary_id,
       NULL                                 AS value_source_vocabulary_id,
       'Observation'                        AS default_domain_id,
       32809                                AS event_type_concept_id,  -- Case Report Form
       'ae.7.aesdisab'                      AS rule_id,
       'ae'                                 AS src_tbl,
       src.row_id                           AS src_row
FROM   src.ae src
WHERE  src.aesdisab = 'Y';

-------------------------------------------------------------------
-- CM: Concomitant Medications
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                   AS person_source_value,
       Cast(src.cmstdtc AS date)     AS event_start_date,
       NULL                          AS event_start_datetime,
       IFNULL(
           Cast(src.cmendtc AS date),
           IF(date_add(
               Cast(src.cmstdtc AS date),
               29) > CAST('2015-03-31' AS date),
           CAST('2015-03-31' AS date),
           date_add(
               Cast(src.cmstdtc AS date),
               29)))                 AS event_end_date, -- impute according to the THEMIS #57
       NULL                          AS event_end_datetime,
       NULL                          AS operator_source_value,
       NULL                          AS unique_visit_source,
       src.cmtrt
       || '|'
       || src.cmdose
       || '|'
       || Coalesce(src.cmdosu, '')
       || '|'
       || Coalesce(src.cmroute, '')  AS event_source_value,
       NULL                          AS value_source_value,
       NULL                          AS value_as_number,
       NULL                          AS value_as_string,
       NULL                          AS range_low,
       NULL                          AS range_high,
       src.cmdosu                    AS unit_source_value,  -- dose_unit_source_value for drugs
       lk_frq.daily_dose             AS frequency,
       NULL                          AS quantity,  -- will be defined later
       Datediff(
           IFNULL(
               Cast(src.cmendtc AS date),
               IF(date_add(
                   Cast(src.cmstdtc AS date),
                   29) > CAST('2015-03-31' AS date),
                  CAST('2015-03-31' AS date),
                  date_add(
                      Cast(src.cmstdtc AS date),
                      29))),
           Cast(src.cmstdtc AS date)) + 1
                                     AS days_supply,
       Coalesce(src.cmdose, '')
       || '|'
       || Coalesce(src.cmdosu, '')
       || '|'
       || Coalesce(src.cmdosfrq, '') AS sig,
       NULL                          AS stop_reason,
       src.cmroute                   AS route_source_value,
       'PHUSE_CM_maps_to'            AS source_vocabulary_id,
       'PHUSE_Unknown_CM'            AS default_vocabulary_id,
       NULL                          AS value_source_vocabulary_id,
       'Drug'                        AS default_domain_id,
       32809                         AS event_type_concept_id,  -- Case Report Form
       'cm.1.cmtrt'                  AS rule_id,
       'cm'                          AS src_tbl,
       src.row_id                    AS src_row
FROM   src.cm src
       LEFT JOIN temp.lk_dose_frq lk_frq
              ON lk_frq.dose_frequency = src.cmdosfrq
                 AND src.cmdosfrq IS NOT NULL;

-------------------------------------------------------------------
-- DS: Trial Outcome (Topic 1)
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                      AS person_source_value,
       Cast(src.dsstdtc AS date)        AS event_start_date,
       NULL                             AS event_start_datetime,
       NULL                             AS event_end_date,
       NULL                             AS event_end_datetime,
       NULL                             AS operator_source_value,
       src.usubjid
       || '|'
       ||
       src.visitnum                     AS unique_visit_source,
       src.dsdecod                      AS event_source_value,
       NULL                             AS value_source_value,
       NULL                             AS value_as_number,
       NULL                             AS value_as_string,
       NULL                             AS range_low,
       NULL                             AS range_high,
       NULL                             AS unit_source_value,
       NULL                             AS frequency,
       NULL                             AS quantity,
       NULL                             AS days_supply,
       NULL                             AS sig,
       NULL                             AS stop_reason,
       NULL                             AS route_source_value,
       'PHUSE_DS_DSDECOD_maps_to'       AS source_vocabulary_id,
       'PHUSE_Unknown_DS_DSDECOD'       AS default_vocabulary_id,
       NULL                             AS value_source_vocabulary_id,
       'Observation'                    AS default_domain_id,
       32809                            AS event_type_concept_id,  -- Case Report Form
       'ds.1.dsdecod'                   AS rule_id,
       'ds'                             AS src_tbl,
       src.row_id                       AS src_row
FROM   src.ds src
WHERE  src.dscat != 'OTHER EVENT';

-------------------------------------------------------------------
-- DM: Trial arm assignment - planned arm
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                 AS person_source_value,
       Cast(src.rfstdtc AS date)   AS event_start_date,
       NULL                        AS event_start_datetime,
       NULL                        AS event_end_date,
       NULL                        AS event_end_datetime,
       NULL                        AS operator_source_value,
       src.usubjid
       || '|1.0'                   AS unique_visit_source,
       'Clinical trial arm'        AS event_source_value,
       NULL                        AS value_source_value,
       NULL                        AS value_as_number,
       src.arm                     AS value_as_string,
       NULL                        AS range_low,
       NULL                        AS range_high,
       NULL                        AS unit_source_value,
       NULL                        AS frequency,
       NULL                        AS quantity,
       NULL                        AS days_supply,
       NULL                        AS sig,
       NULL                        AS stop_reason,
       NULL                        AS route_source_value,
       'PHUSE_DM_maps_to'          AS source_vocabulary_id,
       'PHUSE_Unknown_DM'          AS default_vocabulary_id,
       NULL                        AS value_source_vocabulary_id,
       'Observation'               AS default_domain_id,
       32809                       AS event_type_concept_id,  -- Case Report Form
       'dm.1.arm'                  AS rule_id,
       'dm'                        AS src_tbl,
       src.row_id                  AS src_row
FROM   src.dm src
WHERE  src.arm IS NOT NULL;

-------------------------------------------------------------------
-- DM: Trial arm assignment - actual arm
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                 AS person_source_value,
       Cast(src.rfstdtc AS date)   AS event_start_date,
       NULL                        AS event_start_datetime,
       NULL                        AS event_end_date,
       NULL                        AS event_end_datetime,
       NULL                        AS operator_source_value,
       src.usubjid
       || '|1.0'                   AS unique_visit_source,
       'Clinical trial arm'        AS event_source_value,
       NULL                        AS value_source_value,
       NULL                        AS value_as_number,
       src.actarm                  AS value_as_string,
       NULL                        AS range_low,
       NULL                        AS range_high,
       NULL                        AS unit_source_value,
       NULL                        AS frequency,
       NULL                        AS quantity,
       NULL                        AS days_supply,
       NULL                        AS sig,
       NULL                        AS stop_reason,
       NULL                        AS route_source_value,
       'PHUSE_DM_maps_to'          AS source_vocabulary_id,
       'PHUSE_Unknown_DM'          AS default_vocabulary_id,
       NULL                        AS value_source_vocabulary_id,
       'Observation'               AS default_domain_id,
       32809                       AS event_type_concept_id,  -- Case Report Form
       'dm.2.actarm'               AS rule_id,
       'dm'                        AS src_tbl,
       src.row_id                  AS src_row
FROM   src.dm src
WHERE  src.actarm IS NOT NULL;
