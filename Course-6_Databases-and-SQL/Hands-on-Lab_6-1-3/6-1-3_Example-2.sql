-- Insert two new instructor records into the “Instructor” table. First record with id 5 for John Doe who lives in Sydney, AU. Second record with id 6 for Jane Doe who lives in Dhaka, BD.
INSERT INTO Instructors (ins_id,lastname,firstname,city,country)
VALUES (5,'John','Doe','Sydney','AU'), (6,'Jane','Doe','Dhaka','BD');

SELECT * FROM Instructors