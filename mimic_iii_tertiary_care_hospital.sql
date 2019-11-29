-- INFO 210: Database Management Systems Final Project Summer 2019
-- Drexel University College of Computing and Informatics
 
--Johnson, A. E., Pollard, T. J., Shen, L., Lehman, L. H., Feng, M., Ghassemi, M., . . . Mark, R. G.
-- (2016, May 24). MIMIC-III, a freely accessible critical care database. Retrieved July 1,
-- 2019, from https://www.nature.com/articles/sdata201635/



/*
TODO

PRESCRIPTION	(HOSPT_ADM_ID*, PATIENT_ID, IS_PREVIOUS_APPOINTMENT, 
                    IS_CURRENT_APPOINTMENT, IS_SCHEDULED_APPOINTMENT, 
                    APMT_DATE, APMT_TIME, VITAL_SIGNS, FLUID_BALANCE, CPT_CODE)

PHARMACY	(PHARMACY_ID*, PATIENT_ID ** FK, INSURANCE_ID ** FK, EXTENSION_NUMBER,MEDICATION_STOCK) 

HOSPITAL	(HOSPITAL_ID*, LABORATORY_ID FK, PHARMACY_ID FK, HOSPITAL_NAME, ADDRESS, CITy, STATE, ZIPCODE, PHONE_NUMBER)
*/


CREATE TABLE PATIENT(
    ROW_ID INT,
    PATIENT_ID INT PRIMARY KEY NOT NULL,
    GENDER VARCHAR2(5),
    PATIENT_DOB TIMESTAMP,
    PATIENT_DOD TIMESTAMP,
    DOD_SSN TIMESTAMP,
    DOD_HOSPITAL TIMESTAMP,
    EXPIRE_FLAG VARCHAR2(5));

INSERT INTO PATIENT VALUES(1, 1, 'MALE', '01/19/2019', '04/16/2019', 120-50-0213, '04/16/2019', TRUE);
INSERT INTO PATIENT VALUES(2, 2, 'FEMALE', '08/25/1999', NULL, NULL, NULL, NULL, FALSE);
INSERT INTO PATIENT VALUES(3, 3, 'FEMALE', '03/03/1982', NULL, NULL, NULL, NULL, FALSE);


CREATE TABLE ADMISSIONS(
    ROW_ID INT,
    HOSP_ADM_ID INT PRIMARY KEY NOT NULL,
    PATIENT_ID INT,
    ADM_TIME TIMESTAMP,
    DISCH_TIME TIMESTAMP,
    DEATH_TIME TIMESTAMP,
    ADM_TYPE VARCHAR(50),
    ADM_LOC VARCHAR(50), 
    DISCH_LOC VARCHAR(50),
    INSURANCE VARCHAR(255),
    LANGUAGE_TYPE VARCHAR(10),
    RELIGION VARCHAR(50),
    MARITAL_STATUS VARCHAR(50),
    ETHNICITY VARCHAR(200),
    ED_REG_TIME TIMESTAMP,
    ED_OUT_TIME TIMESTAMP,
    DIAGNOSIS VARCHAR(300),
    HOSPITAL_EXPIRE_FLAG BOOLEAN,
    HAS_CHART_EVENTS_DATA BOOLEAN,
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID));


INSERT INTO ADMISSIONS VALUES(1, 1, 1, '04/15/2019 2:00 PM EST', NULL, '04/16/2019 1:45 AM EST', 'NEWBORN', '** INFO NOT AVAILABLE **', NULL, NULL, NULL, NULL, NULL, 'WHITE', '04/16/2019 1:30 AM EST', '04/16/2019 1:50 AM EST', 'Hypertensive heart and chronic kidney disease.', TRUE, TRUE);
INSERT INTO ADMISSIONS VALUES(2, 2, 2, '04/17/2019 4:35 PM EST', '04/18/2019 10:45 AM EST', NULL, 'URGENT', 'TRSF WITHIN THIS FACILITY', 'EMERGENCY', 'MEDICAID', 'BANGLADESHI', 'HINDU', 'SINGLE', 'BANGLADESHI', '04/17/2019 4:35 PM EST', '04/18/2019 8:00 AM EST', 'Chronic obstructive pulmonary disease, unspecified.', FALSE, TRUE);
INSERT INTO ADMISSIONS VALUES(3, 3, 3, '04/17/2019 7:35 AM EST', '04/17/2019 4:15 PM EST', NULL, 'EMERGENCY', 'EMERGENCY ROOM ADMIT', 'CRITICAL CARE UNIT', 'MEDICARE', 'ENGLISH', 'CATHOLIC', 'MARRIED', 'WHITE', '04/17/2019 10:27 AM EST', '04/17/2019 4:55 PM EST', 'Varicose veins of other sites. A disorder characterized by bleeding from esophageal varices', FALSE, TRUE);

CREATE TABLE LAB_ITEMS (
    ROW_ID INT,
    LAB_ITEM_ID INT PRIMARY KEY,
    LABEL VARCHAR(100),
    FLUID VARCHAR(100),
    CATEGORY VARCHAR(100),
    LOINC_CODE VARCHAR(100));

INSERT INTO LAB_ITEMS VALUES(1,1,'POTASSIUM, SERUM', 'BLOOD', 'ABG', '2823-3');
INSERT INTO LAB_ITEMS VALUES(2,2,'Hemoglobin [Mass/volume] in Blood', 'BLOOD', 'HEM/BC', '718-7');
INSERT INTO LAB_ITEMS VALUES(3,3, 'Iron deficiency anemia secondary to blood loss (chronic)', NULL, '285-1');


CREATE TABLE LAB_EVENTS (
    ROW_ID INT,
    PATIENT_ID INT,
    HOSP_ADM_ID INT,
    LAB_ITEM_ID INT,
    CHART_TIME TIMESTAMP, 
    MEASURED_VALUE VARCHAR(200),
    VALUE_UOM VARCHAR(20),
    VALUE_NUM DECIMAL,
    FLAG VARCHAR(20),
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID),
    FOREIGN KEY (HOSP_ADM_ID) REFERENCES ADMISSIONS(HOSP_ADM_ID),
    FOREIGN KEY (LAB_ITEM_ID) REFERENCES LAB_ITEMS(LAB_ITEM_ID));

INSERT INTO LAB_EVENTS VALUES(1,1,1,1, '04/16/2019', '1.2-2.5', 'mmol/L', '1.2-2.5', 'ABNORMAL');
INSERT INTO LAB_EVENTS VALUES(2,2,2,2, '04/17/2019', '13.2-17.1', 'g/dL', '13.2-17.1', 'NORMAL');
INSERT INTO LAB_EVENTS VALUES(3,3,3,3, '04/17/2019', '27-164', 'mcg/dL', '27-164', 'ABNORMAL');


CREATE TABLE CPT_EVENTS (
    ROW_ID INT,
    PATIENT_ID INT,
    HOSP_ADM_ID INT,
    COST_CENTER VARCHAR(10),
    CHART_DATE  TIMESTAMP,
    CPT_CODE VARCHAR(10),
    CPT_NUM INT,
    CPT_SUFFIX VARCHAR(5),
    TICKET_ID_SEQ INT,
    SECTION_HEADER VARCHAR(50),
    SUBSECTION_HEADER VARCHAR(300),
    CPT_CODE_DESCRIPTION VARCHAR(200),
    FOREIGN KEY (HOSP_ADM_ID) REFERENCES ADMISSIONS(HOSP_ADM_ID),
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID));

INSERT INTO CPT_EVENTS VALUES(1,1,1, 'ICU', '04/15/2019 2:00 PM EST', 'Potassium; serum, plasma or whole blood', '84132', 'Potassium; serum, plasma or whole blood', 1, 'Pathology and laboratory', 'anatomical pathology', NULL);
INSERT INTO CPT_EVENTS VALUES(2,2,2, 'ICU', '04/17/2019 4:35 PM EST', 'Hemoglobin [Mass/volume] in Blood', '85018', 'Hemoglobin [Mass/volume] in Blood', 1, 'Pathology and laboratory', 'anatomical pathology', NULL );
INSERT INTO CPT_EVENTS VALUES(2,2,2, 'ICU', '04/17/2019 7:35 AM EST', 'Iron deficiency anemia secondary to blood loss (chronic)', '83540', 'Iron deficiency anemia secondary to blood loss (chronic)', 1 ,'Pathology and laboratory', 'anatomical pathology', NULL);


--The Following Tables and Inserts are by Ryan Rethi

CREATE TABLE CRITICAL_CARE_UNIT (
    CCU_ID INT PRIMARY KEY NOT NULL,
    PATIENT_ID INT,
    CARE_PROVIDER_ID INT,   
    EXTENSION_NUMBER INT,
    SPECIALITY_UNIT_TYPE VARCHAR(100),
    FOREIGN KEY (CARE_PROVIDER_ID) REFERENCES CARE_PROVIDER(CARE_PROVIDER_ID),
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID));


INSERT INTO CRITICAL_CARE_UNIT VALUES ( 7, 4, 3, 11, “Brain Specialist”);
INSERT INTO CRITICAL_CARE_UNIT VALUES ( 8, 5, 2, 10, “Cancer Center”);
INSERT INTO CRITICAL_CARE_UNIT VALUES ( 9, 6, 1, 10, “Cancer Center”);


CREATE TABLE TREATMENT (
    PATIENT_ID INT,
    CARE_PROIVIDER_ID INT,
    FOREIGN KEY (CARE_PROVIDER_ID) REFERENCES CARE_PROVIDER(CARE_PROVIDER_ID),
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID));

INSERT INTO TREATMENT VALUES ( 7, 3);
INSERT INTO TREATMENT VALUES ( 8, 4);
INSERT INTO TREATMENT VALUES ( 9, 2);

CREATE TABLE CARE_PROVIDER (
    CARE_PROVIDER_ID INT PRIMARY KEY NOT NULL,
    FIRST_NAME VARCHAR(100),
    LAST_NAME VARCHAR(100),
    TITLE VARCHAR(100),
    SPECIALTY VARCHAR(100));

INSERT INTO CARE_PROVIDER VALUES ( 1, 'John', 'Anderson', 'Dr.', 'Endocrinologist');
INSERT INTO CARE_PROVIDER VALUES ( 3, 'Anna', 'Oyler', 'Dr.', 'Neurologist');
INSERT INTO CARE_PROVIDER VALUES ( 4, 'Kyle', 'Mendez', 'Dr.', 'Cardiologist');



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



-- Data Manipulation by Ryan Rethi

--Anna Oyler was recently married and changed her last name.

UPDATE CARE_PROVIDER SET LAST_NAME = “Sharron” WHERE CARE_PROVIDER_ID = 3;

--Dr. Halliday recently moved to another location in a different state.

DELETE FROM CARE_PROVIDER WHERE CARE_PROVIDER_ID = 2;