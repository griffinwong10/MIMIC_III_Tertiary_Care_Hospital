-- INFO 210: Database Management Systems Final Project Summer 2019
-- Drexel University College of Computing and Informatics
 
--Johnson, A. E., Pollard, T. J., Shen, L., Lehman, L. H., Feng, M., Ghassemi, M., . . . Mark, R. G.
-- (2016, May 24). MIMIC-III, a freely accessible critical care database. Retrieved July 1,
-- 2019, from https://www.nature.com/articles/sdata201635/


-- Data Manipulation by Ryan Rethi

--Anna Oyler was recently married and changed her last name.

UPDATE CARE_PROVIDER SET LAST_NAME = “Sharron” WHERE CARE_PROVIDER_ID = 3;

--Dr. Halliday recently moved to another location in a different state.

DELETE FROM CARE_PROVIDER WHERE CARE_PROVIDER_ID = 2;