# MIMIC_III_Tertiary_Care_Hospital

INFO 210: Database Management Systems
Term Project Final
Ryan Rethi, and Griffin Wong
Friday, September 6, 2019
Project Category: Oracle Implementation

Title: Design & implement an Intensive Care Information System (ICIS) for a large tertiary care hospital.

1. The Problem Statement

Following recent trends in the healthcare field of hospitals moving towards a digital health record system, a large tertiary care hospital with multiple critical care units would like to create an Intensive Care Information System (ICIS) for the operations analysis of routine hospital care.  
Overall goals of the system
The overall goals of the system are to keep track of the following data types: vital signs, medications, laboratory measurements, care provider charts and observations, fluid balance, procedure/diagnostic codes, imaging reports, hospital stay length, and survival data.
Context and Importance of the system
It is critical that any critical care unit, such as one of a large tertiary care hospital, be able to manage their current patient information, as well as their previous patient’s records and statistics.  It is important to track these items for the purposes of improving healthcare, so that management is aware of the comprehensive clinical data and trends of patients admitted into the critical care unit.  It is also important to track these items for the purposes of identifying patterns of notable characteristics in charted observations and laboratory measurements, as well as for documentation of discharge codes and hospital stay length.

Scope of the project

IN-Scope :

Intensive Care Information System (ICIS) will include only patient demographics, in-hospital mortality, vital signs, medications, laboratory measurements, care provider charts & observations, fluid balance, procedure & diagnostic codes, discharge summary, imaging & electrocardiogram reports, billing information (International Classification of Disease, 9th edition (ICD-9 codes)), hospital stay length, and out-of-hospital mortality rates, and medications.

OUT-Scope:

Intensive Care Information System (ICIS) will not include identifiable patient information or any of the eighteen identifying data elements listed in the Health Insurance Portability and Accountability Act (HIPAA), including: patient name, telephone number, residential address, fax number, email address, social security number, medical record number, health plan beneficiary number, account number, certificate or license number, vehicle or device serial number, Web URL, internet protocol address, finger or voice print, photographic image, and dates. Dates included in the ICIS were shifted by a random offset into the future to preserve intervals.

2. Requirements

2.1 Data requirements (Should be further expanded)

From the scope of our project the following would be collected. Patient demographics, in-hospital mortality, vital signs, medications, laboratory measurements, care provider charts & observations, fluid balance, procedure & diagnostic codes, discharge summary, imaging & electrocardiogram reports, billing information (International Classification of Disease, 9th edition (ICD-9 codes)), hospital stay length, and out-of-hospital mortality rates, and medications.

For each patient a breakdown of their stay will be made. Outlining why the patient was there and what has been done to the patient as well as any other pertinent information..

2.2 Business Rules and Logic 
Critical care for the patient is the number one concern. Data collected will help monitor trends that could help lead to possible diagnosis or treatments.
The use of data collected to help future and current patients will help in further observations of patients.
For each patient a ICIS will track all data and documentation for comparison and data analytics.

2.3 Sample Output
Display critical information (vitals, medications, fluid balance, etc.) for each patient.
Display discharge summary along with billing information.
Track and monitor and similarities of information between patients to track patterns.

2.4 Other Assumptions 
We will assume ICIS will be used by a hospital with an intensive care unit in a real-world setting.
ICIS runs on a client/server environment.
The underlying DB system is Oracle
2.5 Data Acquisition

Data acquisition for this project was an area that we had some trouble with. A lot of resources for data related to our project was restricted. To gain access one had to submit proof of who they were and what organization/university they represented. As well as mention what the data would be used for. Unfortunately we did not gain the necessary permissions by the time the final due date. The data we have in our SQL statements is modeled after example data from the data sources we intended to use. As is should be medical data is kept under security from just having anyone have access to use and manipulate.
