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
| [observation_period](observation_period.md) | dm</br> sv |  |  |
| [visit_occurrence](visit_occurrence.md) | sv |  |  |
| [condition_occurrence](condition_occurrence.md) | ae | done |  |
| [drug_exposure](drug_exposure.md) | cm</br>ex |  |  |
| procedure_occurrence |  | not covered |  |
| device_exposure |  | not covered |  |
| [measurement](measurement.md) | qsco |  | Questionnaire |
| [observation](observation.md) | ae</br> dm</br> ds</br> mh</br> sv</br>  |  | Seriousness, Severity </br> Trial/Arm assignment </br> Study withdrawal </br> Reason for visit |
| death | dm | |  |
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
| [metadata](metadata.md) |  | done | Trial summary </br> Trial inclusion/exclusion criteria |
| [cdm_source](cdm_source.md) |  | done |  |


## Source
[Source Appendix](source_appendix.md)

### Missing specification for

- ae <- Adverse Events: for convention on severity and causality
- cm <-
- lbch <- Lab: pick one of the lab tables as an example
- lbhe <-
- lbur <-
- mh <- Medical History: for convention on historic events
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
- ta
- te
- tv
- vs <- Vital Signs: low-hanging fruit

### Tasks
- [ ] Philip: ae <- Adverse Events: for convention on severity and causality
- [ ] Philip: cm <- (only structural mapping)
- [ ] Chris: lbch, lbhe, lbur <- Lab: pick one of the lab tables as an example
- [ ] Maxim: mh <- Medical History: for convention on historic events
- [ ] Katy: vs <- Vital Signs: low-hanging fruit
- [ ] Sonia: dm to death
