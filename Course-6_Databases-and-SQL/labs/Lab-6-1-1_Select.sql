-- Active: 1777208460017@@127.0.0.1@3306@FILMLOCATIONS
-- Create Film Locations DB
CREATE DATABASE FILMLOCATIONS;
CREATE TABLE FilmLocations (
  Title TEXT,
  ReleaseYear TEXT,
  Locations TEXT,
  FunFacts TEXT,
  ProductionCompany TEXT,
  Distributor TEXT,
  Director TEXT,
  Writer TEXT,
  Actor1 TEXT,
  Actor2 TEXT,
  Actor3 TEXT,
  Point TEXT,
  Longitude TEXT,
  Latitude TEXT,
  AnalysisNeighborhood TEXT,
  SupervisorDistrict TEXT,
  data_as_of TEXT,
  data_loaded_at TEXT
);
LOAD DATA LOCAL INFILE '/Users/jelo/IBM-Data-Science-Specialization/Course-6_Databases-and-SQL/lab/data/Film-Locations-and-Instructors-DB/Film_Locations_in_San_Francisco_20260419.csv'
INTO TABLE FilmLocations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

-- Select All
SELECT *
FROM FilmLocations;

-- Select 21st century films including title, release year, locations
SELECT Title, ReleaseYear, Locations
FROM FilmLocations
WHERE ReleaseYear>=2001;

-- Retrieve films names, their directors and writers
SELECT Title, Director, Writer
FROM FilmLocations;

-- PRACTICE EXERCISES
-- 1. Retrieve the fun facts and filming locations of all films
SELECT FunFacts, Locations
FROM FilmLocations
WHERE FunFacts <> "";

-- 2. Retrieve the names of all films released in the 20th century and before (release years before 2000 including 2000), along with filming locations and release years.
SELECT Title, Locations, ReleaseYear
FROM FilmLocations
WHERE ReleaseYear<=2000;

-- 3. Retrieve the names, production company names, filming locations, and release years of the films not written by James Cameron.
SELECT Title, ProductionCompany, Locations, ReleaseYear
FROM FilmLocations
WHERE Writer <> "James Cameron";