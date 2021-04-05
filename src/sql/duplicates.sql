-------------------------------------------------------------------
-- Observational Health Data Sciences and Informatics
-- Clinical Trials Workgroup
-------------------------------------------------------------------
DROP TABLE IF EXISTS temp.duplicates;

CREATE TABLE temp.duplicates
  (
     domain_id    STRING,
     prededup_id  INT,
     postdedup_id INT,
     src_tbl      STRING,
     src_row      INT
  ) using parquet; 
