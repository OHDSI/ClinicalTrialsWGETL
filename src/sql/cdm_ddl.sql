-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-- Based on official OHDSI DDL script for CDM v.5.3.1
-- available at https://github.com/OHDSI/CommonDataModel
-- with two additional fields in the measurement and observation tables
-- specific to Clinical Trials and three extra fields in each cdm table
-- (except for vocabs and metadata tables) for testing
-------------------------------------------------------------------

-------------------------------------------------------------------
-- Standardized vocabulary
-------------------------------------------------------------------
DROP DATABASE IF EXISTS vocab CASCADE;

CREATE DATABASE vocab;

CREATE TABLE vocab.concept
  (
     concept_id       INT,
     concept_name     STRING,
     domain_id        STRING,
     vocabulary_id    STRING,
     concept_class_id STRING,
     standard_concept STRING,
     concept_code     STRING,
     valid_start_date TIMESTAMP,
     valid_end_date   TIMESTAMP,
     invalid_reason   STRING
 ) using parquet;

CREATE TABLE vocab.vocabulary
  (
     vocabulary_id         STRING,
     vocabulary_name       STRING,
     vocabulary_reference  STRING,
     vocabulary_version    STRING,
     vocabulary_concept_id INT
 ) using parquet;

CREATE TABLE vocab.domain
  (
     domain_id         STRING,
     domain_name       STRING,
     domain_concept_id INT
 ) using parquet;

CREATE TABLE vocab.concept_class
  (
     concept_class_id         STRING,
     concept_class_name       STRING,
     concept_class_concept_id INT
  ) using parquet;

CREATE TABLE vocab.concept_relationship
  (
     concept_id_1     INT,
     concept_id_2     INT,
     relationship_id  STRING,
     valid_start_date TIMESTAMP,
     valid_end_date   TIMESTAMP,
     invalid_reason   STRING
  ) using parquet;

CREATE TABLE vocab.relationship
  (
     relationship_id         STRING,
     relationship_name       STRING,
     is_hierarchical         STRING,
     defines_ancestry        STRING,
     reverse_relationship_id STRING,
     relationship_concept_id INT
  ) using parquet;

CREATE TABLE vocab.concept_synonym
  (
     concept_id           INT,
     concept_synonym_name STRING,
     language_concept_id  INT
  ) using parquet;

CREATE TABLE vocab.concept_ancestor
  (
     ancestor_concept_id      INT,
     descendant_concept_id    INT,
     min_levels_of_separation INT,
     max_levels_of_separation INT
  ) using parquet;

CREATE TABLE vocab.source_to_concept_map
  (
     source_code             STRING,
     source_concept_id       INT,
     source_vocabulary_id    STRING,
     source_code_description STRING,
     target_concept_id       INT,
     target_vocabulary_id    STRING,
     valid_start_date        TIMESTAMP,
     valid_end_date          TIMESTAMP,
     invalid_reason          STRING
  ) using parquet;

CREATE TABLE vocab.drug_strength
  (
     drug_concept_id             INT,
     ingredient_concept_id       INT,
     amount_value                FLOAT,
     amount_unit_concept_id      INT,
     numerator_value             FLOAT,
     numerator_unit_concept_id   INT,
     denominator_value           FLOAT,
     denominator_unit_concept_id INT,
     box_size                    INT,
     valid_start_date            TIMESTAMP,
     valid_end_date              TIMESTAMP,
     invalid_reason              STRING
  ) using parquet;


-------------------------------------------------------------------
--
-------------------------------------------------------------------
CREATE TABLE vocab.attribute_definition
  (
     attribute_definition_id   INT,
     attribute_name            STRING,
     attribute_description     STRING,
     attribute_type_concept_id INT,
     attribute_syntax          STRING
  ) using parquet;


-------------------------------------------------------------------
-- Standardized meta-data
-------------------------------------------------------------------
DROP DATABASE IF EXISTS cdm CASCADE;

CREATE DATABASE cdm;

CREATE TABLE cdm.cdm_source
  (
     cdm_source_name                STRING,
     cdm_source_abbreviation        STRING,
     cdm_holder                     STRING,
     source_description             STRING,
     source_documentation_reference STRING,
     cdm_etl_reference              STRING,
     source_release_date            TIMESTAMP,
     cdm_release_date               TIMESTAMP,
     cdm_version                    STRING,
     vocabulary_version             STRING
  ) using parquet;

CREATE TABLE cdm.metadata
  (
     metadata_concept_id      INT,
     metadata_type_concept_id INT,
     name                     STRING,
     value_as_string          STRING,
     value_as_concept_id      INT,
     metadata_date            TIMESTAMP,
     metadata_datetime        TIMESTAMP
  ) using parquet;


-------------------------------------------------------------------
-- Standardized clinical data
-------------------------------------------------------------------
CREATE TABLE cdm.person
  (
     person_id                   INT,
     gender_concept_id           INT,
     year_of_birth               INT,
     month_of_birth              INT,
     day_of_birth                INT,
     birth_datetime              TIMESTAMP,
     race_concept_id             INT,
     ethnicity_concept_id        INT,
     location_id                 INT,
     provider_id                 INT,
     care_site_id                INT,
     person_source_value         STRING,
     gender_source_value         STRING,
     gender_source_concept_id    INT,
     race_source_value           STRING,
     race_source_concept_id      INT,
     ethnicity_source_value      STRING,
     ethnicity_source_concept_id INT,
     rule_id                     STRING,
     src_tbl                     STRING,
     src_row                     INT
  ) using parquet;

CREATE TABLE cdm.observation_period
  (
     observation_period_id         INT,
     person_id                     INT,
     observation_period_start_date TIMESTAMP,
     observation_period_end_date   TIMESTAMP,
     period_type_concept_id        INT,
     rule_id                       STRING,
     src_tbl                       STRING,
     src_row                       INT
  ) using parquet;

CREATE TABLE cdm.specimen
  (
     specimen_id                 INT,
     person_id                   INT,
     specimen_concept_id         INT,
     specimen_type_concept_id    INT,
     specimen_date               TIMESTAMP,
     specimen_datetime           TIMESTAMP,
     quantity                    FLOAT,
     unit_concept_id             INT,
     anatomic_site_concept_id    INT,
     disease_status_concept_id   INT,
     specimen_source_id          STRING,
     specimen_source_value       STRING,
     unit_source_value           STRING,
     anatomic_site_source_value  STRING,
     disease_status_source_value STRING,
     rule_id                     STRING,
     src_tbl                     STRING,
     src_row                     INT
  ) using parquet;

CREATE TABLE cdm.death
  (
     person_id               INT,
     death_date              TIMESTAMP,
     death_datetime          TIMESTAMP,
     death_type_concept_id   INT,
     cause_concept_id        INT,
     cause_source_value      STRING,
     cause_source_concept_id INT,
     rule_id                 STRING,
     src_tbl                 STRING,
     src_row                 INT
  ) using parquet;

CREATE TABLE cdm.visit_occurrence
  (
     visit_occurrence_id           INT,
     person_id                     INT,
     visit_concept_id              INT,
     visit_start_date              TIMESTAMP,
     visit_start_datetime          TIMESTAMP,
     visit_end_date                TIMESTAMP,
     visit_end_datetime            TIMESTAMP,
     visit_type_concept_id         INT,
     provider_id                   INT,
     care_site_id                  INT,
     visit_source_value            STRING,
     visit_source_concept_id       INT,
     admitting_source_concept_id   INT,
     admitting_source_value        STRING,
     discharge_to_concept_id       INT,
     discharge_to_source_value     STRING,
     preceding_visit_occurrence_id INT,
     rule_id                       STRING,
     src_tbl                       STRING,
     src_row                       INT
  ) using parquet;

CREATE TABLE cdm.visit_detail
  (
     visit_detail_id                INT,
     person_id                      INT,
     visit_detail_concept_id        INT,
     visit_detail_start_date        TIMESTAMP,
     visit_detail_start_datetime    TIMESTAMP,
     visit_detail_end_date          TIMESTAMP,
     visit_detail_end_datetime      TIMESTAMP,
     visit_detail_type_concept_id   INT,
     provider_id                    INT,
     care_site_id                   INT,
     admitting_source_concept_id    INT,
     discharge_to_concept_id        INT,
     preceding_visit_detail_id      INT,
     visit_detail_source_value      STRING,
     visit_detail_source_concept_id INT,
     admitting_source_value         STRING,
     discharge_to_source_value      STRING,
     visit_detail_parent_id         INT,
     visit_occurrence_id            INT,
     rule_id                        STRING,
     src_tbl                        STRING,
     src_row                        INT
  ) using parquet;

CREATE TABLE cdm.procedure_occurrence
  (
     procedure_occurrence_id     INT,
     person_id                   INT,
     procedure_concept_id        INT,
     procedure_date              TIMESTAMP,
     procedure_datetime          TIMESTAMP,
     procedure_type_concept_id   INT,
     modifier_concept_id         INT,
     quantity                    INT,
     provider_id                 INT,
     visit_occurrence_id         INT,
     visit_detail_id             INT,
     procedure_source_value      STRING,
     procedure_source_concept_id INT,
     modifier_source_value       STRING,
     rule_id                     STRING,
     src_tbl                     STRING,
     src_row                     INT
  ) using parquet;

CREATE TABLE cdm.drug_exposure
  (
     drug_exposure_id             INT,
     person_id                    INT,
     drug_concept_id              INT,
     drug_exposure_start_date     TIMESTAMP,
     drug_exposure_start_datetime TIMESTAMP,
     drug_exposure_end_date       TIMESTAMP,
     drug_exposure_end_datetime   TIMESTAMP,
     verbatim_end_date            TIMESTAMP,
     drug_type_concept_id         INT,
     stop_reason                  STRING,
     refills                      INT,
     quantity                     FLOAT,
     days_supply                  INT,
     sig                          STRING,
     route_concept_id             INT,
     lot_number                   STRING,
     provider_id                  INT,
     visit_occurrence_id          INT,
     visit_detail_id              INT,
     drug_source_value            STRING,
     drug_source_concept_id       INT,
     route_source_value           STRING,
     dose_unit_source_value       STRING,
     rule_id                      STRING,
     src_tbl                      STRING,
     src_row                      INT
  ) using parquet;

CREATE TABLE cdm.device_exposure
  (
     device_exposure_id             INT,
     person_id                      INT,
     device_concept_id              INT,
     device_exposure_start_date     TIMESTAMP,
     device_exposure_start_datetime TIMESTAMP,
     device_exposure_end_date       TIMESTAMP,
     device_exposure_end_datetime   TIMESTAMP,
     device_type_concept_id         INT,
     unique_device_id               STRING,
     quantity                       INT,
     provider_id                    INT,
     visit_occurrence_id            INT,
     visit_detail_id                INT,
     device_source_value            STRING,
     device_source_concept_id       INT,
     rule_id                        STRING,
     src_tbl                        STRING,
     src_row                        INT
  ) using parquet;

CREATE TABLE cdm.condition_occurrence
  (
     condition_occurrence_id       INT,
     person_id                     INT,
     condition_concept_id          INT,
     condition_start_date          TIMESTAMP,
     condition_start_datetime      TIMESTAMP,
     condition_end_date            TIMESTAMP,
     condition_end_datetime        TIMESTAMP,
     condition_type_concept_id     INT,
     stop_reason                   STRING,
     provider_id                   INT,
     visit_occurrence_id           INT,
     visit_detail_id               INT,
     condition_source_value        STRING,
     condition_source_concept_id   INT,
     condition_status_source_value STRING,
     condition_status_concept_id   INT,
     rule_id                       STRING,
     src_tbl                       STRING,
     src_row                       INT
  ) using parquet;

CREATE TABLE cdm.measurement
  (
     measurement_id                INT,
     person_id                     INT,
     measurement_concept_id        INT,
     measurement_date              TIMESTAMP,
     measurement_datetime          TIMESTAMP,
     measurement_time              STRING,
     measurement_type_concept_id   INT,
     operator_concept_id           INT,
     value_as_number               FLOAT,
     value_as_concept_id           INT,
     unit_concept_id               INT,
     range_low                     FLOAT,
     range_high                    FLOAT,
     provider_id                   INT,
     visit_occurrence_id           INT,
     visit_detail_id               INT,
     measurement_source_value      STRING,
     measurement_source_concept_id INT,
     unit_source_value             STRING,
     value_source_value            STRING,
     modifier_of_event_id          INT,
     modifier_of_field_concept_id  INT,
     rule_id                       STRING,
     src_tbl                       STRING,
     src_row                       INT
  ) using parquet;

CREATE TABLE cdm.note
  (
     note_id               INT,
     person_id             INT,
     note_date             TIMESTAMP,
     note_datetime         TIMESTAMP,
     note_type_concept_id  INT,
     note_class_concept_id INT,
     note_title            STRING,
     note_text             STRING,
     encoding_concept_id   INT,
     language_concept_id   INT,
     provider_id           INT,
     visit_occurrence_id   INT,
     visit_detail_id       INT,
     note_source_value     STRING,
     rule_id               STRING,
     src_tbl               STRING,
     src_row               INT
  ) using parquet;

CREATE TABLE cdm.note_nlp
  (
     note_nlp_id                INT,
     note_id                    INT,
     section_concept_id         INT,
     snippet                    STRING,
     offset                     STRING,
     lexical_variant            STRING,
     note_nlp_concept_id        INT,
     note_nlp_source_concept_id INT,
     nlp_system                 STRING,
     nlp_date                   TIMESTAMP,
     nlp_datetime               TIMESTAMP,
     term_exists                STRING,
     term_temporal              STRING,
     term_modifiers             STRING,
     rule_id                    STRING,
     src_tbl                    STRING,
     src_row                    INT
  ) using parquet;

CREATE TABLE cdm.observation
  (
     observation_id                INT,
     person_id                     INT,
     observation_concept_id        INT,
     observation_date              TIMESTAMP,
     observation_datetime          TIMESTAMP,
     observation_type_concept_id   INT,
     value_as_number               FLOAT,
     value_as_string               STRING,
     value_as_concept_id           INT,
     qualifier_concept_id          INT,
     unit_concept_id               INT,
     provider_id                   INT,
     visit_occurrence_id           INT,
     visit_detail_id               INT,
     observation_source_value      STRING,
     observation_source_concept_id INT,
     unit_source_value             STRING,
     qualifier_source_value        STRING,
     observation_event_id          INT,
     obs_event_field_concept_id    INT,
     rule_id                       STRING,
     src_tbl                       STRING,
     src_row                       INT
  ) using parquet;

CREATE TABLE cdm.fact_relationship
  (
     domain_concept_id_1     INT,
     fact_id_1               INT,
     domain_concept_id_2     INT,
     fact_id_2               INT,
     relationship_concept_id INT,
     rule_id                 STRING,
     src_tbl                 STRING,
     src_row                 INT
  ) using parquet;


-------------------------------------------------------------------
-- Standardized health system data
-------------------------------------------------------------------
CREATE TABLE cdm.location
  (
     location_id           INT,
     address_1             STRING,
     address_2             STRING,
     city                  STRING,
     state                 STRING,
     zip                   STRING,
     county                STRING,
     location_source_value STRING,
     rule_id               STRING,
     src_tbl               STRING,
     src_row               INT
  ) using parquet;

CREATE TABLE cdm.care_site
  (
     care_site_id                  INT,
     care_site_name                STRING,
     place_of_service_concept_id   INT,
     location_id                   INT,
     care_site_source_value        STRING,
     place_of_service_source_value STRING,
     rule_id                       STRING,
     src_tbl                       STRING,
     src_row                       INT
  ) using parquet;

CREATE TABLE cdm.provider
  (
     provider_id                 INT,
     provider_name               STRING,
     npi                         STRING,
     dea                         STRING,
     specialty_concept_id        INT,
     care_site_id                INT,
     year_of_birth               INT,
     gender_concept_id           INT,
     provider_source_value       STRING,
     specialty_source_value      STRING,
     specialty_source_concept_id INT,
     gender_source_value         STRING,
     gender_source_concept_id    INT,
     rule_id                     STRING,
     src_tbl                     STRING,
     src_row                     INT
  ) using parquet;


-------------------------------------------------------------------
-- Standardized health economics
-------------------------------------------------------------------
CREATE TABLE cdm.payer_plan_period
  (
     payer_plan_period_id          INT,
     person_id                     INT,
     payer_plan_period_start_date  TIMESTAMP,
     payer_plan_period_end_date    TIMESTAMP,
     payer_concept_id              INT,
     payer_source_value            STRING,
     payer_source_concept_id       INT,
     plan_concept_id               INT,
     plan_source_value             STRING,
     plan_source_concept_id        INT,
     sponsor_concept_id            INT,
     sponsor_source_value          STRING,
     sponsor_source_concept_id     INT,
     family_source_value           STRING,
     stop_reason_concept_id        INT,
     stop_reason_source_value      STRING,
     stop_reason_source_concept_id INT,
     rule_id                       STRING,
     src_tbl                       STRING,
     src_row                       INT
  ) using parquet;

CREATE TABLE cdm.cost
  (
     cost_id                   INT,
     cost_event_id             INT,
     cost_domain_id            STRING,
     cost_type_concept_id      INT,
     currency_concept_id       INT,
     total_charge              FLOAT,
     total_cost                FLOAT,
     total_paid                FLOAT,
     paid_by_payer             FLOAT,
     paid_by_patient           FLOAT,
     paid_patient_copay        FLOAT,
     paid_patient_coinsurance  FLOAT,
     paid_patient_deductible   FLOAT,
     paid_by_primary           FLOAT,
     paid_ingredient_cost      FLOAT,
     paid_dispensing_fee       FLOAT,
     payer_plan_period_id      INT,
     amount_allowed            FLOAT,
     revenue_code_concept_id   INT,
     revenue_code_source_value STRING,
     drg_concept_id            INT,
     drg_source_value          STRING,
     rule_id                   STRING,
     src_tbl                   STRING,
     src_row                   INT
  ) using parquet;

-------------------------------------------------------------------
-- Standardized derived elements
-------------------------------------------------------------------
CREATE TABLE cdm.cohort_definition
  (
     cohort_definition_id          INT,
     cohort_definition_name        STRING,
     cohort_definition_description STRING,
     definition_type_concept_id    INT,
     cohort_definition_syntax      STRING,
     subject_concept_id            INT,
     cohort_initiation_date        TIMESTAMP
  ) using parquet;

CREATE TABLE cdm.cohort
  (
     cohort_definition_id INT,
     subject_id           INT,
     cohort_start_date    TIMESTAMP,
     cohort_end_date      TIMESTAMP
  ) using parquet;

CREATE TABLE cdm.cohort_attribute
  (
     cohort_definition_id    INT,
     cohort_start_date       TIMESTAMP,
     cohort_end_date         TIMESTAMP,
     subject_id              INT,
     attribute_definition_id INT,
     value_as_number         FLOAT,
     value_as_concept_id     INT
  ) using parquet;

CREATE TABLE cdm.drug_era
  (
     drug_era_id         INT,
     person_id           INT,
     drug_concept_id     INT,
     drug_era_start_date TIMESTAMP,
     drug_era_end_date   TIMESTAMP,
     drug_exposure_count INT,
     gap_days            INT
  ) using parquet;

CREATE TABLE cdm.dose_era
  (
     dose_era_id         INT,
     person_id           INT,
     drug_concept_id     INT,
     unit_concept_id     INT,
     dose_value          FLOAT,
     dose_era_start_date TIMESTAMP,
     dose_era_end_date   TIMESTAMP
  ) using parquet;

CREATE TABLE cdm.condition_era
  (
     condition_era_id           INT,
     person_id                  INT,
     condition_concept_id       INT,
     condition_era_start_date   TIMESTAMP,
     condition_era_end_date     TIMESTAMP,
     condition_occurrence_count INT
 ) using parquet;
