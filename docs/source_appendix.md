# Appendix: source tables

### Table: dm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | DM |  |
| usubjid | varchar |  |  |
| subjid | int |  |  |
| rfstdtc | date |  |  |
| rfendtc | date |  |  |
| rfxstdtc | date |  |  |
| rfxendtc | date |  |  |
| rficdtc | empty |  |  |
| rfpendtc | varchar | 2013-06-03 |  |
| dthdtc | date |  |  |
| dthfl | varchar |  |  |
| siteid | int | 718 |  |
| age | int | 74 |  |
| ageu | varchar | YEARS |  |
| sex | varchar | F |  |
| race | varchar | WHITE |  |
| ethnic | varchar | NOT HISPANIC OR LATINO |  |
| armcd | varchar | Xan_Hi |  |
| arm | varchar | Xanomeline High Dose |  |
| actarmcd | varchar | Xan_Hi |  |
| actarm | varchar | Xanomeline High Dose |  |
| country | varchar | USA |  |
| dmdtc | date | 2012-12-13 |  |
| dmdy | int | -4 |  |

### Table: ae.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | AE |  |
| usubjid | varchar |  |  |
| aeseq | real | 2 |  |
| aespid | varchar | E05 |  |
| aeterm | varchar | APPLICATION SITE PRURITUS |  |
| aellt | varchar | APPLICATION SITE ITCHING |  |
| aelltcd | int | 0 |  |
| aedecod | varchar | APPLICATION SITE PRURITUS |  |
| aeptcd | int | 0 |  |
| aehlt | varchar | HLT_0317 |  |
| aehltcd | int | 0 |  |
| aehlgt | varchar | HLGT_0338 |  |
| aehlgtcd | int | 0 |  |
| aebodsys | varchar | GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS |  |
| aebdsycd | int | 0 |  |
| aesoc | varchar | GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS |  |
| aesoccd | int | 0 |  |
| aesev | varchar | MILD |  |
| aeser | varchar | N |  |
| aeacn | empty |  |  |
| aerel | varchar | POSSIBLE |  |
| aeout | varchar | RECOVERED/RESOLVED |  |
| aescan | varchar | N |  |
| aescong | varchar | N |  |
| aesdisab | varchar | N |  |
| aesdth | varchar | N |  |
| aeshosp | varchar | N |  |
| aeslife | varchar | N |  |
| aesod | varchar | N |  |
| epoch | varchar | TREATMENT |  |
| aedtc | date | 2013-06-03 |  |
| aestdtc | varchar | 2013-02-04 |  |
| aeendtc | date |  |  |
| aedy | int | 15 |  |
| aestdy | int | 50 |  |
| aeendy | int | 0 |  |

### Table: cm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | CM |  |
| usubjid | varchar | 01-716-1157 |  |
| cmseq | real | 1 |  |
| cmspid | int | 1 |  |
| cmtrt | varchar | MULTIVITAMIN |  |
| cmdecod | varchar | UNCODED |  |
| cmindc | varchar |  |  |
| cmclas | varchar | UNCODED |  |
| cmdose | real | 1 |  |
| cmdosu | varchar | mg |  |
| cmdosfrq | varchar | QD |  |
| cmroute | varchar | ORAL |  |
| visitnum | int | 4 |  |
| visit | varchar | WEEK 2 |  |
| visitdy | int | 14 |  |
| epoch | varchar | TREATMENT |  |
| cmdtc | date | 2013-06-03 |  |
| cmstdtc | varchar | 2010 |  |
| cmendtc | varchar |  |  |
| cmdy | int | 1 |  |
| cmstdy | int | 0 |  |
| cmendy | int | 0 |  |

### Table: ds.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | DS |  |
| usubjid | varchar |  |  |
| dsseq | real | 1 |  |
| dsspid | int |  |  |
| dsterm | varchar | FINAL LAB VISIT |  |
| dsdecod | varchar | FINAL LAB VISIT |  |
| dscat | varchar | DISPOSITION EVENT |  |
| visitnum | real | 13 |  |
| visit | varchar | WEEK 26 |  |
| epoch | varchar | FOLLOW-UP |  |
| dsdtc | varchar | 2013-06-03 |  |
| dsstdtc | date | 2013-06-03 |  |
| dsdy | int | 183 |  |
| dsstdy | int | 183 |  |

### Table: ex.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | EX |  |
| usubjid | varchar |  |  |
| exseq | real | 1 |  |
| extrt | varchar | XANOMELINE |  |
| exdose | real | 54 |  |
| exdosu | varchar | mg |  |
| exdosfrm | varchar | PATCH |  |
| exdosfrq | varchar | QD |  |
| exroute | varchar | TRANSDERMAL |  |
| visitnum | int | 3 |  |
| visit | varchar | BASELINE |  |
| visitdy | int | 1 |  |
| epoch | varchar | TREATMENT |  |
| exstdtc | date | 2013-01-01 |  |
| exendtc | date | 2013-02-11 |  |
| exstdy | int | 1 |  |
| exendy | int | 15 |  |

### Table: lbch.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | LB |  |
| usubjid | varchar | 01-704-1218 |  |
| lbseq | int | 8 |  |
| lbtestcd | varchar | URATE |  |
| lbtest | varchar | Urate |  |
| lbcat | varchar | CHEMISTRY |  |
| lborres | varchar | 4.0 |  |
| lborresu | varchar | mg/dL |  |
| lbornrlo | real | 6 |  |
| lbornrhi | real | 7.5 |  |
| lbstresc | varchar | 6.84 |  |
| lbstresn | real | 6.84 |  |
| lbstresu | varchar | mmol/L |  |
| lbstnrlo | real | 35 |  |
| lbstnrhi | real | 446 |  |
| lbnrind | varchar | NORMAL |  |
| lbblfl | varchar |  |  |
| visitnum | real | 1 |  |
| visit | varchar | SCREENING 1 |  |
| visitdy | int | -7 |  |
| epoch | varchar | TREATMENT |  |
| lbdtc | varchar | 2013-02-11T12:40 |  |
| lbdy | int | 15 |  |

### Table: lbhe.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | LB |  |
| usubjid | varchar | 01-716-1044 |  |
| lbseq | int | 22 |  |
| lbtestcd | varchar | WBC |  |
| lbtest | varchar | Leukocytes |  |
| lbcat | varchar | HEMATOLOGY |  |
| lborres | real | 32 |  |
| lborresu | varchar | 10^9/L |  |
| lbornrlo | real | 0 |  |
| lbornrhi | real | 10.7 |  |
| lbstresc | real | 20.4798 |  |
| lbstresn | real | 20.4798 |  |
| lbstresu | varchar | 10^9/L |  |
| lbstnrlo | real | 0 |  |
| lbstnrhi | real | 10.7 |  |
| lbnrind | varchar | NORMAL |  |
| lbblfl | varchar |  |  |
| visitnum | real | 1 |  |
| visit | varchar | SCREENING 1 |  |
| visitdy | int | -7 |  |
| epoch | varchar | TREATMENT |  |
| lbdtc | varchar | 2013-02-11T12:40 |  |
| lbdy | int | 15 |  |

### Table: lbur.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | LB |  |
| usubjid | varchar |  |  |
| lbseq | real | 33 |  |
| lbtestcd | varchar | KETONES |  |
| lbtest | varchar | Urobilinogen |  |
| lbcat | varchar | URINALYSIS |  |
| lborres | varchar | 0 |  |
| lborresu | varchar |  |  |
| lbornrlo | real |  |  |
| lbornrhi | real |  |  |
| lbstresc | varchar | 0 |  |
| lbstresn | real | 0 |  |
| lbstresu | varchar |  |  |
| lbstnrlo | real | 0 |  |
| lbstnrhi | real | 0 |  |
| lbnrind | varchar | NORMAL |  |
| lbblfl | varchar |  |  |
| visitnum | real | 1 |  |
| visit | varchar | SCREENING 1 |  |
| visitdy | int | -7 |  |
| epoch | varchar | TREATMENT |  |
| lbdtc | varchar | 2012-12-09T12:30 |  |
| lbdy | int | 15 |  |

### Table: mh.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | MH |  |
| usubjid | varchar |  |  |
| mhseq | real | 1 |  |
| mhspid | varchar |  |  |
| mhterm | varchar | ALZHEIMER'S DISEASE |  |
| mhllt | varchar |  |  |
| mhdecod | varchar |  |  |
| mhhlt | varchar |  |  |
| mhhlgt | varchar |  |  |
| mhcat | varchar | SIGNIFICANT PRE-EXISTING CONDITION |  |
| mhbodsys | varchar | SURGICAL AND MEDICAL PROCEDURES |  |
| mhsev | varchar |  |  |
| visitnum | int | 1 |  |
| visit | varchar | SCREENING 1 |  |
| visitdy | int | -7 |  |
| mhdtc | date | 2012-12-13 |  |
| mhstdtc | varchar |  |  |
| mhdy | int | -8 |  |

### Table: qsco.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | QS |  |
| usubjid | varchar | 01-718-1427 |  |
| qsseq | int | 5001 |  |
| qstestcd | varchar | ACTOT |  |
| qstest | varchar | ADAS-COG(11) Subscore |  |
| qscat | varchar | ADAS-COG |  |
| qsscat | empty |  |  |
| qsorres | real | 0 |  |
| qsorresu | varchar |  |  |
| qsstresc | real | 0 |  |
| qsstresn | real | 0 |  |
| qsstresu | varchar |  |  |
| qsstat | varchar |  |  |
| qsreasnd | varchar |  |  |
| qsblfl | varchar |  |  |
| qsdrvfl | varchar |  |  |
| visitnum | int | 3 |  |
| visit | varchar | BASELINE |  |
| visitdy | int | 1 |  |
| epoch | varchar | TREATMENT |  |
| qsdtc | date | 2013-06-03 |  |
| qsdy | int | 1 |  |

### Table: qsda.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | QS |  |
| usubjid | varchar | 01-718-1250 |  |
| qsseq | int | 4120 |  |
| qstestcd | varchar | DAITM40 |  |
| qstest | varchar | STAY SAFELY AT HOME BY HIMSELF/HERSELF |  |
| qscat | varchar | DAD |  |
| qsscat | varchar | HYGIENE |  |
| qsorres | varchar | Y |  |
| qsorresu | empty |  |  |
| qsstresc | int | 1 |  |
| qsstresn | int | 1 |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | varchar |  |  |
| qsdrvfl | empty |  |  |
| visitnum | int | 3 |  |
| visit | varchar | BASELINE |  |
| visitdy | int | 1 |  |
| epoch | varchar | TREATMENT |  |
| qsdtc | date | 2014-01-11 |  |
| qsdy | int | 1 |  |

### Table: qsgi.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | QS |  |
| usubjid | varchar | 01-718-1427 |  |
| qsseq | int | 6001 |  |
| qstestcd | varchar | CIBIC |  |
| qstest | varchar | EXTENT OF CHANGE, IF ANY, SINCE BASELINE |  |
| qscat | varchar | ADCS-CGIC |  |
| qsscat | empty |  |  |
| qsorres | varchar | NO CHANGE |  |
| qsorresu | empty |  |  |
| qsstresc | int | 4 |  |
| qsstresn | int | 4 |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | empty |  |  |
| qsdrvfl | empty |  |  |
| visitnum | int | 8 |  |
| visit | varchar | WEEK 8 |  |
| visitdy | int | 168 |  |
| epoch | varchar | TREATMENT |  |
| qsdtc | date | 2013-06-03 |  |
| qsdy | int | 169 |  |

### Table: qshi.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | QS |  |
| usubjid | varchar |  |  |
| qsseq | real | 1011 |  |
| qstestcd | varchar | MHITM01 |  |
| qstest | varchar | DEPRESSION |  |
| qscat | varchar | MHIS-NACC |  |
| qsscat | empty |  |  |
| qsorres | varchar | ABSENT |  |
| qsorresu | empty |  |  |
| qsstresc | int | 0 |  |
| qsstresn | int | 0 |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | empty |  |  |
| qsdrvfl | empty |  |  |
| visitnum | int | 1 |  |
| visit | varchar | SCREENING 1 |  |
| visitdy | int | -7 |  |
| epoch | varchar | TREATMENT |  |
| qsdtc | date | 2012-12-13 |  |
| qsdy | int | -8 |  |

### Table: qsmm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | QS |  |
| usubjid | varchar | 01-718-1427 |  |
| qsseq | int | 2006 |  |
| qstestcd | varchar | MMITM06 |  |
| qstest | varchar | NAME A PENCIL, AND WATCH (2 POINTS) |  |
| qscat | varchar | MMSE |  |
| qsscat | varchar | ORIENTATION |  |
| qsorres | int | 3 |  |
| qsorresu | empty |  |  |
| qsstresc | int | 3 |  |
| qsstresn | int | 3 |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | empty |  |  |
| qsdrvfl | empty |  |  |
| visitnum | int | 1 |  |
| visit | varchar | SCREENING 1 |  |
| visitdy | int | -7 |  |
| epoch | varchar | TREATMENT |  |
| qsdtc | date | 2012-12-13 |  |
| qsdy | int | -8 |  |

### Table: qsni.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | QS |  |
| usubjid | varchar | 01-718-1355 |  |
| qsseq | int | 3002 |  |
| qstestcd | varchar | NPITM05S |  |
| qstest | varchar | HALLUCINATIONS Score |  |
| qscat | varchar | NPI |  |
| qsscat | varchar | APPETITE/EATING CHANGE |  |
| qsorres | varchar | 0 |  |
| qsorresu | empty |  |  |
| qsstresc | int | 0 |  |
| qsstresn | real | 0 |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | varchar |  |  |
| qsdrvfl | varchar |  |  |
| visitnum | real | 3 |  |
| visit | varchar | BASELINE |  |
| visitdy | int | 1 |  |
| epoch | varchar | TREATMENT |  |
| qsdtc | date | 2013-09-05 |  |
| qsdy | int | 1 |  |

### Table: relrec.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| rdomain | varchar | AE |  |
| usubjid | varchar |  |  |
| idvar | varchar | AESEQ |  |
| idvarval | int | 1 |  |
| reltype | empty |  |  |
| relid | varchar | 01-718-1371-E08 |  |

### Table: sc.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | SC |  |
| usubjid | varchar |  |  |
| scseq | real | 1 |  |
| sctestcd | varchar | EDULEVEL |  |
| sctest | varchar | Level of Education Attained |  |
| sccat | varchar | EDUCATION |  |
| scorres | int | 12 |  |
| scorresu | varchar | YEARS |  |
| scstresc | int | 12 |  |
| scstresn | int | 12 |  |
| scstresu | varchar | YEARS |  |
| scdtc | date | 2012-12-13 |  |
| scdy | int | -4 |  |

### Table: se.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | SE |  |
| usubjid | varchar |  |  |
| seseq | real | 1 |  |
| etcd | varchar | SCRN |  |
| element | varchar | Screen |  |
| seupdes | varchar |  |  |
| epoch | varchar | TREATMENT |  |
| sestdtc | date | 2013-02-18 |  |
| seendtc | date | 2013-06-03 |  |
| sestdy | int | 1 |  |
| seendy | int | 1 |  |

### Table: suppae.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| rdomain | varchar | AE |  |
| usubjid | varchar |  |  |
| idvar | varchar | AESEQ |  |
| idvarval | int | 2 |  |
| qnam | varchar | AETRTEM |  |
| qlabel | varchar | TREATMENT EMERGENT FLAG |  |
| qval | varchar | Y |  |
| qorig | varchar | DERIVED |  |
| qeval | varchar | CLINICAL STUDY SPONSOR |  |

### Table: suppdm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| rdomain | varchar | DM |  |
| usubjid | varchar | 01-713-1179 |  |
| idvar | empty |  |  |
| idvarval | empty |  |  |
| qnam | varchar | SAFETY |  |
| qlabel | varchar | Intent to Treat Population Flag |  |
| qval | varchar | Y |  |
| qorig | varchar | DERIVED |  |
| qeval | varchar | CLINICAL STUDY SPONSOR |  |

### Table: suppds.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| rdomain | varchar |  |  |
| usubjid | varchar |  |  |
| idvar | varchar |  |  |
| idvarval | int |  |  |
| qnam | varchar |  |  |
| qlabel | varchar |  |  |
| qval | int |  |  |
| qorig | varchar |  |  |
| qeval | empty |  |  |

### Table: supplbch.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| rdomain | varchar | LB |  |
| usubjid | varchar | 01-704-1218 |  |
| idvar | varchar | LBSEQ |  |
| idvarval | int | 45 |  |
| qnam | varchar | LBTMSHI |  |
| qlabel | varchar | LAB RESULT/UPPER LIMIT OF NORMAL |  |
| qval | varchar | 0.9 |  |
| qorig | varchar | DERIVED |  |
| qeval | varchar | CLINICAL STUDY SPONSOR |  |

### Table: supplbhe.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| rdomain | varchar | LB |  |
| usubjid | varchar | 01-703-1100 |  |
| idvar | varchar | LBSEQ |  |
| idvarval | int | 23 |  |
| qnam | varchar | LBTMSHI |  |
| qlabel | varchar | LAB RESULT/UPPER LIMIT OF NORMAL |  |
| qval | varchar | 0.9 |  |
| qorig | varchar | DERIVED |  |
| qeval | varchar | CLINICAL STUDY SPONSOR |  |

### Table: supplbur.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| rdomain | varchar | LB |  |
| usubjid | varchar |  |  |
| idvar | varchar | LBSEQ |  |
| idvarval | int | 33 |  |
| qnam | varchar | LBTMSHI |  |
| qlabel | varchar | LAB RESULT/UPPER LIMIT OF NORMAL |  |
| qval | varchar | 1.0 |  |
| qorig | varchar | DERIVED |  |
| qeval | varchar | CLINICAL STUDY SPONSOR |  |

### Table: sv.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | SV |  |
| usubjid | varchar |  |  |
| visitnum | real | 1 |  |
| visit | varchar | SCREENING 1 |  |
| visitdy | real | -7 |  |
| epoch | varchar | TREATMENT |  |
| svstdtc | varchar |        -03 |  |
| svendtc | date | 2013-06-03 |  |
| svstdy | int | 1 |  |
| svendy | int | 1 |  |
| svupdes | varchar |  |  |

### Table: ta.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | TA |  |
| armcd | varchar | Xan_Hi |  |
| arm | varchar | Xanomeline High Dose |  |
| taetord | int |  |  |
| etcd | varchar |  |  |
| element | varchar |  |  |
| tabranch | varchar |  |  |
| tatrans | empty |  |  |
| epoch | varchar | TREATMENT |  |

### Table: te.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | TE |  |
| etcd | varchar |  |  |
| element | varchar |  |  |
| testrl | varchar |  |  |
| teenrl | varchar |  |  |
| tedur | varchar |  |  |

### Table: ti.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | TI |  |
| ietestcd | varchar |  |  |
| ietest | varchar |  |  |
| iecat | varchar | EXCLUSION |  |

### Table: ts.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | TS |  |
| tsseq | int | 1 |  |
| tsparmcd | varchar |  |  |
| tsparm | varchar |  |  |
| tsval | varchar |  |  |
| tsvalnf | varchar |  |  |
| tsvalcd | varchar |  |  |
| tsvcdref | varchar |  |  |
| tsvcdver | varchar |  |  |

### Table: tv.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | TV |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| armcd | empty |  |  |
| tvstrl | varchar |  |  |
| tvenrl | varchar |  |  |

### Table: vs.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar | CDISCPILOT01 |  |
| domain | varchar | VS |  |
| usubjid | varchar | 01-713-1179 |  |
| vsseq | real | 10 |  |
| vstestcd | varchar | SYSBP |  |
| vstest | varchar | Systolic Blood Pressure |  |
| vspos | varchar | STANDING |  |
| vsorres | real | 80 |  |
| vsorresu | varchar | mmHg |  |
| vsstresc | real | 80 |  |
| vsstresn | real | 80 |  |
| vsstresu | varchar | mmHg |  |
| vsstat | varchar |  |  |
| vsloc | varchar |  |  |
| vsblfl | varchar |  |  |
| visitnum | real | 1 |  |
| visit | varchar | SCREENING 1 |  |
| visitdy | int | -7 |  |
| epoch | varchar | TREATMENT |  |
| vsdtc | date | 2013-02-18 |  |
| vsdy | int | 1 |  |
| vstpt | varchar | AFTER LYING DOWN FOR 5 MINUTES |  |
| vstptnum | int | 815 |  |
| vseltm | varchar | PT5M |  |
| vstptref | varchar | PATIENT STANDING |  |

