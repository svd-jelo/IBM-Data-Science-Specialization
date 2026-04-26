-- Insert two new instructor records into the “Instructor” table. First record with id 8 for Steve Ryan who lives in Barlby, GB. Second record with id 9 for Ramesh Sannareddy who lives in Hyderabad, IN.
INSERT INTO Instructors (ins_id, lastname, firstname, city, country)
VALUES (8, 'Ryan', 'Steve', 'Barbly', 'GB'), (9, 'Sannareddy', 'Ramesh', 'Hyderabad', 'IN');

-- Check
SELECT * FROM Instructors;