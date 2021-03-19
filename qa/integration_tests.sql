-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------

DROP TABLE IF EXISTS temp.test_report PURGE;

CREATE TABLE temp.test_report
  (
     test_id          INT,
     rule_id          STRING,
     test_description STRING,
     expected_result  INT,
     actual_result    INT,
     passed_flg       STRING
  ) using parquet;


INSERT INTO temp.test_report
SELECT 1                                                               AS
       test_id,
       'person.dm'                                                     AS
       rule_id,
       'Count difference between the cdm and the source after filters' AS
       test_description,
       0                                                               AS
       expected_result,
       result                                                          AS
       actual_result,
       CASE
         WHEN result = 0 THEN 'Passed'
         ELSE 'Failed'
       END                                                             AS
       passed_flg
FROM   (SELECT ( (SELECT Count(*)
                  FROM   cdm.person) - (SELECT Count(*)
                                        FROM   src.dm
                                        WHERE  usubjid IS NOT NULL
                                               AND rfpendtc IS NOT NULL
                                               AND age IS NOT NULL
                                               AND Cast(Concat(Cast(Year(dmdtc)
                                                                    - age
                                                                    AS INT),
                                                        '-01-01') AS DATE) <=
                                                   CURRENT_DATE()) ) AS result)
       tbl;
