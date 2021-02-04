## Table name: care_site

The CARE_SITE table contains a list of uniquely identified institutional (physical or organizational) units where healthcare delivery is practiced (offices, wards, hospitals, clinics, etc.).

###  Mapping from src.DM

A single record is created for every distinct value of src.DM.SITEID.

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| care_site_id |  |  | Auto-increment |
| care_site_name | NULL |  |  |
| place_of_service_concept_id | NULL |  |  |
| location_id | NULL |  |  |
| care_site_source_value | src.DM.SITEID |  |  |
| place_of_service_source_value | NULL |  |  |
