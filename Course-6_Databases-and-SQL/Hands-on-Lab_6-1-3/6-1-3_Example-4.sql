-- Update the city and country for Doe with id 5 to Dubai and AE respectively.
UPDATE Instructors
SET city='Dubai', country='AE'
WHERE ins_id=5
;

-- Check
SELECT * FROM Instructors WHERE ins_id=5;