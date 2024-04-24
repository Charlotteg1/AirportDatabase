CREATE DATABASE airport;

CREATE TABLE flight (
flight_number  INT NOT NULL PRIMARY KEY,
plane_id INT NOT NULL,
destination VARCHAR(100) NOT NULL,
departure_time_date DATETIME NOT NULL, 
departure_gate VARCHAR(100),
duration INT NOT NULL);

SELECT * FROM flight;

CREATE TABLE crew (
crew_id  INT NOT NULL PRIMARY KEY,
passport_number INT NOT NULL,
forename VARCHAR(100) NOT NULL,
surname VARCHAR(100) NOT NULL, 
job_role VARCHAR(100) NOT NULL
);

SELECT * FROM crew;

CREATE TABLE crew_roster (
shift_id INT NOT NULL PRIMARY KEY,
crew_id  INT NOT NULL,
flight_number INT NOT NULL
);

SELECT * FROM crew_roster;




 


