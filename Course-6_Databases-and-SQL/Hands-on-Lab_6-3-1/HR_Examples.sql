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