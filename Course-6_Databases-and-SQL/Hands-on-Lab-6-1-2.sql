-- 1. Count all records
SELECT COUNT(*)
FROM FilmLocations;

-- 2. Count locations of films written by James Cameron
SELECT COUNT(Locations)
FROM FilmLocations
WHERE Writer="James Cameron";

-- 3. Find all distinct titles
SELECT DISTINCT Title
FROM FilmLocations;

-- 4. Count all distinct release years of films produced by Warner Bros. Pictures
SELECT COUNT(DISTINCT "Release Year")
FROM FilmLocations
WHERE "Production Company"="Warner Bros. Pictures";

-- 5. Retrieve first 25 rows
SELECT *
FROM FilmLocations
LIMIT 25;

-- 6. Retrieve 15 rows after row 10
SELECT *
FROM FilmLocations
LIMIT 15 OFFSET 10;

-- (PRACTICE EXERCISES) 1. Retrieve the number of locations of the films which are directed by Woody Allen.
SELECT COUNT(Locations)
FROM FilmLocations
WHERE Director="Woody Allen";

-- 2. Retrieve the number of films shot at Russian Hill.
SELECT COUNT(Title)
FROM FilmLocations
WHERE Locations="Russian Hill";

-- 3. Retrieve the number of rows having a release year older than 1950 from the "FilmLocations" table.
SELECT COUNT(*)
FROM FilmLocations
WHERE "Release Year"<1950;

-- 4. Retrieve the names of all unique films released in the 21st century and onwards, along with their release years.
SELECT DISTINCT Title, "Release Year"
FROM FilmLocations
WHERE "Release Year">=2001;

-- 5. Retrieve the directors' names and their distinct films shot at City Hall.
SELECT DISTINCT Title, Director
FROM FilmLocations
WHERE Locations="City Hall";

-- 6. Retrieve the number of distributors who distributed films with the 1st actor, Clint Eastwood.
SELECT COUNT(DISTINCT Distributor)
FROM FilmLocations
WHERE "Actor 1"="Clint Eastwood";

-- 7. Retrieve the names of the first 50 films.
SELECT DISTINCT Title
FROM FilmLocations
LIMIT 50;

-- 8. Retrieve the first 10 film names released in 2015.
SELECT DISTINCT Title
FROM FilmLocations
WHERE "Release Year"=2015
LIMIT 10;

-- 9. Retrieve the next 3 film names that follow after the first 5 films released in 2015.
SELECT DISTINCT Title
FROM FilmLocations
WHERE "Release Year"=2015
LIMIT 3 OFFSET 5;