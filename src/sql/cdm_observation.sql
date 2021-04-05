-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.observation PURGE;

CREATE TABLE temp.observation
using        parquet AS
SELECT co.*
FROM   cdm.observation co
WHERE  FALSE;

-------------------------------------------------------------------
-- Populate temporary observation table, before deduplication
-------------------------------------------------------------------
INSERT INTO temp.observation
SELECT Row_number()
         OVER (
           ORDER BY src.src_tbl, src.src_row) AS observation_id,
       src.person_id                          AS person_id,
       msc.target_concept_id                  AS observation_concept_id,
       src.event_start_date                   AS observation_date,
       NULL                                   AS observation_datetime,
       src.event_type_concept_id              AS observation_type_concept_id,
       src.value_as_number                    AS value_as_number,
       src.value_as_string                    AS value_as_string,
       Coalesce(
           mscv.target_concept_id,
           msc.value_as_concept_id
        )                                     AS value_as_concept_id,
       0                                      AS qualifier_concept_id,
       mscu.target_concept_id                 AS unit_concept_id,
       NULL                                   AS provider_id,
       src.visit_occurrence_id                AS visit_occurrence_id,
       NULL                                   AS visit_detail_id,
       src.event_source_value                 AS observation_source_value,
       msc.source_concept_id                  AS observation_source_concept_id,
       src.unit_source_value                  AS unit_source_value,
       NULL                                   AS qualifier_source_value,
       NULL                                   AS observation_event_id,
       NULL                                   AS obs_event_field_concept_id,
       src.rule_id                            AS rule_id,
       src.src_tbl                            AS src_tbl,
       src.src_row                            AS src_row
FROM   temp.clinical_events_cleaned src
       INNER JOIN temp.source_codes_mapped msc
               ON msc.source_vocabulary_id IN (
                             src.source_vocabulary_id, src.default_vocabulary_id
                                              )
                  AND msc.source_code = src.event_source_value
                  AND COALESCE(msc.target_domain_id, msc.source_domain_id,
                      src.default_domain_id) =
                      'Observation'
       LEFT JOIN temp.source_codes_mapped mscv
              ON mscv.source_vocabulary_id = src.value_source_vocabulary_id
                 AND mscv.source_code = src.value_source_value
       LEFT JOIN temp.source_codes_mapped mscu
              ON mscu.source_vocabulary_id = 'PHUSE_'
                                             || Upper(src.src_tbl)
                                             || '_UNIT'
                 AND mscu.source_code = src.unit_source_value;


-------------------------------------------------------------------
-- Match duplicating events with the first ones
-------------------------------------------------------------------
INSERT INTO temp.duplicates
SELECT 'Observation'             AS domain_id,
       tmp.observation_id        AS prededup_id,
       Min(tmp.observation_id)
         OVER (
           partition BY tmp.person_id,
           tmp.observation_concept_id,
           tmp.observation_date,
           tmp.observation_datetime,
           tmp.observation_type_concept_id,
           tmp.value_as_number,
           tmp.value_as_string,
           tmp.value_as_concept_id,
           tmp.unit_concept_id,
           tmp.visit_occurrence_id,
           tmp.observation_source_value,
           tmp.observation_source_concept_id,
           tmp.unit_source_value
       )                         AS postdedup_id,
       tmp.src_tbl               AS src_tbl,
       tmp.src_row               AS src_row
FROM   temp.observation tmp;

-------------------------------------------------------------------
-- Deduplication
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.observation_deduped PURGE;

CREATE TABLE temp.observation_deduped
using        parquet AS
SELECT obs.*
FROM   temp.observation obs
       INNER JOIN temp.duplicates dup
               ON dup.domain_id = 'Observation'
                  AND dup.prededup_id = obs.observation_id
WHERE  obs.observation_id = dup.postdedup_id;

-------------------------------------------------------------------
-- Get ids for Topic 3 conventions
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.obs_topic3 PURGE;

CREATE TABLE temp.obs_topic3
using        parquet               AS
SELECT DISTINCT obs.observation_id AS event_id,
                dup.postdedup_id   AS observation_event_id,
                1147127            AS obs_event_field_concept_id  -- condition_occurrence.condition_occurrence_id
FROM   temp.observation_deduped obs
       INNER JOIN temp.condition_occurrence co
               ON obs.person_id = co.person_id
                  AND ( co.rule_id = 'ae.1.aellt'
                        AND obs.rule_id = 'ae.2.aesev'
                        AND obs.src_row = co.src_row
                         OR co.rule_id = 'ae.1.aellt'
                            AND obs.rule_id = 'ae.3.aeser'
                            AND co.src_row = obs.src_row
                         OR co.rule_id = 'ae.1.aellt'
                            AND obs.rule_id = 'ae.4.aerel'
                            AND co.src_row = obs.src_row
                         OR co.rule_id = 'ae.1.aellt'
                            AND obs.rule_id = 'ae.5.aeout'
                            AND co.src_row = obs.src_row
                         OR co.rule_id = 'ae.1.aellt'
                            AND obs.rule_id = 'ae.6.aesod'
                            AND co.src_row = obs.src_row )
       INNER JOIN temp.duplicates dup
               ON co.condition_occurrence_id = dup.prededup_id
                  AND dup.domain_id = 'Condition';


INSERT INTO temp.obs_topic3
SELECT obs_mod.observation_id  AS event_id,
       obs_main.observation_id AS observation_event_id,
       1147165                 AS obs_event_field_concept_id  -- observation.observation_id
FROM   temp.observation_deduped obs_mod
       INNER JOIN temp.observation_deduped obs_main
               ON obs_mod.person_id = obs_main.person_id
                  AND ( obs_main.rule_id = 'ae.1.aellt'
                        AND obs_mod.rule_id = 'ae.2.aesev'
                        AND obs_main.src_row = obs_mod.src_row
                         OR obs_main.rule_id = 'ae.1.aellt'
                            AND obs_mod.rule_id = 'ae.3.aeser'
                            AND obs_main.src_row = obs_mod.src_row
                         OR obs_main.rule_id = 'ae.1.aellt'
                            AND obs_mod.rule_id = 'ae.4.aerel'
                            AND obs_main.src_row = obs_mod.src_row
                         OR obs_main.rule_id = 'ae.1.aellt'
                            AND obs_mod.rule_id = 'ae.5.aeout'
                            AND obs_main.src_row = obs_mod.src_row
                         OR obs_main.rule_id = 'ae.1.aellt'
                            AND obs_mod.rule_id = 'ae.6.aesod'
                            AND obs_main.src_row = obs_mod.src_row );

-------------------------------------------------------------------
-- Populate Topic 3 fields
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.observation_with_mdfrs PURGE;

CREATE TABLE temp.observation_with_mdfrs
using        parquet                     AS
SELECT src.observation_id                AS observation_id,
       src.person_id                     AS person_id,
       src.observation_concept_id        AS observation_concept_id,
       src.observation_date              AS observation_date,
       src.observation_datetime          AS observation_datetime,
       src.observation_type_concept_id   AS observation_type_concept_id,
       src.value_as_number               AS value_as_number,
       src.value_as_string               AS value_as_string,
       src.value_as_concept_id           AS value_as_concept_id,
       src.qualifier_concept_id          AS qualifier_concept_id,
       src.unit_concept_id               AS unit_concept_id,
       src.provider_id                   AS provider_id,
       src.visit_occurrence_id           AS visit_occurrence_id,
       src.visit_detail_id               AS visit_detail_id,
       src.observation_source_value      AS observation_source_value,
       src.observation_source_concept_id AS observation_source_concept_id,
       src.unit_source_value             AS unit_source_value,
       src.qualifier_source_value        AS qualifier_source_value,
       mdfr.observation_event_id         AS observation_event_id,
       Coalesce(
           mdfr.obs_event_field_concept_id,
           0
       )                                 AS obs_event_field_concept_id,
       src.rule_id                       AS rule_id,
       src.src_tbl                       AS src_tbl,
       src.src_row                       AS src_row
FROM   temp.observation_deduped src
       LEFT JOIN temp.obs_topic3 mdfr
              ON src.observation_id = mdfr.event_id;


-- Get the max observation_id wich will be a starting point for new ids
DROP TABLE IF EXISTS temp.obs_max_id PURGE;

CREATE TABLE temp.obs_max_id
using        parquet       AS
SELECT Max(observation_id) AS max_id
FROM   temp.observation_with_mdfrs;


-- Find duplicates
DROP TABLE IF EXISTS temp.obs_duplicates PURGE;

CREATE TABLE temp.obs_duplicates
using  parquet  AS
SELECT obs_mod.observation_id,
       Count(*) AS cnt
FROM   temp.observation_with_mdfrs obs_mod
WHERE  obs_mod.observation_event_id IS NOT NULL
GROUP  BY obs_mod.observation_id
HAVING Count(*) > 1;


-- Assign new ids
DROP TABLE IF EXISTS temp.obs_new_ids PURGE;

CREATE TABLE temp.obs_new_ids
using  parquet    AS
SELECT     obs_mod.observation_id,
           obs_mod.observation_event_id,
           mxd.max_id +
                Row_number() over (
                    ORDER BY obs_mod.observation_id,
                    obs_mod.observation_event_id ASC
                ) AS new_obs_id
FROM       temp.observation_with_mdfrs obs_mod
FULL JOIN  temp.obs_max_id mxd
INNER JOIN temp.obs_duplicates dup
ON         dup.observation_id = obs_mod.observation_id;


-------------------------------------------------------------------
-- Store as final cdm.observation table: two cases
-------------------------------------------------------------------
TRUNCATE TABLE cdm.observation;

INSERT INTO cdm.observation
SELECT src.observation_id                AS observation_id,
       src.person_id                     AS person_id,
       src.observation_concept_id        AS observation_concept_id,
       src.observation_date              AS observation_date,
       src.observation_datetime          AS observation_datetime,
       src.observation_type_concept_id   AS observation_type_concept_id,
       src.value_as_number               AS value_as_number,
       src.value_as_string               AS value_as_string,
       src.value_as_concept_id           AS value_as_concept_id,
       src.qualifier_concept_id          AS qualifier_concept_id,
       src.unit_concept_id               AS unit_concept_id,
       src.provider_id                   AS provider_id,
       src.visit_occurrence_id           AS visit_occurrence_id,
       src.visit_detail_id               AS visit_detail_id,
       src.observation_source_value      AS observation_source_value,
       src.observation_source_concept_id AS observation_source_concept_id,
       src.unit_source_value             AS unit_source_value,
       src.qualifier_source_value        AS qualifier_source_value,
       src.observation_event_id          AS observation_event_id,
       src.obs_event_field_concept_id    AS obs_event_field_concept_id,
       src.rule_id                       AS rule_id,
       src.src_tbl                       AS src_tbl,
       src.src_row                       AS src_row
FROM   temp.observation_with_mdfrs src
       LEFT JOIN temp.obs_new_ids nwds
              ON nwds.observation_id = src.observation_id
                 AND nwds.observation_event_id = src.observation_event_id
WHERE  nwds.new_obs_id IS NULL;


INSERT INTO cdm.observation
SELECT nwds.new_obs_id                   AS observation_id,
       src.person_id                     AS person_id,
       src.observation_concept_id        AS observation_concept_id,
       src.observation_date              AS observation_date,
       src.observation_datetime          AS observation_datetime,
       src.observation_type_concept_id   AS observation_type_concept_id,
       src.value_as_number               AS value_as_number,
       src.value_as_string               AS value_as_string,
       src.value_as_concept_id           AS value_as_concept_id,
       src.qualifier_concept_id          AS qualifier_concept_id,
       src.unit_concept_id               AS unit_concept_id,
       src.provider_id                   AS provider_id,
       src.visit_occurrence_id           AS visit_occurrence_id,
       src.visit_detail_id               AS visit_detail_id,
       src.observation_source_value      AS observation_source_value,
       src.observation_source_concept_id AS observation_source_concept_id,
       src.unit_source_value             AS unit_source_value,
       src.qualifier_source_value        AS qualifier_source_value,
       src.observation_event_id          AS observation_event_id,
       src.obs_event_field_concept_id    AS obs_event_field_concept_id,
       src.rule_id                       AS rule_id,
       src.src_tbl                       AS src_tbl,
       src.src_row                       AS src_row
FROM   temp.observation_with_mdfrs src
       INNER JOIN temp.obs_new_ids nwds
               ON nwds.observation_id = src.observation_id
                  AND nwds.observation_event_id = src.observation_event_id;


DROP TABLE IF EXISTS temp.obs_topic3 PURGE;
DROP TABLE IF EXISTS temp.obs_max_id PURGE;
DROP TABLE IF EXISTS temp.obs_duplicates PURGE;
