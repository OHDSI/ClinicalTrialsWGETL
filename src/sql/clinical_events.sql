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
     visit_source_value         STRING,
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
       NULL                           AS visit_source_value,
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
       'PHUSE_MedDRA'                 AS source_vocabulary_id,
       NULL                           AS value_source_vocabulary_id,
       'Condition'                  AS default_domain_id,
       32809                          AS event_type_concept_id,  -- Case Report Form
       'AE.1.AELLT'                   AS rule_id,
       'AE'                           AS src_tbl,
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
SELECT src.usubjid                    AS person_source_value,
       CAST(src.aestdtc AS date)      AS event_start_date,
       NULL                           AS event_start_datetime,
       NULL                           AS event_end_date,
       NULL                           AS event_end_datetime,
       NULL                           AS operator_source_value,
       NULL                           AS visit_source_value,
       'Severity/Intensity'
            || '|'
            || src.aesev              AS event_source_value,
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
       NULL                           AS stop_reason,
       NULL                           AS route_source_value,
       'PHUSE_AE_AESEV'               AS source_vocabulary_id,
       NULL                           AS value_source_vocabulary_id,
       'Observation'                  AS default_domain_id,
       32809                          AS event_type_concept_id,  -- Case Report Form
       'AE.2.AESEV'                   AS rule_id,
       'AE'                           AS src_tbl,
       src.row_id                     AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Seriousness
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                    AS person_source_value,
       CAST(src.aestdtc AS date)      AS event_start_date,
       NULL                           AS event_start_datetime,
       NULL                           AS event_end_date,
       NULL                           AS event_end_datetime,
       NULL                           AS operator_source_value,
       NULL                           AS visit_source_value,
       'Serious Event'
            || '|'
            || src.aeser              AS event_source_value,
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
       NULL                           AS stop_reason,
       NULL                           AS route_source_value,
       'PHUSE_AE_AESER'               AS source_vocabulary_id,
       NULL                           AS value_source_vocabulary_id,
       'Observation'                  AS default_domain_id,
       32809                          AS event_type_concept_id,  -- Case Report Form
       'AE.3.AESER'                   AS rule_id,
       'AE'                           AS src_tbl,
       src.row_id                     AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Relation to the Study Drug
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                    AS person_source_value,
       CAST(src.aestdtc AS date)      AS event_start_date,
       NULL                           AS event_start_datetime,
       NULL                           AS event_end_date,
       NULL                           AS event_end_datetime,
       NULL                           AS operator_source_value,
       NULL                           AS visit_source_value,
       'Relationship to Study Drug (Causality)'
            || '|'
            || src.aerel              AS event_source_value,
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
       NULL                           AS stop_reason,
       NULL                           AS route_source_value,
       'PHUSE_AE_AEREL'               AS source_vocabulary_id,
       NULL                           AS value_source_vocabulary_id,
       'Observation'                  AS default_domain_id,
       32809                          AS event_type_concept_id,  -- Case Report Form
       'AE.4.AEREL'                   AS rule_id,
       'AE'                           AS src_tbl,
       src.row_id                     AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Outcome of Adverse Event
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                    AS person_source_value,
       CAST(src.aestdtc AS date)      AS event_start_date,
       NULL                           AS event_start_datetime,
       NULL                           AS event_end_date,
       NULL                           AS event_end_datetime,
       NULL                           AS operator_source_value,
       NULL                           AS visit_source_value,
       'Outcome of Adverse Event'
           || '|'
           || src.aeout               AS event_source_value,
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
       NULL                           AS stop_reason,
       NULL                           AS route_source_value,
       'PHUSE_AE_AEOUT'               AS source_vocabulary_id,
       NULL                           AS value_source_vocabulary_id,
       'Observation'                  AS default_domain_id,
       32809                          AS event_type_concept_id,  -- Case Report Form
       'AE.5.AEOUT'                   AS rule_id,
       'AE'                           AS src_tbl,
       src.row_id                     AS src_row
FROM   src.ae src;

-------------------------------------------------------------------
-- AE: Occurred with Overdose
-------------------------------------------------------------------
INSERT INTO temp.clinical_events
SELECT src.usubjid                    AS person_source_value,
       CAST(src.aestdtc AS date)      AS event_start_date,
       NULL                           AS event_start_datetime,
       NULL                           AS event_end_date,
       NULL                           AS event_end_datetime,
       NULL                           AS operator_source_value,
       NULL                           AS visit_source_value,
       'Occurred with Overdose'
           || '|'
           || src.aesod               AS event_source_value,
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
       NULL                           AS stop_reason,
       NULL                           AS route_source_value,
       'PHUSE_AE_AESOD'               AS source_vocabulary_id,
       NULL                           AS value_source_vocabulary_id,
       'Observation'                  AS default_domain_id,
       32809                          AS event_type_concept_id,  -- Case Report Form
       'AE.6.AESOD'                   AS rule_id,
       'AE'                           AS src_tbl,
       src.row_id                     AS src_row
FROM   src.ae src;
