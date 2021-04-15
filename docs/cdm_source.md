## Table name: cdm_source


| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| cdm_source_name |  | Populate with "Safety and Efficacy of the Xanomeline Transdermal Therapeutic System (TTS) in Patients with Mild to Moderate alzheimer's disease." |  |
| cdm_source_abbreviation |  | Populate with 'NCT00987090' |  |
| cdm_holder |  | Populate with 'Clinical Trials Workgroup' |  |
| source_description |  | Populate with "Safety and Efficacy of the Xanomeline Transdermal Therapeutic System (TTS) in Patients with Mild to Moderate alzheimer's disease. Trial Primary Objective: To determine if there is a statistically significant relationship between the change in both ADAS-Cog and CIBIC+ scores, and drug dose (0, 50 cm2 [54 mg], and 75 cm2 [81 mg]). Trial Primary Objective: To document the safety profile of the xanomeline TTS." |  |
| source_documentation_reference | NULL |  |  |
| cdm_etl_reference |  | Populate with 'https://github.com/OHDSI/CommonDataModel/blob/v5.3.1/OMOP_CDM_v5_3_1.pdf' |  |
| source_release_date |  | Populate with 2015-03-31 | Interim Analysis Data Cutoff Date |
| cdm_release_date |  | `CURRENT_DATE()` |  |
| cdm_version |  | Populate with '5.3.1' |  |
| vocabulary_version |  | Populate with the current vocabulary version: <br> `SELECT vocabulary_version` <br> `FROM cdm.vocabulary` <br> `WHERE vocabulary_id = ‘None’` |  |
