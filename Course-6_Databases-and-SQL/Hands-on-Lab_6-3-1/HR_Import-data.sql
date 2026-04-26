LOAD DATA LOCAL INFILE '/Users/jelo/Desktop/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/Hands-on-Lab_6-3-1/Employees.csv'
INTO TABLE EMPLOYEES
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '/Users/jelo/Desktop/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/Hands-on-Lab_6-3-1/JobsHistory.csv'
INTO TABLE JOB_HISTORY
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '/Users/jelo/Desktop/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/Hands-on-Lab_6-3-1/Jobs.csv'
INTO TABLE JOBS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/jelo/Desktop/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/Hands-on-Lab_6-3-1/Departments.csv'
INTO TABLE DEPARTMENTS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/jelo/Desktop/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/Hands-on-Lab_6-3-1/Locations.csv'
INTO TABLE LOCATIONS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT * FROM EMPLOYEES;
SELECT * FROM `JOB_HISTORY`;
SELECT * FROM `JOBS`;
SELECT * FROM `DEPARTMENTS`;
SELECT * FROM `LOCATIONS`;