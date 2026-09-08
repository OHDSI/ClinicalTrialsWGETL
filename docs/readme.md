# Clinical Trial Source Data Mapping Approach to OMOP CDM

## Contents

| CDM Table | Source Tables | Status | CT Topic |
| --- | :-: | :-: | --- |
| **Standardized Health System Data Tables** |  |  |  |
| [location](location.md) |  | done |  |  |
| [care_site](care_site.md) |  |  done |  |
| [provider](provider.md) |  | done |  |
| **Clinical Data Tables** |  |  |  |
| [person](person.md) | dm | done |  |
| [observation_period](observation_period.md) | sv | done |  |
| [visit_occurrence](visit_occurrence.md) | ds</br>sv |  |  |
| [condition_occurrence](condition_occurrence.md) | ae</br>ce</br>pr | done |  |
| [drug_exposure](drug_exposure.md) | cm</br>ex |  |  |
| procedure_occurrence | cm</br>pr |  |  |
| device_exposure |  | not covered |  |
| [measurement](measurement.md) | eg</br>ft</br>lb</br>mb</br>ms</br>pe</br>pc<br>qs</br>re</br>rs</br>vs |  | Questionnaire |
| [observation](observation.md) | ae</br>ce</br>dm</br> ds</br> mh</br> sv</br> |  | Seriousness, Severity </br> Trial/Arm assignment </br> Study withdrawal </br> Reason for visit |
| death | ae</br>dd</br>dm | |  |
| note |  | not covered |  |
| specimen |  | not covered |  |
| fact_relationship |  | not covered |  |
| [cohort](cohort.md) | dm | done | Trial/Arm definition |
| [cohort_definition](cohort_definition.md) | --- | done | Trial/Arm definition |
| **Standardized Derived Elements** |  |  |  |
| drug_era |  | not covered |  |
| dose_era |  | not covered |  |
| condition_era |  | not covered |  |
| **Metadata tables** |  |  |  |
| [metadata](metadata.md) | ta</br>td</br>ti</br>tm</br>ts</br>tv | done | Trial summary </br> Trial inclusion/exclusion criteria |
| [cdm_source](cdm_source.md) |  | done |  |


## Source
[Source Appendix](source_appendix.md)

### Missing specification for

- ae <- Adverse Events: for convention on severity and causality

- lbch <- Lab: pick one of the lab tables as an example
- lbhe <-
- lbur <-

- qsda
- qsgi
- qshi
- qsmm
- qsni
- relrec
- sc
- se
- suppae
- suppdm
- suppds
- supplbch
- supplbhe
- supplbur


### 
| Improving Vocabulary Matching | Concatenations to Improve USAGI Matches |
| :-: | :- |
| CE | CETERM + CECAT |
| CM | CMDECOD + CMDOSE + CMDOSU + CMROUTE |
| EX | EXTRT + EXDOSE + EXDOSU + EXROUTE + EXDOSFRM |
| LB | LBTEST + LBSPEC + LBCAT + LBORRESU (or LBSTRESU) |
| MB | MBTEST + MBTSTDTL |
| MS | MSTEST + MSAGENT + MSCAT |
| PR | PRTRT + PRINDC + PRCLAS |
| VS | VSTEST + VSSTRESU |
