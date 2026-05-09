-- Active: 1777208460017@@127.0.0.1@3306@Mysql_Learners
-- Note: This script file to create the PETRESCUE table was made by the instructors
drop table if exists PETRESCUE;

create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;

select * from `PETRESCUE`

/* EXAMPLES */
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

/* EXERCISES */
/*
1. Write a query that displays the average cost of rescuing a single dog.
Note that the cost per dog would not be the same in different instances.
*/
SELECT AVG(COST/QUANTITY)
FROM `PETRESCUE`
WHERE ANIMAL='Dog';

/*
2. Write a query that displays the animal name in each rescue in uppercase
without duplications.
*/
SELECT DISTINCT UCASE(ANIMAL)
FROM `PETRESCUE`;

/*
3. Write a query that displays all the columns from the PETRESCUE table where
the animal(s) rescued are cats. Use cat in lowercase in the query.
*/
SELECT *
FROM `PETRESCUE`
WHERE LCASE(ANIMAL)='cat'
-- note: output is the same even if LCASE is not used.
;

/*
4. Write a query that displays the number of rescues in the 5th month.
*/
SELECT SUM(QUANTITY)
FROM `PETRESCUE`
WHERE MONTH(`RESCUEDATE`)=5;

/*
5. The rescue shelter is supposed to find good homes for all animals
within 1 year of their rescue. Write a query that displays the ID and the target date.
*/
SELECT ID, `RESCUEDATE`, DATE_ADD(RESCUEDATE,INTERVAL 1 YEAR) AS `TARGET_DATE`
FROM `PETRESCUE`;