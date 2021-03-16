-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------

TRUNCATE TABLE vocab.concept_ancestor;

INSERT INTO vocab.concept_ancestor
SELECT ancestor_concept_id,
       descendant_concept_id,
       min_levels_of_separation,
       max_levels_of_separation
FROM   src_concept_ancestor;


TRUNCATE TABLE vocab.concept_class;

INSERT INTO vocab.concept_class
SELECT concept_class_id,
       concept_class_name,
       concept_class_concept_id
FROM   src_concept_class;


TRUNCATE TABLE vocab.concept_relationship;

INSERT INTO vocab.concept_relationship
SELECT concept_id_1             AS concept_id_1,
       concept_id_2             AS concept_id_2,
       relationship_id          AS relationship_id,
       To_date(Cast(Unix_timestamp(Cast(valid_start_date AS STRING), 'yyyyMMdd')
                    AS
                    TIMESTAMP)) AS valid_start_date,
       To_date(Cast(Unix_timestamp(Cast(valid_end_date AS STRING), 'yyyyMMdd')
                    AS
                    TIMESTAMP)) AS valid_end_date,
       invalid_reason           AS invalid_reason
FROM   src_concept_relationship;


TRUNCATE TABLE vocab.concept_synonym;

INSERT INTO vocab.concept_synonym
SELECT concept_id,
       concept_synonym_name,
       language_concept_id
FROM   src_concept_synonym;


TRUNCATE TABLE vocab.concept;

INSERT INTO vocab.concept
SELECT concept_id               AS concept_id,
       concept_name             AS concept_name,
       domain_id                AS domain_id,
       vocabulary_id            AS vocabulary_id,
       concept_class_id         AS concept_class_id,
       standard_concept         AS standard_concept,
       concept_code             AS concept_code,
       To_date(Cast(Unix_timestamp(Cast(valid_start_date AS STRING), 'yyyyMMdd')
                    AS
                    TIMESTAMP)) AS valid_start_date,
       To_date(Cast(Unix_timestamp(Cast(valid_end_date AS STRING), 'yyyyMMdd')
                    AS
                    TIMESTAMP)) AS valid_end_date,
       invalid_reason           AS invalid_reason
FROM   src_concept;


TRUNCATE TABLE vocab.domain;

INSERT INTO vocab.domain
SELECT domain_id,
       domain_name,
       domain_concept_id
FROM   src_domain;


TRUNCATE TABLE vocab.drug_strength;

INSERT INTO vocab.drug_strength
SELECT Cast(drug_concept_id AS INT)             AS drug_concept_id,
       Cast(ingredient_concept_id AS INT)       AS ingredient_concept_id,
       Cast(amount_value AS FLOAT)                  AS amount_value,
       Cast(amount_unit_concept_id AS INT)      AS amount_unit_concept_id,
       Cast(numerator_value AS FLOAT)               AS numerator_value,
       Cast(numerator_unit_concept_id AS INT)   AS numerator_unit_concept_id
       ,
       Cast(denominator_value AS FLOAT)             AS denominator_value
       ,
       Cast(denominator_unit_concept_id AS INT) AS
       denominator_unit_concept_id,
       Cast(box_size AS INT)                    AS box_size,
       To_date(Cast(Unix_timestamp(Cast(valid_start_date AS STRING), 'yyyyMMdd')
                    AS
                    TIMESTAMP))                     AS valid_start_date,
       To_date(Cast(Unix_timestamp(Cast(valid_end_date AS STRING), 'yyyyMMdd')
                    AS
                    TIMESTAMP))                     AS valid_end_date,
       invalid_reason                               AS invalid_reason
FROM   src_drug_strength;


TRUNCATE TABLE vocab.relationship;

INSERT INTO vocab.relationship
SELECT relationship_id,
       relationship_name,
       is_hierarchical,
       defines_ancestry,
       reverse_relationship_id,
       relationship_concept_id
FROM   src_relationship;


TRUNCATE TABLE vocab.vocabulary;

INSERT INTO vocab.vocabulary
SELECT vocabulary_id                      AS vocabulary_id,
       vocabulary_name                    AS vocabulary_name,
       vocabulary_reference               AS vocabulary_reference,
       vocabulary_version                 AS vocabulary_version,
       Cast(vocabulary_concept_id AS INT) AS vocabulary_concept_id
FROM   src_vocabulary;


TRUNCATE TABLE vocab.source_to_concept_map;

INSERT INTO vocab.source_to_concept_map
SELECT source_code                    AS source_code,
       Cast(source_concept_id AS INT) AS source_concept_id,
       source_vocabulary_id           AS source_vocabulary_id,
       source_code_description        AS source_code_description,
       Cast(target_concept_id AS INT) AS target_concept_id,
       target_vocabulary_id           AS target_vocabulary_id,
       To_date(Cast(Unix_timestamp(Cast(valid_start_date AS STRING),
                    'yyyy-MM-dd') AS
                    TIMESTAMP
               ))                     AS valid_start_date,
       To_date(Cast(Unix_timestamp(Cast(valid_end_date AS STRING), 'yyyy-MM-dd')
                    AS
                    TIMESTAMP))       AS valid_end_date,
       invalid_reason                 AS invalid_reason
FROM   src_source_to_concept_map;
