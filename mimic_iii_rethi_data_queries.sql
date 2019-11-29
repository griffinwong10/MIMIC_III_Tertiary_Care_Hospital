-- INFO 210: Database Management Systems Final Project Summer 2019
-- Drexel University College of Computing and Informatics
 
--Johnson, A. E., Pollard, T. J., Shen, L., Lehman, L. H., Feng, M., Ghassemi, M., . . . Mark, R. G.
-- (2016, May 24). MIMIC-III, a freely accessible critical care database. Retrieved July 1,
-- 2019, from https://www.nature.com/articles/sdata201635/


-- Data Queries by Ryan Rethi

--The goal is to pull patients who have a scheduled appointment and list them by date of appointment.

SELECT PATIENT.PATIENT_ID, APPOINTMENT.PATIENT_ID, APPOINTMENT.APMT_DATE 
FROM PATIENT, APPOINTMENT 
WHERE APPOINTMENT.PATIENT_ID = PATIENT.PATIENT_ID 
GROUP BY APMT_DATE;

--The goal is to get a count for the number of patients each care provider is currently treating.

SELECT CARE_PROVIDER.CARE_PROVIDER_ID, CARE_PROVIDER.TITLE, CARE_PROVIDER.FIRST_NAME, CARE_PROVIDER.LAST_NAME, COUNT(PATIENT_ID) 
FROM TREATMENT, CARE_PROVIDER 
WHERE TREATMENT.CARE_PROVIDER_ID = CARE_PROVIDER.CARE_PROVIDOR_ID 
GROUP BY LAST_NAME;

--The goal is to show the number of patients each care provider is seeing that is in the critical care unit.

SELECT CARE_PROVIDER.CARE_PROVIDER_ID, COUNT(CCU_ID) 
FROM CRITICAL_CARE_UNIT, CARE_PROVIDER 
WHERE CRITICAL_CARE_UNIT.CARE_PROVIDER_ID = CARE_PROVIDER.CARE_PROVIDER_ID 
GROUP BY CARE_PROVIDER_ID;


