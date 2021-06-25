-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
INSERT INTO vocab.concept
SELECT concept_id                   AS concept_id,
       concept_name                 AS concept_name,
       domain_id                    AS domain_id,
       vocabulary_id                AS vocabulary_id,
       concept_class_id             AS concept_class_id,
       standard_concept             AS standard_concept,
       concept_code                 AS concept_code,
       To_date(Cast(Unix_timestamp(Cast(valid_start_date AS STRING),
                    'yyyy-MM-dd')   AS
                    TIMESTAMP
               ))                   AS valid_start_date,
       To_date(Cast(Unix_timestamp(Cast(valid_end_date AS STRING), 'yyyy-MM-dd')
                    AS
                    TIMESTAMP))     AS valid_end_date,
       invalid_reason               AS invalid_reason
FROM   src_custom_concept;


-- INSERT INTO vocab.concept_relationship
-- SELECT concept_id_1                 AS concept_id_1,
--        concept_id_2                 AS concept_id_2,
--        relationship_id              AS relationship_id,
--        To_date(Cast(Unix_timestamp(Cast(valid_start_date AS STRING),
--                     'yyyy-MM-dd')   AS
--                     TIMESTAMP
--                ))                   AS valid_start_date,
--        To_date(Cast(Unix_timestamp(Cast(valid_end_date AS STRING), 'yyyy-MM-dd')
--                     AS
--                     TIMESTAMP))     AS valid_end_date,
--        invalid_reason               AS invalid_reason
-- FROM   src_custom_concept_relationship
--
--
-- INSERT INTO vocab.concept_ancestor
-- SELECT ancestor_concept_id,
--        descendant_concept_id,
--        min_levels_of_separation,
--        max_levels_of_separation
-- FROM   src_custom_concept_ancestor
--
--
-- INSERT INTO vocab.drug_strength
-- SELECT Cast(drug_concept_id AS INT)             AS drug_concept_id,
--        Cast(ingredient_concept_id AS INT)       AS ingredient_concept_id,
--        Cast(amount_value AS FLOAT)              AS amount_value,
--        Cast(amount_unit_concept_id AS INT)      AS amount_unit_concept_id,
--        Cast(numerator_value AS FLOAT)           AS numerator_value,
--        Cast(numerator_unit_concept_id AS INT)   AS numerator_unit_concept_id
--        ,
--        Cast(denominator_value AS FLOAT)         AS denominator_value
--        ,
--        Cast(denominator_unit_concept_id AS INT) AS
--        denominator_unit_concept_id,
--        Cast(box_size AS INT)                    AS box_size,
--        To_date(Cast(Unix_timestamp(Cast(valid_start_date AS STRING),
--                     'yyyy-MM-dd')   AS
--                     TIMESTAMP
--                ))                               AS valid_start_date,
--        To_date(Cast(Unix_timestamp(Cast(valid_end_date AS STRING), 'yyyy-MM-dd')
--                     AS
--                     TIMESTAMP))                 AS valid_end_date,
--        invalid_reason                           AS invalid_reason
-- FROM   src_drug_strength
