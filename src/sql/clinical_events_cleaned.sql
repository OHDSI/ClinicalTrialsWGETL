-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.clinical_events_cleaned PURGE;

CREATE TABLE temp.clinical_events_cleaned
  (
     person_id                  INT,
     event_start_date           TIMESTAMP,
     event_start_datetime       TIMESTAMP,
     event_end_date             TIMESTAMP,
     event_end_datetime         TIMESTAMP,
     visit_occurrence_id        INT,
     operator_source_value      STRING,
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
  -- Getting person and visit ids
  -------------------------------------------------------------------
  DROP TABLE IF EXISTS temp.tmp_cleaned_clinical_events PURGE;

  CREATE TABLE temp.tmp_cleaned_clinical_events
  using        parquet                     AS
  SELECT     per.person_id                 AS person_id,
             per.year_of_birth             AS year_of_birth,
             ce.event_start_date           AS event_start_date,
             ce.event_start_datetime       AS event_start_datetime,
             ce.event_end_date             AS event_end_date,
             ce.event_end_datetime         AS event_end_datetime,
             vo.visit_occurrence_id        AS visit_occurrence_id,
             ce.operator_source_value      AS operator_source_value,
             ce.event_source_value         AS event_source_value,
             ce.value_source_value         AS value_source_value,
             ce.value_as_number            AS value_as_number,
             ce.value_as_string            AS value_as_string,
             ce.range_low                  AS range_low,
             ce.range_high                 AS range_high,
             ce.unit_source_value          AS unit_source_value,
             ce.frequency                  AS frequency,
             ce.quantity                   AS quantity,
             ce.days_supply                AS days_supply,
             ce.sig                        AS sig,
             ce.stop_reason                AS stop_reason,
             ce.route_source_value         AS route_source_value,
             ce.source_vocabulary_id       AS source_vocabulary_id,
             ce.default_vocabulary_id      AS default_vocabulary_id,
             ce.value_source_vocabulary_id AS value_source_vocabulary_id,
             ce.default_domain_id          AS default_domain_id,
             ce.event_type_concept_id      AS event_type_concept_id,
             ce.rule_id                    AS rule_id,
             ce.src_tbl                    AS src_tbl,
             ce.src_row                    AS src_row
  FROM       temp.clinical_events ce
  INNER JOIN cdm.person per
  ON         per.person_source_value = ce.person_source_value
  LEFT JOIN  cdm.visit_occurrence vo
  ON         vo.visit_source_value = ce.visit_source_value;

-------------------------------------------------------------------
-- Cleaning according to the OMOP restrictions
-------------------------------------------------------------------
INSERT INTO temp.clinical_events_cleaned
SELECT src.person_id                  AS person_id,
       src.event_start_date           AS event_start_date,
       src.event_start_datetime       AS event_start_datetime,
       src.event_end_date             AS event_end_date,
       src.event_end_datetime         AS event_end_datetime,
       src.visit_occurrence_id        AS visit_occurrence_id,
       src.operator_source_value      AS operator_source_value,
       src.event_source_value         AS event_source_value,
       src.value_source_value         AS value_source_value,
       src.value_as_number            AS value_as_number,
       src.value_as_string            AS value_as_string,
       src.range_low                  AS range_low,
       src.range_high                 AS range_high,
       src.unit_source_value          AS unit_source_value,
       src.frequency                  AS frequency,
       src.quantity                   AS quantity,
       src.days_supply                AS days_supply,
       src.sig                        AS sig,
       src.stop_reason                AS stop_reason,
       src.route_source_value         AS route_source_value,
       src.source_vocabulary_id       AS source_vocabulary_id,
       src.default_vocabulary_id      AS default_vocabulary_id,
       src.value_source_vocabulary_id AS value_source_vocabulary_id,
       src.default_domain_id          AS default_domain_id,
       src.event_type_concept_id      AS event_type_concept_id,
       src.rule_id                    AS rule_id,
       src.src_tbl                    AS src_tbl,
       src.src_row                    AS src_row
FROM   temp.tmp_cleaned_clinical_events src
WHERE  src.event_source_value IS NOT NULL
       AND src.event_start_date IS NOT NULL
       AND src.event_start_date BETWEEN Cast(Concat(src.year_of_birth, '-01-01')
                                        AS
                                        date)
                                        AND CURRENT_DATE()
       AND ( src.event_end_date IS NULL
              OR ( src.event_end_date BETWEEN Cast(Concat(src.year_of_birth,
                                              '-01-01')
                                              AS
                                              date)
                                              AND
                                                    CURRENT_DATE()
                   AND src.event_end_date >= src.event_start_date ) )
       AND NOT EXISTS (SELECT 1
                       FROM   cdm.death dth
                       WHERE  dth.person_id = src.person_id
                              AND Coalesce(src.event_end_date,
                                  src.event_start_date) >
                                  Date_add(dth.death_date, 60));


DROP TABLE temp.tmp_cleaned_clinical_events PURGE;
