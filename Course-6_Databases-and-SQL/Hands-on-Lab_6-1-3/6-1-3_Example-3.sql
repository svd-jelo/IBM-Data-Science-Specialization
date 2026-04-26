-- Update the city for Sandip to Toronto.
UPDATE Instructors
SET city = 'Toronto'
WHERE firstname = 'Sandip'
;

-- Check
SELECT * FROM Instructors WHERE firstname='Sandip';