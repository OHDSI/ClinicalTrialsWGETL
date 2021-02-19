# Custom Vocabularies

Since the source data mainly rely on terms stored as a free text instead of encoded medical terminology, a substantial amount of custom mapping has been needed.

## CDISC terminology from EVS, NCT metathesaurus
A useful link for mapping abbreviations from the CDISC vocabulary to CDISC codes: https://evs.nci.nih.gov/ftp1/CDISC/SDTM/SDTM Terminology.html#CL.C99079.EPOCH
The flat file might be easier to search. Use "|ALB|",  http://evs.nci.nih.gov/ftp1/NCI_Thesaurus/Thesaurus_20.12d.FLAT.zip
From there, the CDISC code can be mapped to a UMLS CUI and on to a SNOMED term here: https://ncimeta.nci.nih.gov/ncimbrowser/

For example, the first maps ALB to C64431. The second maps that to CUI C0201838, where SNOMED 26758005 can be found under the synonyms tab.
