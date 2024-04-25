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

-- Olivia 
CREATE TABLE plane (
plane_id INTEGER PRIMARY KEY NOT NULL,
airline VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
capacity INTEGER NOT NULL
);

CREATE TABLE passengers(
passenger_id INTEGER PRIMARY KEY NOT NULL,
forename VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
passport_id VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
allergies VARCHAR(50),
assistance_required BOOLEAN NOT NULL
);

CREATE TABLE passenger_journey(
passenger_journey_id INTEGER PRIMARY KEY NOT NULL,
passenger_id INTEGER NOT NULL,
flight_id INTEGER NOT NULL,
seat_number VARCHAR(50) NOT NULL,
cabin_bag BOOLEAN NOT NULL,
checked_bag BOOLEAN NOT NULL
);
-- 

ALTER TABLE flight
RENAME COLUMN flight_number to flight_id;

SELECT * FROM flight;

ALTER TABLE crew_roster
RENAME COLUMN flight_number to flight_id;

SELECT * FROM crew_roster;

ALTER TABLE flight
MODIFY COLUMN flight_id VARCHAR(100);

ALTER TABLE crew_roster
MODIFY COLUMN flight_id VARCHAR(100);

ALTER TABLE passenger_journey
MODIFY COLUMN flight_id VARCHAR(100);

ALTER TABLE flight
RENAME COLUMN duration to duration_minutes;

ALTER TABLE crew
MODIFY COLUMN passport_number VARCHAR(100);

ALTER TABLE crew
RENAME COLUMN passport_number to passport_id;

ALTER TABLE flight
ADD FOREIGN KEY (plane_id) REFERENCES plane(plane_id);

DESCRIBE flight;

ALTER TABLE passenger_journey
ADD FOREIGN KEY (passenger_id) REFERENCES passengers (passenger_id);

ALTER TABLE passenger_journey
ADD FOREIGN KEY (flight_id) REFERENCES flight (flight_id);

-- Olivia
ALTER TABLE crew_roster
ADD FOREIGN KEY (flight_id)
REFERENCES flight (flight_id);


ALTER TABLE crew_roster
ADD FOREIGN KEY (crew_id)
REFERENCES crew (crew_id);
-- 