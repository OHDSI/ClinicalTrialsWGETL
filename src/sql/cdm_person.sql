-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------

TRUNCATE TABLE cdm.person;


INSERT INTO cdm.person
SELECT Row_number()
         OVER (
           ORDER BY src.row_id)               AS person_id,
       CASE src.sex
         WHEN 'M' THEN 8507
         WHEN 'F' THEN 8532
         ELSE 0
       END                                     AS gender_concept_id,
       Cast(Year(src.dmdtc) - src.age AS INT)  AS year_of_birth,
       NULL                                    AS month_of_birth,
       NULL                                    AS day_of_birth,
       NULL                                    AS birth_datetime,
       COALESCE(msc_race.target_concept_id, 0) AS race_concept_id,
       COALESCE(msc_eth.target_concept_id, 0)  AS ethnicity_concept_id,
       NULL                                    AS location_id,
       NULL                                    AS provider_id,
       NULL                                    AS care_site_id,
       src.usubjid                             AS person_source_value,
       src.sex                                 AS gender_source_value,
       0                                       AS gender_source_concept_id,
       src.race                                AS race_source_value,
       0                                       AS race_source_concept_id,
       src.ethnic                              AS ethnicity_source_value,
       0                                       AS ethnicity_source_concept_id,
       'person'                                AS rule_id,
       'dm'                                    AS src_tbl,
       src.row_id                              AS src_row
FROM   src.dm src
       LEFT JOIN temp.source_codes_mapped msc_race
              ON msc_race.source_code = src.race
                 AND msc_race.source_vocabulary_id = 'PHUSE_DM_RACE_maps_to'
       LEFT JOIN temp.source_codes_mapped msc_eth
              ON msc_eth.source_code = src.ethnic
                 AND msc_eth.source_vocabulary_id = 'PHUSE_DM_ETHNIC_maps_to'
WHERE  src.age IS NOT NULL
       AND src.dmdtc IS NOT NULL
       AND src.usubjid IS NOT NULL
;
