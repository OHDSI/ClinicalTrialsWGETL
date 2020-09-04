# Appendix: source tables

### Table: supplbur.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| rdomain | VARCHAR | LB |  |
| usubjid | VARCHAR |  |  |
| idvar | VARCHAR | LBSEQ |  |
| idvarval | INT | 33 |  |
| qnam | VARCHAR | LBTMSHI |  |
| qlabel | VARCHAR | LAB RESULT/UPPER LIMIT OF NORMAL |  |
| qval | VARCHAR | 1.0 |  |
| qorig | VARCHAR | DERIVED |  |
| qeval | VARCHAR | CLINICAL STUDY SPONSOR |  |

### Table: ae.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | AE |  |
| usubjid | VARCHAR |  |  |
| aeseq | REAL | 2 |  |
| aespid | VARCHAR | E05 |  |
| aeterm | VARCHAR | APPLICATION SITE PRURITUS |  |
| aellt | VARCHAR | APPLICATION SITE ITCHING |  |
| aelltcd | INT | 0 |  |
| aedecod | VARCHAR | APPLICATION SITE PRURITUS |  |
| aeptcd | INT | 0 |  |
| aehlt | VARCHAR | HLT_0317 |  |
| aehltcd | INT | 0 |  |
| aehlgt | VARCHAR | HLGT_0338 |  |
| aehlgtcd | INT | 0 |  |
| aebodsys | VARCHAR | GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS |  |
| aebdsycd | INT | 0 |  |
| aesoc | VARCHAR | GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS |  |
| aesoccd | INT | 0 |  |
| aesev | VARCHAR | MILD |  |
| aeser | VARCHAR | N |  |
| aeacn | EMPTY |  |  |
| aerel | VARCHAR | POSSIBLE |  |
| aeout | VARCHAR | RECOVERED/RESOLVED |  |
| aescan | VARCHAR | N |  |
| aescong | VARCHAR | N |  |
| aesdisab | VARCHAR | N |  |
| aesdth | VARCHAR | N |  |
| aeshosp | VARCHAR | N |  |
| aeslife | VARCHAR | N |  |
| aesod | VARCHAR | N |  |
| epoch | VARCHAR | TREATMENT |  |
| aedtc | DATE | 2013-06-03 |  |
| aestdtc | VARCHAR | 2013-02-04 |  |
| aeendtc | DATE |  |  |
| aedy | INT | 15 |  |
| aestdy | INT | 50 |  |
| aeendy | INT | 0 |  |

### Table: suppae.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| rdomain | VARCHAR | AE |  |
| usubjid | VARCHAR |  |  |
| idvar | VARCHAR | AESEQ |  |
| idvarval | INT | 2 |  |
| qnam | VARCHAR | AETRTEM |  |
| qlabel | VARCHAR | TREATMENT EMERGENT FLAG |  |
| qval | VARCHAR | Y |  |
| qorig | VARCHAR | DERIVED |  |
| qeval | VARCHAR | CLINICAL STUDY SPONSOR |  |

### Table: ds.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | DS |  |
| usubjid | VARCHAR |  |  |
| dsseq | REAL | 1 |  |
| dsspid | INT |  |  |
| dsterm | VARCHAR | FINAL LAB VISIT |  |
| dsdecod | VARCHAR | FINAL LAB VISIT |  |
| dscat | VARCHAR | DISPOSITION EVENT |  |
| visitnum | REAL | 13 |  |
| visit | VARCHAR | WEEK 26 |  |
| epoch | VARCHAR | FOLLOW-UP |  |
| dsdtc | VARCHAR | 2013-06-03 |  |
| dsstdtc | DATE | 2013-06-03 |  |
| dsdy | INT | 183 |  |
| dsstdy | INT | 183 |  |

### Table: lbch.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | LB |  |
| usubjid | VARCHAR | 01-704-1218 |  |
| lbseq | INT | 8 |  |
| lbtestcd | VARCHAR | URATE |  |
| lbtest | VARCHAR | Urate |  |
| lbcat | VARCHAR | CHEMISTRY |  |
| lborres | VARCHAR | 4.0 |  |
| lborresu | VARCHAR | mg/dL |  |
| lbornrlo | REAL | 6 |  |
| lbornrhi | REAL | 7.5 |  |
| lbstresc | VARCHAR | 6.84 |  |
| lbstresn | REAL | 6.84 |  |
| lbstresu | VARCHAR | mmol/L |  |
| lbstnrlo | REAL | 35 |  |
| lbstnrhi | REAL | 446 |  |
| lbnrind | VARCHAR | NORMAL |  |
| lbblfl | VARCHAR |  |  |
| visitnum | REAL | 1 |  |
| visit | VARCHAR | SCREENING 1 |  |
| visitdy | INT | -7 |  |
| epoch | VARCHAR | TREATMENT |  |
| lbdtc | VARCHAR | 2013-02-11T12:40 |  |
| lbdy | INT | 15 |  |

### Table: qsmm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | QS |  |
| usubjid | VARCHAR | 01-718-1427 |  |
| qsseq | INT | 2006 |  |
| qstestcd | VARCHAR | MMITM06 |  |
| qstest | VARCHAR | NAME A PENCIL, AND WATCH (2 POINTS) |  |
| qscat | VARCHAR | MMSE |  |
| qsscat | VARCHAR | ORIENTATION |  |
| qsorres | INT | 3 |  |
| qsorresu | EMPTY |  |  |
| qsstresc | INT | 3 |  |
| qsstresn | INT | 3 |  |
| qsstresu | EMPTY |  |  |
| qsstat | EMPTY |  |  |
| qsreasnd | EMPTY |  |  |
| qsblfl | EMPTY |  |  |
| qsdrvfl | EMPTY |  |  |
| visitnum | INT | 1 |  |
| visit | VARCHAR | SCREENING 1 |  |
| visitdy | INT | -7 |  |
| epoch | VARCHAR | TREATMENT |  |
| qsdtc | DATE | 2012-12-13 |  |
| qsdy | INT | -8 |  |

### Table: qsgi.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | QS |  |
| usubjid | VARCHAR | 01-718-1427 |  |
| qsseq | INT | 6001 |  |
| qstestcd | VARCHAR | CIBIC |  |
| qstest | VARCHAR | EXTENT OF CHANGE, IF ANY, SINCE BASELINE |  |
| qscat | VARCHAR | ADCS-CGIC |  |
| qsscat | EMPTY |  |  |
| qsorres | VARCHAR | NO CHANGE |  |
| qsorresu | EMPTY |  |  |
| qsstresc | INT | 4 |  |
| qsstresn | INT | 4 |  |
| qsstresu | EMPTY |  |  |
| qsstat | EMPTY |  |  |
| qsreasnd | EMPTY |  |  |
| qsblfl | EMPTY |  |  |
| qsdrvfl | EMPTY |  |  |
| visitnum | INT | 8 |  |
| visit | VARCHAR | WEEK 8 |  |
| visitdy | INT | 168 |  |
| epoch | VARCHAR | TREATMENT |  |
| qsdtc | DATE | 2013-06-03 |  |
| qsdy | INT | 169 |  |

### Table: suppds.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR |  |  |
| rdomain | VARCHAR |  |  |
| usubjid | VARCHAR |  |  |
| idvar | VARCHAR |  |  |
| idvarval | INT |  |  |
| qnam | VARCHAR |  |  |
| qlabel | VARCHAR |  |  |
| qval | INT |  |  |
| qorig | VARCHAR |  |  |
| qeval | EMPTY |  |  |

### Table: sv.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | SV |  |
| usubjid | VARCHAR |  |  |
| visitnum | REAL | 1 |  |
| visit | VARCHAR | SCREENING 1 |  |
| visitdy | REAL | -7 |  |
| epoch | VARCHAR | TREATMENT |  |
| svstdtc | VARCHAR |        -03 |  |
| svendtc | DATE | 2013-06-03 |  |
| svstdy | INT | 1 |  |
| svendy | INT | 1 |  |
| svupdes | VARCHAR |  |  |

### Table: ts.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | TS |  |
| tsseq | INT | 1 |  |
| tsparmcd | VARCHAR |  |  |
| tsparm | VARCHAR |  |  |
| tsval | VARCHAR |  |  |
| tsvalnf | VARCHAR |  |  |
| tsvalcd | VARCHAR |  |  |
| tsvcdref | VARCHAR |  |  |
| tsvcdver | VARCHAR |  |  |

### Table: qsco.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | QS |  |
| usubjid | VARCHAR | 01-718-1427 |  |
| qsseq | INT | 5001 |  |
| qstestcd | VARCHAR | ACTOT |  |
| qstest | VARCHAR | ADAS-COG(11) Subscore |  |
| qscat | VARCHAR | ADAS-COG |  |
| qsscat | EMPTY |  |  |
| qsorres | REAL | 0 |  |
| qsorresu | VARCHAR |  |  |
| qsstresc | REAL | 0 |  |
| qsstresn | REAL | 0 |  |
| qsstresu | VARCHAR |  |  |
| qsstat | VARCHAR |  |  |
| qsreasnd | VARCHAR |  |  |
| qsblfl | VARCHAR |  |  |
| qsdrvfl | VARCHAR |  |  |
| visitnum | INT | 3 |  |
| visit | VARCHAR | BASELINE |  |
| visitdy | INT | 1 |  |
| epoch | VARCHAR | TREATMENT |  |
| qsdtc | DATE | 2013-06-03 |  |
| qsdy | INT | 1 |  |

### Table: se.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | SE |  |
| usubjid | VARCHAR |  |  |
| seseq | REAL | 1 |  |
| etcd | VARCHAR | SCRN |  |
| element | VARCHAR | Screen |  |
| seupdes | VARCHAR |  |  |
| epoch | VARCHAR | TREATMENT |  |
| sestdtc | DATE | 2013-02-18 |  |
| seendtc | DATE | 2013-06-03 |  |
| sestdy | INT | 1 |  |
| seendy | INT | 1 |  |

### Table: supplbch.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| rdomain | VARCHAR | LB |  |
| usubjid | VARCHAR | 01-704-1218 |  |
| idvar | VARCHAR | LBSEQ |  |
| idvarval | INT | 45 |  |
| qnam | VARCHAR | LBTMSHI |  |
| qlabel | VARCHAR | LAB RESULT/UPPER LIMIT OF NORMAL |  |
| qval | VARCHAR | 0.9 |  |
| qorig | VARCHAR | DERIVED |  |
| qeval | VARCHAR | CLINICAL STUDY SPONSOR |  |

### Table: cm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | CM |  |
| usubjid | VARCHAR | 01-716-1157 |  |
| cmseq | REAL | 1 |  |
| cmspid | INT | 1 |  |
| cmtrt | VARCHAR | MULTIVITAMIN |  |
| cmdecod | VARCHAR | UNCODED |  |
| cmindc | VARCHAR |  |  |
| cmclas | VARCHAR | UNCODED |  |
| cmdose | REAL | 1 |  |
| cmdosu | VARCHAR | mg |  |
| cmdosfrq | VARCHAR | QD |  |
| cmroute | VARCHAR | ORAL |  |
| visitnum | INT | 4 |  |
| visit | VARCHAR | WEEK 2 |  |
| visitdy | INT | 14 |  |
| epoch | VARCHAR | TREATMENT |  |
| cmdtc | DATE | 2013-06-03 |  |
| cmstdtc | VARCHAR | 2010 |  |
| cmendtc | VARCHAR |  |  |
| cmdy | INT | 1 |  |
| cmstdy | INT | 0 |  |
| cmendy | INT | 0 |  |

### Table: dm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | DM |  |
| usubjid | VARCHAR |  |  |
| dmdtc | DATE | 2012-12-13 |  |
| arm | VARCHAR | Xanomeline High Dose |  |
| actarm | VARCHAR | Xanomeline High Dose |  |
| subjid | INT |  |  |
| rfstdtc | DATE |  |  |
| rfendtc | DATE |  |  |
| rfxstdtc | DATE |  |  |
| rfxendtc | DATE |  |  |
| rficdtc | EMPTY |  |  |
| rfpendtc | VARCHAR | 2013-06-03 |  |
| dthdtc | DATE |  |  |
| dthfl | VARCHAR |  |  |
| siteid | INT | 718 |  |
| age | INT | 74 |  |
| ageu | VARCHAR | YEARS |  |
| sex | VARCHAR | F |  |
| race | VARCHAR | WHITE |  |
| ethnic | VARCHAR | NOT HISPANIC OR LATINO |  |
| armcd | VARCHAR | Xan_Hi |  |
| actarmcd | VARCHAR | Xan_Hi |  |
| country | VARCHAR | USA |  |
| dmdy | INT | -4 |  |

### Table: lbur.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | LB |  |
| usubjid | VARCHAR |  |  |
| lbseq | REAL | 33 |  |
| lbtestcd | VARCHAR | KETONES |  |
| lbtest | VARCHAR | Urobilinogen |  |
| lbcat | VARCHAR | URINALYSIS |  |
| lborres | VARCHAR | 0 |  |
| lborresu | VARCHAR |  |  |
| lbornrlo | REAL |  |  |
| lbornrhi | REAL |  |  |
| lbstresc | VARCHAR | 0 |  |
| lbstresn | REAL | 0 |  |
| lbstresu | VARCHAR |  |  |
| lbstnrlo | REAL | 0 |  |
| lbstnrhi | REAL | 0 |  |
| lbnrind | VARCHAR | NORMAL |  |
| lbblfl | VARCHAR |  |  |
| visitnum | REAL | 1 |  |
| visit | VARCHAR | SCREENING 1 |  |
| visitdy | INT | -7 |  |
| epoch | VARCHAR | TREATMENT |  |
| lbdtc | VARCHAR | 2012-12-09T12:30 |  |
| lbdy | INT | 15 |  |

### Table: relrec.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| rdomain | VARCHAR | AE |  |
| usubjid | VARCHAR |  |  |
| idvar | VARCHAR | AESEQ |  |
| idvarval | INT | 1 |  |
| reltype | EMPTY |  |  |
| relid | VARCHAR | 01-718-1371-E08 |  |

### Table: qshi.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | QS |  |
| usubjid | VARCHAR |  |  |
| qsseq | REAL | 1011 |  |
| qstestcd | VARCHAR | MHITM01 |  |
| qstest | VARCHAR | DEPRESSION |  |
| qscat | VARCHAR | MHIS-NACC |  |
| qsscat | EMPTY |  |  |
| qsorres | VARCHAR | ABSENT |  |
| qsorresu | EMPTY |  |  |
| qsstresc | INT | 0 |  |
| qsstresn | INT | 0 |  |
| qsstresu | EMPTY |  |  |
| qsstat | EMPTY |  |  |
| qsreasnd | EMPTY |  |  |
| qsblfl | EMPTY |  |  |
| qsdrvfl | EMPTY |  |  |
| visitnum | INT | 1 |  |
| visit | VARCHAR | SCREENING 1 |  |
| visitdy | INT | -7 |  |
| epoch | VARCHAR | TREATMENT |  |
| qsdtc | DATE | 2012-12-13 |  |
| qsdy | INT | -8 |  |

### Table: sc.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | SC |  |
| usubjid | VARCHAR |  |  |
| scseq | REAL | 1 |  |
| sctestcd | VARCHAR | EDULEVEL |  |
| sctest | VARCHAR | Level of Education Attained |  |
| sccat | VARCHAR | EDUCATION |  |
| scorres | INT | 12 |  |
| scorresu | VARCHAR | YEARS |  |
| scstresc | INT | 12 |  |
| scstresn | INT | 12 |  |
| scstresu | VARCHAR | YEARS |  |
| scdtc | DATE | 2012-12-13 |  |
| scdy | INT | -4 |  |

### Table: suppdm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| rdomain | VARCHAR | DM |  |
| usubjid | VARCHAR | 01-713-1179 |  |
| idvar | EMPTY |  |  |
| idvarval | EMPTY |  |  |
| qnam | VARCHAR | SAFETY |  |
| qlabel | VARCHAR | Intent to Treat Population Flag |  |
| qval | VARCHAR | Y |  |
| qorig | VARCHAR | DERIVED |  |
| qeval | VARCHAR | CLINICAL STUDY SPONSOR |  |

### Table: vs.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | VS |  |
| usubjid | VARCHAR | 01-713-1179 |  |
| vsseq | REAL | 10 |  |
| vstestcd | VARCHAR | SYSBP |  |
| vstest | VARCHAR | Systolic Blood Pressure |  |
| vspos | VARCHAR | STANDING |  |
| vsorres | REAL | 80 |  |
| vsorresu | VARCHAR | mmHg |  |
| vsstresc | REAL | 80 |  |
| vsstresn | REAL | 80 |  |
| vsstresu | VARCHAR | mmHg |  |
| vsstat | VARCHAR |  |  |
| vsloc | VARCHAR |  |  |
| vsblfl | VARCHAR |  |  |
| visitnum | REAL | 1 |  |
| visit | VARCHAR | SCREENING 1 |  |
| visitdy | INT | -7 |  |
| epoch | VARCHAR | TREATMENT |  |
| vsdtc | DATE | 2013-02-18 |  |
| vsdy | INT | 1 |  |
| vstpt | VARCHAR | AFTER LYING DOWN FOR 5 MINUTES |  |
| vstptnum | INT | 815 |  |
| vseltm | VARCHAR | PT5M |  |
| vstptref | VARCHAR | PATIENT STANDING |  |

### Table: ti.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | TI |  |
| ietestcd | VARCHAR |  |  |
| ietest | VARCHAR |  |  |
| iecat | VARCHAR | EXCLUSION |  |

### Table: supplbhe.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| rdomain | VARCHAR | LB |  |
| usubjid | VARCHAR | 01-703-1100 |  |
| idvar | VARCHAR | LBSEQ |  |
| idvarval | INT | 23 |  |
| qnam | VARCHAR | LBTMSHI |  |
| qlabel | VARCHAR | LAB RESULT/UPPER LIMIT OF NORMAL |  |
| qval | VARCHAR | 0.9 |  |
| qorig | VARCHAR | DERIVED |  |
| qeval | VARCHAR | CLINICAL STUDY SPONSOR |  |

### Table: te.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | TE |  |
| etcd | VARCHAR |  |  |
| element | VARCHAR |  |  |
| testrl | VARCHAR |  |  |
| teenrl | VARCHAR |  |  |
| tedur | VARCHAR |  |  |

### Table: lbhe.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | LB |  |
| usubjid | VARCHAR | 01-716-1044 |  |
| lbseq | INT | 22 |  |
| lbtestcd | VARCHAR | WBC |  |
| lbtest | VARCHAR | Leukocytes |  |
| lbcat | VARCHAR | HEMATOLOGY |  |
| lborres | REAL | 32 |  |
| lborresu | VARCHAR | 10^9/L |  |
| lbornrlo | REAL | 0 |  |
| lbornrhi | REAL | 10.7 |  |
| lbstresc | REAL | 20.4798 |  |
| lbstresn | REAL | 20.4798 |  |
| lbstresu | VARCHAR | 10^9/L |  |
| lbstnrlo | REAL | 0 |  |
| lbstnrhi | REAL | 10.7 |  |
| lbnrind | VARCHAR | NORMAL |  |
| lbblfl | VARCHAR |  |  |
| visitnum | REAL | 1 |  |
| visit | VARCHAR | SCREENING 1 |  |
| visitdy | INT | -7 |  |
| epoch | VARCHAR | TREATMENT |  |
| lbdtc | VARCHAR | 2013-02-11T12:40 |  |
| lbdy | INT | 15 |  |

### Table: qsni.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | QS |  |
| usubjid | VARCHAR | 01-718-1355 |  |
| qsseq | INT | 3002 |  |
| qstestcd | VARCHAR | NPITM05S |  |
| qstest | VARCHAR | HALLUCINATIONS Score |  |
| qscat | VARCHAR | NPI |  |
| qsscat | VARCHAR | APPETITE/EATING CHANGE |  |
| qsorres | VARCHAR | 0 |  |
| qsorresu | EMPTY |  |  |
| qsstresc | INT | 0 |  |
| qsstresn | REAL | 0 |  |
| qsstresu | EMPTY |  |  |
| qsstat | EMPTY |  |  |
| qsreasnd | EMPTY |  |  |
| qsblfl | VARCHAR |  |  |
| qsdrvfl | VARCHAR |  |  |
| visitnum | REAL | 3 |  |
| visit | VARCHAR | BASELINE |  |
| visitdy | INT | 1 |  |
| epoch | VARCHAR | TREATMENT |  |
| qsdtc | DATE | 2013-09-05 |  |
| qsdy | INT | 1 |  |

### Table: ta.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | TA |  |
| armcd | VARCHAR | Xan_Hi |  |
| arm | VARCHAR | Xanomeline High Dose |  |
| taetord | INT |  |  |
| etcd | VARCHAR |  |  |
| element | VARCHAR |  |  |
| tabranch | VARCHAR |  |  |
| tatrans | EMPTY |  |  |
| epoch | VARCHAR | TREATMENT |  |

### Table: ex.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | EX |  |
| usubjid | VARCHAR |  |  |
| exseq | REAL | 1 |  |
| extrt | VARCHAR | XANOMELINE |  |
| exdose | REAL | 54 |  |
| exdosu | VARCHAR | mg |  |
| exdosfrm | VARCHAR | PATCH |  |
| exdosfrq | VARCHAR | QD |  |
| exroute | VARCHAR | TRANSDERMAL |  |
| visitnum | INT | 3 |  |
| visit | VARCHAR | BASELINE |  |
| visitdy | INT | 1 |  |
| epoch | VARCHAR | TREATMENT |  |
| exstdtc | DATE | 2013-01-01 |  |
| exendtc | DATE | 2013-02-11 |  |
| exstdy | INT | 1 |  |
| exendy | INT | 15 |  |

### Table: qsda.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | QS |  |
| usubjid | VARCHAR | 01-718-1250 |  |
| qsseq | INT | 4120 |  |
| qstestcd | VARCHAR | DAITM40 |  |
| qstest | VARCHAR | STAY SAFELY AT HOME BY HIMSELF/HERSELF |  |
| qscat | VARCHAR | DAD |  |
| qsscat | VARCHAR | HYGIENE |  |
| qsorres | VARCHAR | Y |  |
| qsorresu | EMPTY |  |  |
| qsstresc | INT | 1 |  |
| qsstresn | INT | 1 |  |
| qsstresu | EMPTY |  |  |
| qsstat | EMPTY |  |  |
| qsreasnd | EMPTY |  |  |
| qsblfl | VARCHAR |  |  |
| qsdrvfl | EMPTY |  |  |
| visitnum | INT | 3 |  |
| visit | VARCHAR | BASELINE |  |
| visitdy | INT | 1 |  |
| epoch | VARCHAR | TREATMENT |  |
| qsdtc | DATE | 2014-01-11 |  |
| qsdy | INT | 1 |  |

### Table: tv.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | TV |  |
| visitnum | REAL |  |  |
| visit | VARCHAR |  |  |
| visitdy | INT |  |  |
| armcd | EMPTY |  |  |
| tvstrl | VARCHAR |  |  |
| tvenrl | VARCHAR |  |  |

### Table: mh.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | VARCHAR | CDISCPILOT01 |  |
| domain | VARCHAR | MH |  |
| usubjid | VARCHAR |  |  |
| mhseq | REAL | 1 |  |
| mhspid | VARCHAR |  |  |
| mhterm | VARCHAR | ALZHEIMER'S DISEASE |  |
| mhllt | VARCHAR |  |  |
| mhdecod | VARCHAR |  |  |
| mhhlt | VARCHAR |  |  |
| mhhlgt | VARCHAR |  |  |
| mhcat | VARCHAR | SIGNIFICANT PRE-EXISTING CONDITION |  |
| mhbodsys | VARCHAR | SURGICAL AND MEDICAL PROCEDURES |  |
| mhsev | VARCHAR |  |  |
| visitnum | INT | 1 |  |
| visit | VARCHAR | SCREENING 1 |  |
| visitdy | INT | -7 |  |
| mhdtc | DATE | 2012-12-13 |  |
| mhstdtc | VARCHAR |  |  |
| mhdy | INT | -8 |  |

