-- 1. Write a query that calculates the total cost of all animal rescues in the PETRESCUE table.
SELECT SUM(COST) AS SUM_OF_COST FROM `PETRESCUE`;

-- 2. Write a query that displays the maximum quantity of animals rescued (of any kind).
SELECT MAX(QUANTITY) FROM `PETRESCUE`;

-- 3. Write a query that displays the average cost of animals rescued.
SELECT AVG(COST) AS AVG_COST FROM `PETRESCUE`;

-- 4. Write a query that displays the rounded integral cost of each rescue
SELECT ROUND(COST) FROM `PETRESCUE`;

-- 5. Write a query that displays the length of each animal name.
SELECT LENGTH(ANIMAL) FROM `PETRESCUE`;

-- 6. Write a query that displays the animal name in each rescue in uppercase.
SELECT UCASE(ANIMAL) FROM `PETRESCUE`;

-- 7. Write a query that displays the rescue date (day, month, year in separate cols).
SELECT
DAY(`RESCUEDATE`) AS DAY,
MONTH(`RESCUEDATE`) AS MONTH,
YEAR(`RESCUEDATE`) AS YEAR
FROM `PETRESCUE`;

/* 8. Animals rescued should see the vet within three days of arrival.
Write a query that displays the third day of each rescue.
*/
SELECT
RESCUEDATE,
DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) AS VETDATE
FROM `PETRESCUE`;

/* 9. Write a query that displays the length of time the animals have been rescued,
for example, the difference between the current date and the rescue date.
*/
SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM `PETRESCUE`;