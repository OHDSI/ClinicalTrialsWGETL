-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
TRUNCATE TABLE cdm.metadata;

INSERT INTO cdm.metadata
SELECT 0              AS metadata_concept_id,
       0              AS metadata_type_concept_id,
       src.tsparm     AS name,
       src.tsval      AS value_as_string,
       0              AS value_as_concept_id,
       CURRENT_DATE() AS metadata_date,
       NULL           AS metadata_datetime
FROM   src.ts src
WHERE  src.tsval IS NOT NULL; 


INSERT INTO cdm.metadata
SELECT 0              AS metadata_concept_id,
       0              AS metadata_type_concept_id,
       src.ietestcd   AS name,
       src.ietest     AS value_as_string,
       0              AS value_as_concept_id,
       CURRENT_DATE() AS metadata_date,
       NULL           AS metadata_datetime
FROM   src.ti src
WHERE  src.ietest IS NOT NULL;
