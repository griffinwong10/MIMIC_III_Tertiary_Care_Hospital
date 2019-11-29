-- INFO 210: Database Management Systems Final Project Summer 2019
-- Drexel University College of Computing and Informatics
 
--Johnson, A. E., Pollard, T. J., Shen, L., Lehman, L. H., Feng, M., Ghassemi, M., . . . Mark, R. G.
-- (2016, May 24). MIMIC-III, a freely accessible critical care database. Retrieved July 1,
-- 2019, from https://www.nature.com/articles/sdata201635/


--Data Manipulation by Griffin Wong 

--This patient no longer has health insurance coverage and was also involved in a car accident 
-- where they no longer have the ability to speak, hear, write, or read languages with linguistic understanding

DELETE INSURANCE FROM ADMISSIONS WHERE PATIENT_ID = 3;
DELETE LANGUAGE_TYPE FROM ADMISSIONS WHERE PATIENT_ID = 3;


-- This patient has died and is now associated with a date of death (DOD), 
-- date of death social security number (DOD_SSN), and a date of death hospital (DOD_HOSPITAL).

UPDATE PATIENT SET PATIENT_DOD = '08/25/2019' WHERE PATIENT_ID = 2;
UPDATE PATIENT SET DOD_SSN = '152-69-8037' WHERE PATIENT_ID = 2;
UPDATE PATIENT SET DOD_HOSPITAL = '08/25/2019' WHERE PATIENT_ID = 2;


