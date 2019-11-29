-- INFO 210: Database Management Systems Final Project Summer 2019
-- Drexel University College of Computing and Informatics
 
--Johnson, A. E., Pollard, T. J., Shen, L., Lehman, L. H., Feng, M., Ghassemi, M., . . . Mark, R. G.
-- (2016, May 24). MIMIC-III, a freely accessible critical care database. Retrieved July 1,
-- 2019, from https://www.nature.com/articles/sdata201635/


--Data Queries by Griffin Wong


--This query allows users to view which care providers have worked with which patients, and how old each patient is. 
--This would possibly allow the hospital to gather information about which age range the care provider works best with.

SELECT SPECIALTY, PATIENT_DOB, CARE_PROVIDER_ID, PATIENT_ID
FROM PATIENT, TREATMENT, CARE_PROVIDER
WHERE PATIENT.PATIENT_ID = TREATMENT.PATIENT_ID
GROUP BY CARE_PROVIDER_ID, SPECIALTY, PATIENT_DOB;


/*This query allows users to view vital statistics for each patient, and which care provider they are working with. 
This would be very important to see how long the patient received care from this provider for.*/

SELECT PATIENT_DOB, PATIENT_DOD, CARE_PROVIDER_ID, PATIENT_ID
FROM PATIENT, TREATMENT, CARE_PROVIDER
WHERE PATIENT.PATIENT_ID = TREATMENT.PATIENT_ID
GROUP BY PATIENT_DOB, PATIENT_DOD, CARE_PROVIDER_ID, PATIENT_ID;


/*This query allows users to view which type of admission and where in the hospital each patient is admitted to, 
as well as which care provider they worked with when they were admitted.*/

SELECT ADM_TYPE, ADM_LOC, CARE_PROVIDER_ID, PATIENT_ID
FROM PATIENT, ADMISSIONS, CARE_PROVIDER
WHERE PATIENT.PATIENT_ID = TREATMENT.PATIENT_ID
GROUP BY CARE_PROVIDER_ID, PATIENT_ID, ADM_TYPE, ADM_LOC;


