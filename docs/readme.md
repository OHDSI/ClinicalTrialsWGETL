# Clinical Trial Source Data Mapping Approach to OMOP CDM v6

## Contents

### Standardized Health System Data Tables

[location](location.md)

[dm_to_care_site](dm_to_care_site.md)

[provider](provider.md)

### Person

[dm_to_person](dm_to_person.md)

[sv_to_observation_period](sv_to_observation_period.md)

### Visit

[sv_to_visit_occurrence](sv_to_visit_occurrence.md)

[sv_to_observation](sv_to_observation.md) (Reason for visit)

### Questionnaire
[qsco_to_measurement](qsco_to_measurement.md) (Questionnaire)

### Drug Exposure
[ex_to_drug_exposure](ex_to_drug_exposure.md)

### Study administration

[dm_to_observation](dm_to_observation.md) (Trial/Arm assignment)

[ds_to_observation](ds_to_observation.md) (Study withdrawal)

Trial/Arm definition:

- [dm_to_cohort](dm_to_cohort.md)
- [dm_to_cohort_definition](dm_to_cohort_definition.md)

[ts_to_metadata](ts_to_metadata.md) (Trial summary)

[ti_to_metadata](ti_to_metadata.md) (Trial inclusion)

## OMOP tables without source table

### Clinical tables
- condition_occurrence

- death

- procedure_occurrence

- device_exposure

- note

- specimen

- fact_relationship

### Standardized Derived Elements

- drug_era

- dose_era

- condition_era

### Metadata

- cdm_source

## Source
[Source Appendix](source_appendix.md)

### Missing specification for

- ae
- cm
- lbch
- lbhe
- lbur
- mh
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
- vs