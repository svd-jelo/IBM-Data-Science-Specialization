-- Active: 1777208460017@@127.0.0.1@3306@HR
CREATE DATABASE HR;

CREATE TABLE EMPLOYEES (
    EMP_ID CHAR(9) NOT NULL,
    F_NAME VARCHAR(15) NOT NULL,
    L_NAME VARCHAR(15) NOT NULL,
    SSN CHAR(6),
    B_DATE DATE,
    SEX CHAR(1),
    ADDRESS VARCHAR(30),
    JOB_ID CHAR(9) NOT NULL,
    SALARY INTEGER,
    MANAGER_ID CHAR(9) NOT NULL,
    DEP_ID CHAR(9) NOT NULL,
    PRIMARY KEY (EMP_ID)
);

CREATE TABLE JOB_HISTORY (
    EMP_ID CHAR(9) NOT NULL,
    START_DATE DATE,
    JOB_ID CHAR(9) NOT NULL,
    DEP_ID CHAR(9) NOT NULL
);

CREATE TABLE JOBS (
    JOB_ID CHAR(9) NOT NULL,
    JOB_TITLE VARCHAR(50),
    MIN_SALARY INTEGER,
    MAX_SALARY INTEGER,
    PRIMARY KEY (JOB_ID)
);

CREATE TABLE DEPARTMENTS (
    DEP_ID CHAR(9) NOT NULL,
    DEP_NAME VARCHAR(30),
    MANAGER_ID CHAR(9) NOT NULL,
    LOC_ID CHAR(9) NOT NULL,
    PRIMARY KEY (DEP_ID)
);

CREATE TABLE LOCATIONS (
    LOC_ID CHAR(9) NOT NULL,
    DEP_ID CHAR(9) NOT NULL,
    PRIMARY KEY (LOC_ID, DEP_ID)
);

LOAD DATA LOCAL INFILE '/Users/jelo/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/lab/data/HR-DB/Employees.csv'
INTO TABLE EMPLOYEES
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '/Users/jelo/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/lab/data/HR-DB/JobsHistory.csv'
INTO TABLE JOB_HISTORY
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '/Users/jelo/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/lab/data/HR-DB/Jobs.csv'
INTO TABLE JOBS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/jelo/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/lab/data/HR-DB/Departments.csv'
INTO TABLE DEPARTMENTS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/jelo/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/lab/data/HR-DB/Locations.csv'
INTO TABLE LOCATIONS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT * FROM EMPLOYEES;
SELECT * FROM `JOB_HISTORY`;
SELECT * FROM `JOBS`;
SELECT * FROM `DEPARTMENTS`;
SELECT * FROM `LOCATIONS`;

/* EXAMPLES */
-- 1. Retrieve first and last name for employees who live in Elgin, IL
SELECT F_NAME, L_NAME
FROM `EMPLOYEES`
WHERE `ADDRESS` LIKE '%Elgin,IL%';

-- 2. Retrieve employees who were born during the 70s
SELECT F_NAME, L_NAME
FROM `EMPLOYEES`
WHERE `B_DATE` LIKE '197%';

-- 3. Retrieve employees in department 5 where salary is between 60k and 70k
SELECT *
FROM `EMPLOYEES`
WHERE (`SALARY` BETWEEN 60000 AND 70000) AND `DEP_ID`=5;

-- 4. Retrieve first name, last name, and dept. id ordered by dept. id
SELECT F_NAME, L_NAME, DEP_ID
FROM `EMPLOYEES`
ORDER BY `DEP_ID`;

-- 5. Same query as 4. but dept. id in desc order and last name in desc order
SELECT F_NAME, L_NAME, DEP_ID
FROM `EMPLOYEES`
ORDER BY `DEP_ID` DESC, `L_NAME` DESC;

-- 6. Count employees in each dept.
SELECT DEP_ID, COUNT(*)
FROM `EMPLOYEES`
GROUP BY `DEP_ID`;

-- 7. Same as 6. but also retrieve average salary
SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM `EMPLOYEES`
GROUP BY `DEP_ID`;

-- 8. Same as 7. but label employee count as NUM_EMPLOYEES, avg salary as AVG_SALARY
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM `EMPLOYEES`
GROUP BY `DEP_ID`;

-- 9. Same as 8. but order by avg_salary
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM `EMPLOYEES`
GROUP BY `DEP_ID`
ORDER BY AVG_SALARY;

-- 10. Same as 9. but filter grouping; only those with count<4
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM `EMPLOYEES`
GROUP BY `DEP_ID`
HAVING COUNT(*)<4
ORDER BY AVG_SALARY;


/*EXERCISES*/
-- 1. Retrieve the list of all employees, first and last names, whose first names start with ‘S’.
SELECT F_NAME, L_NAME
FROM `EMPLOYEES`
WHERE `F_NAME` LIKE 'S%'

-- 2. Arrange all the records of the EMPLOYEES table in ascending order of the date of birth.
SELECT *
FROM `EMPLOYEES`
ORDER BY `B_DATE` ASC;

-- 3. Group the records in terms of the department IDs and filter them of ones that have average salary more than or equal to 60000. Display the department ID and the average salary.
SELECT DEP_ID, AVG(SALARY) AS "AVG_SALARY"
FROM `EMPLOYEES`
GROUP BY DEP_ID
HAVING AVG(SALARY)>=60000;

-- 4. For the problem above, sort the results for each group in descending order of average salary.
SELECT DEP_ID, AVG(SALARY) AS "AVG_SALARY"
FROM `EMPLOYEES`
GROUP BY DEP_ID
HAVING AVG(SALARY)>=60000
ORDER BY AVG_SALARY DESC;