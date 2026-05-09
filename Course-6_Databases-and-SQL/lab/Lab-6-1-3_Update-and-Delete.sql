-- Active: 1777208460017@@127.0.0.1@3306@INSTRUCTORS
CREATE DATABASE INSTRUCTORS;
CREATE TABLE Instructors(
    ins_id TEXT,
    lastname TEXT,
    firstname TEXT,
    city TEXT,
    country TEXT
);

LOAD DATA LOCAL INFILE '/Users/jelo/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/lab/data/Film-Locations-and-Instructors-DB/Instructors.csv'
INTO TABLE Instructors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Insert a new instructor record with id 4 for Sandip Saha who lives in Edmonton, CA into the “Instructor” table.
INSERT INTO Instructors (ins_id, lastname, firstname, city, country)
VALUES ("4", "Saha", "Sandip", "Edmonton", "CA")
;
SELECT * FROM Instructors;

-- Insert two new instructor records into the “Instructor” table. First record with id 5 for John Doe who lives in Sydney, AU. Second record with id 6 for Jane Doe who lives in Dhaka, BD.
INSERT INTO Instructors (ins_id,lastname,firstname,city,country)
VALUES (5,'John','Doe','Sydney','AU'), (6,'Jane','Doe','Dhaka','BD');

SELECT * FROM Instructors;

-- Update the city for Sandip to Toronto.
UPDATE Instructors
SET city = 'Toronto'
WHERE firstname = 'Sandip'
;
-- Check
SELECT * FROM Instructors WHERE firstname='Sandip';

-- Update the city and country for Doe with id 5 to Dubai and AE respectively.
UPDATE Instructors
SET city='Dubai', country='AE'
WHERE ins_id=5
;
-- Check
SELECT * FROM Instructors WHERE ins_id=5;

-- Remove the instructor record of Doe whose id is 6.
DELETE FROM Instructors
WHERE ins_id=6;
-- Check
SELECT * FROM Instructors;

-- Insert a new instructor record with id 7 for Antonio Cangiano who lives in Vancouver, CA into the “Instructor” table.
INSERT INTO Instructors (ins_id, lastname, firstname, city, country)
VALUES (7, 'Cangiano', 'Antonio', 'Vancouver', 'CA');
-- Check
SELECT * FROM Instructors;

-- Insert two new instructor records into the “Instructor” table. First record with id 8 for Steve Ryan who lives in Barlby, GB. Second record with id 9 for Ramesh Sannareddy who lives in Hyderabad, IN.
INSERT INTO Instructors (ins_id, lastname, firstname, city, country)
VALUES (8, 'Ryan', 'Steve', 'Barbly', 'GB'), (9, 'Sannareddy', 'Ramesh', 'Hyderabad', 'IN');
-- Check
SELECT * FROM Instructors;

-- Update the city of the instructor record to Markham whose id is 1.
UPDATE Instructors
SET city='Markham'
WHERE ins_id='1';
-- Check
SELECT * FROM Instructors WHERE ins_id='1';

-- Update the city and country for Sandip with id 4 to Dhaka and BD respectively.
UPDATE Instructors
SET city='Dhaka', country='BD'
WHERE ins_id=4
;
-- Check
SELECT * FROM Instructors WHERE ins_id=4;

-- Remove the instructor record of Hima.
DELETE FROM Instructors
WHERE firstname='Hima';
-- Check
SELECT * FROM Instructors;