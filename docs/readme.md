# Clinical Trial Source Data Mapping Approach to OMOP CDM

## Contents

| CDM Table | Source Tables | Status | CT Topic |
| --- | :-: | :-: | --- |
| **Standardized Health System Data Tables** |  |  |  |
| [location](location.md) |  | --- |  |  |
| [care_site](care_site.md) |  |  --- |  |
| [provider](provider.md) |  | --- |  |
| **Clinical Data Tables** |  |  |  |
| [person](person.md) | dm |  |  |
| [observation_period](observation_period.md) | dm</br> sv |  |  |
| [visit_occurrence](visit_occurrence.md) | sv |  |  |
| condition_occurrence |  | not covered |  |
| [drug_exposure](drug_exposure.md) | ex |  |  |
| procedure_occurrence |  | not covered |  |
| device_exposure |  | not covered |  |
| [measurement](measurement.md) | qsco |  | Questionnaire |
| [observation](observation.md)</br>[mh_to_observation](mh_to_observation.md) | dm</br> ds</br> sv</br> mh  |  | Trial/Arm assignment </br> Study withdrawal </br> Reason for visit </br> Severity |
| death | dm | not covered |  |
| note |  | not covered |  |
| specimen |  | not covered |  |
| fact_relationship |  | not covered |  |
| [cohort](cohort.md) | dm |  | Trial/Arm definition |
| [cohort_definition](cohort_definition.md) | --- |  | Trial/Arm definition |
| **Standardized Derived Elements** |  |  |  |
| drug_era |  | not covered |  |
| dose_era |  | not covered |  |
| condition_era |  | not covered |  |
| **Metadata tables** |  |  |  |
| [metadata](metadata.md) |  |  | Trial summary </br> Trial inclusion/exclusion criteria |
| cdm_source |  | not covered |


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
