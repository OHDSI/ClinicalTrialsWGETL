-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
TRUNCATE TABLE cdm.cdm_source;

INSERT INTO cdm.cdm_source
SELECT Concat('Safety and Efficacy of the Xanomeline',
              'Transdermal Therapeutic System (TTS)',
              ' in Patients with Mild to Moderate', "alzheimer's disease.") AS
       cdm_source_name,
       'NCT00987090'                                                        AS
       cdm_source_abbreviation,
       'Clinical Trials Workgroup'                                          AS
       cdm_holder,
       Concat('Safety and Efficacy of the Xanomeline',
       'Transdermal Therapeutic System (TTS)',
       ' in Patients with Mild to Moderate',
       "alzheimer's disease. ", 'Trial Primary Objective: ',
       'To determine if there is a statistically significant',
       ' relationship between the change in both ADAS-Cog and ',
       'CIBIC+ scores, and drug dose (0, 50 cm2 [54 mg],',
       ' and 75 cm2 [81 mg]). ',
       'Trial Primary Objective: ',
       'To document the safety profile of the xanomeline TTS.')             AS
       source_description,
       NULL                                                                 AS
       source_documentation_reference,
       Concat('https://github.com/OHDSI/CommonDataModel/',
       'blob/v5.3.1/OMOP_CDM_v5_3_1.pdf')                                   AS
       cdm_etl_reference,
       Cast('2015-03-31' AS date)                                           AS
       source_release_date,
       CURRENT_DATE()                                                       AS
       cdm_release_date,
       '5.3.1'                                                              AS
       cdm_version,
       voc.vocabulary_version                                               AS
       vocabulary_version
FROM   vocab.vocabulary voc
WHERE  voc.vocabulary_id = 'None';
