-- Update the city of the instructor record to Markham whose id is 1.
UPDATE Instructors
SET city='Markham'
WHERE ins_id='1';

-- Check
SELECT * FROM Instructors WHERE ins_id='1';