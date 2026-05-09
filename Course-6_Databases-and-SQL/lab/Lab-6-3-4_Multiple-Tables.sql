/*
1. Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
a. Using sub-queries
*/
SELECT * FROM `EMPLOYEES`
WHERE `JOB_ID` IN (
    SELECT `JOB_ID`
    FROM JOBS
    WHERE `JOB_TITLE`='Jr. Designer');
-- b. Using implicit Joins
SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID AND J.JOB_TITLE='Jr. Designer';

/*
2. Retrieve JOB information and a list of employees whose birth year is after 1976.
a. Using sub-queries
*/
SELECT *
FROM `JOBS`
WHERE `JOB_ID` IN (
    SELECT `JOB_ID`
    FROM `EMPLOYEES`
    WHERE YEAR(`B_DATE`)>1976
)
ORDER BY JOB_ID
;
-- b. Using implicit join
SELECT J.JOB_ID, J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY
FROM JOBS J, EMPLOYEES E
WHERE J.JOB_ID = E.JOB_ID AND YEAR(E.B_DATE)>1976
ORDER BY J.JOB_ID
;