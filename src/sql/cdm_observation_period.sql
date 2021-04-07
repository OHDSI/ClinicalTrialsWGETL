-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
TRUNCATE TABLE cdm.observation_period;

INSERT INTO cdm.observation_period
SELECT Row_number()
         OVER (
           ORDER BY tbl.src_row)         AS observation_period_id,
       tbl.person_id                     AS person_id,
       tbl.observation_period_start_date AS observation_period_start_date,
       tbl.observation_period_end_date   AS observation_period_end_date,
       32809                             AS period_type_concept_id,
       'observation_period'              AS rule_id,
       'person'                          AS src_tbl,
       tbl.src_row                       AS src_row
FROM   (SELECT Row_number()
                 OVER (
                   partition BY per.person_id
                   ORDER BY per.person_id)  AS row_num,
               per.person_id                AS person_id,
               Min(To_date(Cast(Unix_timestamp(sv.svstdtc, "yyyy-MM-dd") AS
                                TIMESTAMP))
                      )
                 OVER (
                   partition BY sv.usubjid) AS observation_period_start_date,
               Max(To_date(Cast(Unix_timestamp(ds.dsstdtc, "yyyy-MM-dd") AS
                                TIMESTAMP))
                      )
                 OVER (
                   partition BY ds.usubjid) AS observation_period_end_date,
               per.src_row                  AS src_row
        FROM   cdm.person per
               INNER JOIN src.sv
                       ON sv.usubjid = per.person_source_value
                          AND sv.visit = 'SCREENING 1'
               INNER JOIN src.ds
                       ON ds.usubjid = per.person_source_value) tbl
WHERE  row_num = 1;
