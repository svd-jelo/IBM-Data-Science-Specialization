-- 1. Retrieve the names and job start dates of all employees who work for department number 5.
SELECT E.F_NAME,E.L_NAME, JH.START_DATE 
FROM EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH 
ON E.EMP_ID=JH.EMP_ID 
WHERE E.DEP_ID ='5';

-- Apparently the below query is equivalent to an inner join...
SELECT E.F_NAME, E.L_NAME, JH.START_DATE
FROM `EMPLOYEES` E, `JOB_HISTORY` JH
WHERE E.EMP_ID = JH.EMP_ID AND E.DEP_ID = 5;

-- 2. Retrieve employee ID, last name, department ID, and department name for all employees.
SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
FROM `EMPLOYEES` AS E
LEFT OUTER JOIN `DEPARTMENTS` AS D
ON E.DEP_ID = D.DEP_ID;

-- 3. Retrieve the First name, Last name, and Department name of all employees.
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM `EMPLOYEES` AS E
LEFT JOIN `DEPARTMENTS` AS D
ON E.`DEP_ID` = D.`DEP_ID`
UNION
SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM `EMPLOYEES` AS E
RIGHT JOIN `DEPARTMENTS` AS D
ON E.`DEP_ID` = D.`DEP_ID`;

/* PRACTICE PROBLEMS
1. Retrieve the names, job start dates, and job titles of all employees who work for
department number 5.
*/
SELECT E.F_NAME, E.L_NAME, JH.START_DATE, J.JOB_TITLE
FROM `EMPLOYEES` AS E
INNER JOIN `JOB_HISTORY` AS JH ON E.`JOB_ID`=JH.`JOB_ID`
INNER JOIN `JOBS` AS J ON E.`JOB_ID`=J.`JOB_ID`
WHERE E.`DEP_ID`=5
;
/* 2. Retrieve employee ID, last name, and department ID for all employees but department
names for only those born before 1980.*/
SELECT E.EMP_ID, E.L_NAME, E.`B_DATE`, D.DEP_ID
FROM `EMPLOYEES` AS E
LEFT OUTER JOIN `DEPARTMENTS` AS D
ON E.`DEP_ID`=D.`DEP_ID` AND YEAR(E.`B_DATE`) < 1980;

