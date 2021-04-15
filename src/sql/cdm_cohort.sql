-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
TRUNCATE TABLE cdm.cohort;

INSERT INTO cdm.cohort
SELECT 1                                AS cohort_definition_id,
       per.person_id                    AS subject_id,
       op.observation_period_start_date AS cohort_start_date,
       op.observation_period_end_date   AS cohort_end_date
FROM   cdm.person per
       INNER JOIN src.dm
               ON dm.usubjid = per.person_source_value
                  AND dm.armcd = 'Pbo'
       INNER JOIN cdm.observation_period op
               ON op.person_id = per.person_id;


INSERT INTO cdm.cohort
SELECT 2                                AS cohort_definition_id,
       per.person_id                    AS subject_id,
       op.observation_period_start_date AS cohort_start_date,
       op.observation_period_end_date   AS cohort_end_date
FROM   cdm.person per
       INNER JOIN src.dm
               ON dm.usubjid = per.person_source_value
                  AND dm.armcd = 'Xan_Hi'
       INNER JOIN cdm.observation_period op
               ON op.person_id = per.person_id;


INSERT INTO cdm.cohort
SELECT 3                                AS cohort_definition_id,
       per.person_id                    AS subject_id,
       op.observation_period_start_date AS cohort_start_date,
       op.observation_period_end_date   AS cohort_end_date
FROM   cdm.person per
       INNER JOIN src.dm
               ON dm.usubjid = per.person_source_value
                  AND dm.armcd = 'Xan_Lo'
       INNER JOIN cdm.observation_period op
               ON op.person_id = per.person_id;

--
INSERT INTO cdm.cohort
SELECT 4                                AS cohort_definition_id,
       per.person_id                    AS subject_id,
       op.observation_period_start_date AS cohort_start_date,
       op.observation_period_end_date   AS cohort_end_date
FROM   cdm.person per
       INNER JOIN src.dm
               ON dm.usubjid = per.person_source_value
                  AND dm.actarmcd = 'Pbo'
       INNER JOIN cdm.observation_period op
               ON op.person_id = per.person_id;

--
INSERT INTO cdm.cohort
SELECT 5                                AS cohort_definition_id,
       per.person_id                    AS subject_id,
       op.observation_period_start_date AS cohort_start_date,
       op.observation_period_end_date   AS cohort_end_date
FROM   cdm.person per
       INNER JOIN src.dm
               ON dm.usubjid = per.person_source_value
                  AND dm.actarmcd = 'Xan_Hi'
       INNER JOIN cdm.observation_period op
               ON op.person_id = per.person_id;

--
INSERT INTO cdm.cohort
SELECT 6                                AS cohort_definition_id,
       per.person_id                    AS subject_id,
       op.observation_period_start_date AS cohort_start_date,
       op.observation_period_end_date   AS cohort_end_date
FROM   cdm.person per
       INNER JOIN src.dm
               ON dm.usubjid = per.person_source_value
                  AND dm.actarmcd = 'Xan_Lo'
       INNER JOIN cdm.observation_period op
               ON op.person_id = per.person_id;
