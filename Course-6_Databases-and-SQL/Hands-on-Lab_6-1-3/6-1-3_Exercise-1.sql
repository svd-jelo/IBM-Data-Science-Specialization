-- Insert a new instructor record with id 7 for Antonio Cangiano who lives in Vancouver, CA into the “Instructor” table.
INSERT INTO Instructors (ins_id, lastname, firstname, city, country)
VALUES (7, 'Cangiano', 'Antonio', 'Vancouver', 'CA');

-- Check
SELECT * FROM Instructors;