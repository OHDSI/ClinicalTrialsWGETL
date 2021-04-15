-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
TRUNCATE TABLE cdm.cohort_definition;

INSERT INTO cdm.cohort_definition
VALUES      ( 1,
              'Planned Arm - Placebo',
              'Planned Arm - Placebo',
              0,
              "select person_id from cdm.person inner join dm on dm.usubjid = cdm.person.person_source_value and dm.armcd = 'pbo'"
              ,
              1147314,-- 'person'
              CURRENT_DATE() ),
            ( 2,
              'Planned Arm - Xanomeline High Dose',
              'Planned Arm - Xanomeline High Dose',
              0,
              "select person_id from cdm.person inner join dm on dm.usubjid = cdm.person.person_source_value and dm.armcd = 'xan_hi'"
              ,
              1147314,-- 'person'
              CURRENT_DATE() ),
            ( 3,
              'Planned Arm - Xanomeline Low Dose',
              'Planned Arm - Xanomeline Low Dose',
              0,
              "select person_id from cdm.person inner join dm on dm.usubjid = cdm.person.person_source_value and dm.armcd = 'xan_lo'"
              ,
              1147314,-- 'person'
              CURRENT_DATE() ),
            ( 4,
              'Actual Arm - Placebo',
              'Actual Arm - Placebo',
              0,
              "select person_id from cdm.person inner join dm on dm.usubjid = cdm.person.person_source_value and dm.actarmcd = 'pbo'"
              ,
              1147314,-- 'person'
              CURRENT_DATE() ),
            ( 5,
              'Actual Arm - Xanomeline High Dose',
              'Actual Arm - Xanomeline High Dose',
              0,
              "select person_id from cdm.person inner join dm on dm.usubjid = cdm.person.person_source_value and dm.actarmcd = 'xan_hi'"
              ,
              1147314,-- 'person'
              CURRENT_DATE() ),
            ( 6,
              'Actual Arm - Xanomeline Low Dose',
              'Actual Arm - Xanomeline Low Dose',
              0,
              "select person_id from cdm.person inner join dm on dm.usubjid = cdm.person.person_source_value and dm.actarmcd = 'xan_lo'"
              ,
              1147314,-- 'person'
              CURRENT_DATE()
);
