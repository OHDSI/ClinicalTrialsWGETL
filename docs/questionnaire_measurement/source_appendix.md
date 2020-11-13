# Appendix: source tables

### Table: ae.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| aeseq | real |  |  |
| aespid | varchar |  |  |
| aeterm | varchar |  |  |
| aellt | varchar |  |  |
| aelltcd | int |  |  |
| aedecod | varchar |  |  |
| aeptcd | int |  |  |
| aehlt | varchar |  |  |
| aehltcd | int |  |  |
| aehlgt | varchar |  |  |
| aehlgtcd | int |  |  |
| aebodsys | varchar |  |  |
| aebdsycd | int |  |  |
| aesoc | varchar |  |  |
| aesoccd | int |  |  |
| aesev | varchar |  |  |
| aeser | varchar |  |  |
| aeacn | empty |  |  |
| aerel | varchar |  |  |
| aeout | varchar |  |  |
| aescan | varchar |  |  |
| aescong | varchar |  |  |
| aesdisab | varchar |  |  |
| aesdth | varchar |  |  |
| aeshosp | varchar |  |  |
| aeslife | varchar |  |  |
| aesod | varchar |  |  |
| epoch | varchar |  |  |
| aedtc | date |  |  |
| aestdtc | varchar |  |  |
| aeendtc | date |  |  |
| aedy | int |  |  |
| aestdy | int |  |  |
| aeendy | int |  |  |

### Table: cm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| cmseq | real |  |  |
| cmspid | int |  |  |
| cmtrt | varchar |  |  |
| cmdecod | varchar |  |  |
| cmindc | varchar |  |  |
| cmclas | varchar |  |  |
| cmdose | real |  |  |
| cmdosu | varchar |  |  |
| cmdosfrq | varchar |  |  |
| cmroute | varchar |  |  |
| visitnum | int |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| cmdtc | date |  |  |
| cmstdtc | varchar |  |  |
| cmendtc | varchar |  |  |
| cmdy | int |  |  |
| cmstdy | int |  |  |
| cmendy | int |  |  |

### Table: dm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  |  |
| subjid | int |  |  |
| rfstdtc | date |  |  |
| rfendtc | date |  |  |
| rfxstdtc | date |  |  |
| rfxendtc | date |  |  |
| rficdtc | empty |  |  |
| rfpendtc | varchar |  |  |
| dthdtc | date |  |  |
| dthfl | varchar |  |  |
| siteid | int |  |  |
| age | int |  |  |
| ageu | varchar |  |  |
| sex | varchar |  | Something about this |
| race | varchar |  |  |
| ethnic | varchar |  |  |
| armcd | varchar |  |  |
| arm | varchar |  |  |
| actarmcd | varchar |  |  |
| actarm | varchar |  |  |
| country | varchar |  |  |
| dmdtc | date |  |  |
| dmdy | int |  |  |

### Table: ds.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| dsseq | real |  |  |
| dsspid | int |  |  |
| dsterm | varchar |  |  |
| dsdecod | varchar |  |  |
| dscat | varchar |  |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| epoch | varchar |  |  |
| dsdtc | varchar |  |  |
| dsstdtc | date |  |  |
| dsdy | int |  |  |
| dsstdy | int |  |  |

### Table: ex.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| exseq | real |  |  |
| extrt | varchar |  |  |
| exdose | real |  |  |
| exdosu | varchar |  |  |
| exdosfrm | varchar |  |  |
| exdosfrq | varchar |  |  |
| exroute | varchar |  |  |
| visitnum | int |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| exstdtc | date |  |  |
| exendtc | date |  |  |
| exstdy | int |  |  |
| exendy | int |  |  |

### Table: lbch.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| lbseq | int |  |  |
| lbtestcd | varchar |  |  |
| lbtest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| lbcat | varchar |  |  |
| lborres | varchar |  |  |
| lborresu | varchar |  |  |
| lbornrlo | real |  |  |
| lbornrhi | real |  |  |
| lbstresc | varchar |  |  |
| lbstresn | real |  |  |
| lbstresu | varchar |  |  |
| lbstnrlo | real |  |  |
| lbstnrhi | real |  |  |
| lbnrind | varchar |  |  |
| lbblfl | varchar |  |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| lbdtc | varchar |  |  |
| lbdy | int |  |  |

### Table: lbhe.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| lbseq | int |  |  |
| lbtestcd | varchar |  |  |
| lbtest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| lbcat | varchar |  |  |
| lborres | real |  |  |
| lborresu | varchar |  |  |
| lbornrlo | real |  |  |
| lbornrhi | real |  |  |
| lbstresc | real |  |  |
| lbstresn | real |  |  |
| lbstresu | varchar |  |  |
| lbstnrlo | real |  |  |
| lbstnrhi | real |  |  |
| lbnrind | varchar |  |  |
| lbblfl | varchar |  |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| lbdtc | varchar |  |  |
| lbdy | int |  |  |

### Table: lbur.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| lbseq | real |  |  |
| lbtestcd | varchar |  |  |
| lbtest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| lbcat | varchar |  |  |
| lborres | varchar |  |  |
| lborresu | varchar |  |  |
| lbornrlo | real |  |  |
| lbornrhi | real |  |  |
| lbstresc | varchar |  |  |
| lbstresn | real |  |  |
| lbstresu | varchar |  |  |
| lbstnrlo | real |  |  |
| lbstnrhi | real |  |  |
| lbnrind | varchar |  |  |
| lbblfl | varchar |  |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| lbdtc | varchar |  |  |
| lbdy | int |  |  |

### Table: mh.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| mhseq | real |  |  |
| mhspid | varchar |  |  |
| mhterm | varchar |  |  |
| mhllt | varchar |  |  |
| mhdecod | varchar |  |  |
| mhhlt | varchar |  |  |
| mhhlgt | varchar |  |  |
| mhcat | varchar |  |  |
| mhbodsys | varchar |  |  |
| mhsev | varchar |  |  |
| visitnum | int |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| mhdtc | date |  |  |
| mhstdtc | varchar |  |  |
| mhdy | int |  |  |

### Table: qsco.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  |  |
| qsseq | int |  |  |
| qstestcd | varchar |  |  |
| qstest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| qscat | varchar |  |  |
| qsscat | empty |  |  |
| qsorres | real |  |  |
| qsorresu | varchar |  | There's no direct UCUM mapping (e.g., UCUM ID=8555 has Code=s with Name=second) and SDTM qsorresu has "sec".  |
| qsstresc | real |  |  |
| qsstresn | real |  |  |
| qsstresu | varchar |  |  |
| qsstat | varchar |  |  |
| qsreasnd | varchar |  |  |
| qsblfl | varchar |  |  |
| qsdrvfl | varchar |  |  |
| visitnum | int |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| qsdtc | date |  |  |
| qsdy | int |  |  |

### Table: qsda.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| qsseq | int |  |  |
| qstestcd | varchar |  |  |
| qstest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| qscat | varchar |  |  |
| qsscat | varchar |  |  |
| qsorres | varchar |  |  |
| qsorresu | empty |  |  |
| qsstresc | int |  |  |
| qsstresn | int |  |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | varchar |  |  |
| qsdrvfl | empty |  |  |
| visitnum | int |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| qsdtc | date |  |  |
| qsdy | int |  |  |

### Table: qsgi.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| qsseq | int |  |  |
| qstestcd | varchar |  |  |
| qstest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| qscat | varchar |  |  |
| qsscat | empty |  |  |
| qsorres | varchar |  |  |
| qsorresu | empty |  |  |
| qsstresc | int |  |  |
| qsstresn | int |  |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | empty |  |  |
| qsdrvfl | empty |  |  |
| visitnum | int |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| qsdtc | date |  |  |
| qsdy | int |  |  |

### Table: qshi.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| qsseq | real |  |  |
| qstestcd | varchar |  |  |
| qstest | varchar |  |  |
| qscat | varchar |  |  |
| qsscat | empty |  |  |
| qsorres | varchar |  |  |
| qsorresu | empty |  |  |
| qsstresc | int |  |  |
| qsstresn | int |  |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | empty |  |  |
| qsdrvfl | empty |  |  |
| visitnum | int |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| qsdtc | date |  |  |
| qsdy | int |  |  |

### Table: qsmm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| qsseq | int |  |  |
| qstestcd | varchar |  |  |
| qstest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| qscat | varchar |  |  |
| qsscat | varchar |  |  |
| qsorres | int |  |  |
| qsorresu | empty |  |  |
| qsstresc | int |  |  |
| qsstresn | int |  |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | empty |  |  |
| qsdrvfl | empty |  |  |
| visitnum | int |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| qsdtc | date |  |  |
| qsdy | int |  |  |

### Table: qsni.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| qsseq | int |  |  |
| qstestcd | varchar |  |  |
| qstest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| qscat | varchar |  |  |
| qsscat | varchar |  |  |
| qsorres | varchar |  |  |
| qsorresu | empty |  |  |
| qsstresc | int |  |  |
| qsstresn | real |  |  |
| qsstresu | empty |  |  |
| qsstat | empty |  |  |
| qsreasnd | empty |  |  |
| qsblfl | varchar |  |  |
| qsdrvfl | varchar |  |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| qsdtc | date |  |  |
| qsdy | int |  |  |

### Table: relrec.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| rdomain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| idvar | varchar |  |  |
| idvarval | int |  |  |
| reltype | empty |  |  |
| relid | varchar |  |  |

### Table: sc.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| scseq | real |  |  |
| sctestcd | varchar |  |  |
| sctest | varchar |  |  |
| sccat | varchar |  |  |
| scorres | int |  |  |
| scorresu | varchar |  |  |
| scstresc | int |  |  |
| scstresn | int |  |  |
| scstresu | varchar |  |  |
| scdtc | date |  |  |
| scdy | int |  |  |

### Table: se.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| seseq | real |  |  |
| etcd | varchar |  |  |
| element | varchar |  |  |
| seupdes | varchar |  |  |
| epoch | varchar |  |  |
| sestdtc | date |  |  |
| seendtc | date |  |  |
| sestdy | int |  |  |
| seendy | int |  |  |

### Table: suppae.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| rdomain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| idvar | varchar |  |  |
| idvarval | int |  |  |
| qnam | varchar |  |  |
| qlabel | varchar |  |  |
| qval | varchar |  |  |
| qorig | varchar |  |  |
| qeval | varchar |  |  |

### Table: suppdm.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| rdomain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| idvar | empty |  |  |
| idvarval | empty |  |  |
| qnam | varchar |  |  |
| qlabel | varchar |  |  |
| qval | varchar |  |  |
| qorig | varchar |  |  |
| qeval | varchar |  |  |

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
| studyid | varchar |  |  |
| rdomain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| idvar | varchar |  |  |
| idvarval | int |  |  |
| qnam | varchar |  |  |
| qlabel | varchar |  |  |
| qval | varchar |  |  |
| qorig | varchar |  |  |
| qeval | varchar |  |  |

### Table: supplbhe.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| rdomain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| idvar | varchar |  |  |
| idvarval | int |  |  |
| qnam | varchar |  |  |
| qlabel | varchar |  |  |
| qval | varchar |  |  |
| qorig | varchar |  |  |
| qeval | varchar |  |  |

### Table: supplbur.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| rdomain | varchar |  |  |
| usubjid | varchar |  |  |
| idvar | varchar |  |  |
| idvarval | int |  |  |
| qnam | varchar |  |  |
| qlabel | varchar |  |  |
| qval | varchar |  |  |
| qorig | varchar |  |  |
| qeval | varchar |  |  |

### Table: sv.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| visitdy | real |  |  |
| epoch | varchar |  |  |
| svstdtc | varchar |  |  |
| svendtc | date |  |  |
| svstdy | int |  |  |
| svendy | int |  |  |
| svupdes | varchar |  |  |

### Table: ta.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| armcd | varchar |  |  |
| arm | varchar |  |  |
| taetord | int |  |  |
| etcd | varchar |  |  |
| element | varchar |  |  |
| tabranch | varchar |  |  |
| tatrans | empty |  |  |
| epoch | varchar |  |  |

### Table: te.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| etcd | varchar |  |  |
| element | varchar |  |  |
| testrl | varchar |  |  |
| teenrl | varchar |  |  |
| tedur | varchar |  |  |

### Table: ti.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| ietestcd | varchar |  |  |
| ietest | varchar |  |  |
| iecat | varchar |  |  |

### Table: ts.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| tsseq | int |  |  |
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
| studyid | varchar |  |  |
| domain | varchar |  |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| armcd | empty |  |  |
| tvstrl | varchar |  |  |
| tvenrl | varchar |  |  |

### Table: vs.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| studyid | varchar |  |  |
| domain | varchar |  |  |
| usubjid | varchar |  | USUBJID is VARCHAR not INTEGER. |
| vsseq | real |  |  |
| vstestcd | varchar |  |  |
| vstest | varchar |  | Need to confirm where the laboratory test name should be mapped to in CDM. |
| vspos | varchar |  |  |
| vsorres | real |  |  |
| vsorresu | varchar |  |  |
| vsstresc | real |  |  |
| vsstresn | real |  |  |
| vsstresu | varchar |  |  |
| vsstat | varchar |  |  |
| vsloc | varchar |  |  |
| vsblfl | varchar |  |  |
| visitnum | real |  |  |
| visit | varchar |  |  |
| visitdy | int |  |  |
| epoch | varchar |  |  |
| vsdtc | date |  |  |
| vsdy | int |  |  |
| vstpt | varchar |  |  |
| vstptnum | int |  |  |
| vseltm | varchar |  |  |
| vstptref | varchar |  |  |

