-- Select All
SELECT *
FROM FilmLocations;

-- Select 21st century films including title, release year, locations
SELECT Title, "Release Year", Locations
FROM FilmLocations
WHERE "Release Year">=2001;

-- Retrieve films names, their directors and writers
SELECT Title, Director, Writer
FROM FilmLocations;

-- PRACTICE EXERCISES
-- 1. Retrieve the fun facts and filming locations of all films
SELECT "Fun Facts", Locations
FROM FilmLocations
WHERE "Fun Facts" <> "";

-- 2. Retrieve the names of all films released in the 20th century and before (release years before 2000 including 2000), along with filming locations and release years.
SELECT Title, Locations, "Release Year"
FROM FilmLocations
WHERE "Release Year"<=2000;

-- 3. Retrieve the names, production company names, filming locations, and release years of the films not written by James Cameron.
SELECT Title, "Production Company", Locations, "Release Year"
FROM FilmLocations
WHERE Writer <> "James Cameron";