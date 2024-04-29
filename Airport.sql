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

ALTER TABLE plane
MODIFY COLUMN plane_id VARCHAR(100);

ALTER TABLE flight
MODIFY COLUMN plane_id VARCHAR(100);

ALTER TABLE flight
ADD FOREIGN KEY (plane_id) REFERENCES plane(plane_id);

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

INSERT INTO crew
VALUES 
(1, 'AC7885123', 'John', 'Moor', 'Steward'),
(2, '33558456', 'Thea', 'Smith', 'First Officer'),
(3, 'GH7778I789', 'Michael', 'Rowe', 'Captain'),
(4, 'J2347976I', 'Orla', 'Williams', 'Steward'),
(5, '96588O345', 'Diane', 'Coleman', 'Steward'),
(6, 'R79744678', 'Sara', 'Jones', 'Steward'),
(7, 'ST3647901', 'Cerys', 'Miller', 'Captain'),
(8, '448337234', 'Amanda', 'Davis', 'Steward'),
(9, 'HU64K567', 'Pia', 'Wilson', 'Steward'),
(10, 'BCD897650', 'Tess', 'Reid', 'Steward'),
(11, 'E599675123', 'Marcus', 'Anderson', 'Captain'),
(12, 'J43849056', 'Sandra', 'Martinez', 'Steward'),
(13, 'KO3456789', 'Drew', 'Haines', 'First Officer'),
(14, '9654348012', 'Mathilde', 'Bond', 'Captain'),
(15, 'S3448445', 'Reece', 'Smith', 'Purser'),
(16, 'T6784856', 'Nico', 'Perez', 'Steward'),
(17, '75885901A', 'Justin', 'Robinson', 'Steward'),
(18, '458234RE', 'Agnes', 'Clark', 'Captain'),
(19, '34567558', 'Martin', 'Lewis', 'Purser'),
(20, 'C4795E890', 'Eliza', 'Lee', 'Steward'),
(21, 'EG4737123', 'Tyler', 'Walker', 'Steward'),
(22, 'G37499456', 'Hilda', 'Goldberg', 'Captain'),
(23, 'I54899789', 'Kevin', 'Hall', 'Steward'),
(24, 'N012696', 'Poppy', 'Young', 'First Offficer'),
(25, '3453489H', 'Jax', 'King', 'Steward');


INSERT INTO plane
(plane_id, airline, model, capacity)
VALUES
('BQ-661', 'American Airlines', 'Airbus A320', 643),
('ER-844', 'American Airlines', 'Cessna 172', 414),
('HH-300', 'Delta Airlines', 'Boeing 747', 373),
('FN-813', 'American Airlines', 'Airbus A320', 414),
('RE-794', 'American Airlines', 'Airbus A320', 904),
('DA-174', 'Southwest Airlines', 'Embraer E190', 536),
('IZ-156', 'Southwest Airlines', 'Airbus A320', 249),
('ZC-542', 'JetBlue Airways', 'Boeing 747', 759),
('TC-127', 'JetBlue Airways', 'Embraer E190', 926),
('LQ-257', 'Southwest Airlines', 'Embraer E190', 289),
('YC-422', 'Southwest Airlines', 'Cessna 172', 445),
('PZ-691', 'United Airlines', 'Bombardier Challenger', 394);

select plane_id from plane;
INSERT INTO passengers 
(passenger_id, forename, surname, passport_id, date_of_birth, allergies, assistance_required)
VALUES
(1, 'Barnabas', 'Beartup', 'WG593673', '1951-05-17', null, true),
(2, 'Cassandry', 'Birckmann', 'WI400852', '1995-12-11', null, true),
(3, 'Isadore', 'McDavid', 'QB961305', '1964-09-25', null, false),
(4, 'Karly', 'McCrow', 'FP820524', '1950-01-06', 'peanuts', false),
(5, 'Doralia', 'Gorstidge', 'OB717499', '2004-03-22', null, false),
(6, 'Lisette', 'Russen', 'KI492762', '1959-03-26', null, true),
(7, 'Lilly', 'Valintine', 'DU531301', '1970-01-16', null, false),
(8, 'Gayleen', 'Churchman', 'PP027949', '1981-04-03', null, true),
(9, 'Alfie', 'Da Costa', 'UU000249', '2006-06-21', null, false),
(10, 'Penrod', 'Halbeard', 'GM011534', '1968-04-21', null, true),
(11, 'Oswald', 'Glynn', 'PX408242', '1966-10-15', null, false),
(12, 'Jada', 'Benettini', 'JM378714', '1951-03-10', 'peanuts', true),
(13, 'Neely', 'Roskilly', 'HA292447', '1976-12-15', null, true),
(14, 'Lockwood', 'Darlison', 'DY729823', '1958-05-20', null, false),
(15, 'Maddie', 'Pattisson', 'ZW947026', '1961-08-03', null, true),
(16, 'Tamiko', 'Brellin', 'OI926291', '1968-11-17', null, true),
(17, 'Griffy', 'Ivons', 'NN876357', '2003-01-19', 'gluten', false),
(18, 'Pooh', 'Scurr', 'TM955381', '1993-02-12', null, false),
(19, 'Chic', 'Scuse', 'ME490957', '1979-04-24', null, false),
(20, 'Nancey', 'Suddaby', 'ZJ541428', '1969-05-09', null, true);

INSERT INTO flight
VALUES
('BA12', 'BQ-661', 'New York JFK', '2024-05-22 08:35:00', 'A13', 470),
('BA23', 'DA-174', 'Madrid', '2024-05-22 09:10:00', 'B32', 200),
('VS102', 'ER-844', 'Lisbon', '2024-05-22 10:35:00', 'B2', 230),
('RA129', 'FN-813', 'Brussels', '2024-05-22 11:20:00', 'A21', 160),
('FR5', 'HH-300', 'Miami', '2024-05-23 11:45:00', 'A6', 540),
('GT631', 'IZ-156', 'Seville', '2024-05-23 13:50:00', 'C14', 220),
('KH154', 'LQ-257', 'Berlin', '2024-05-23 15:30:00', 'A12', 140),
('RD243', 'PZ-691', 'Singapore', '2024-05-23 15:55:00', 'C7', 780),
('RH183', 'RE-794', 'Male', '2024-05-23 18:05:00', 'A17', 680),
('CS134', 'TC-127', 'Venice', '2024-05-24 10:25:00', 'C24', 90),
('CN131', 'YC-422', 'Ho Chi Minh', '2024-05-24 12:05:00', 'B12', 700),
('MH122', 'ZC-542', 'Atlanta', '2024-05-24 14:15:00', 'B15', 510),
('MP132', 'ER-844', 'Porto', '2024-05-24 14:35:00', 'C2', 230),
('RF345', 'FN-813', 'Hamburg', '2024-05-24 16:20:00', 'B11', 160);


INSERT INTO crew_roster
VALUES
(1, 1, 'BA12'),
(2, 1, 'FR5'),
(3, 1, 'CS134'),
(4, 1, 'RF345'),
(5, 2, 'FR5'),
(6, 2, 'MH122'),
(7, 2, 'BA12'),
(8, 3, 'VS102'),
(9, 3, 'RD243'),
(10, 4, 'BA12'),
(11, 4, 'FR5'),
(12, 4, 'CS134'),
(13, 5, 'BA12'),
(14, 5, 'MP132'),
(15, 6, 'RH183'),
(16, 6, 'BA23'),
(17, 6, 'RF345'),
(18, 7, 'VS102'),
(19, 7, 'GT631'),
(20, 7, 'CS134'),
(21, 8, 'BA23'),
(22, 8, 'RH183'),
(23, 8, 'CS134'),
(24, 9, 'GT631'),
(25, 9, 'CS134'),
(26, 9, 'BA23'),
(27, 10, 'RH183'),
(28, 10, 'RA129'),
(29, 10, 'RF345'),
(30, 11, 'RD243'),
(31, 11, 'RA129'),
(32, 12, 'MP132'),
(33, 12, 'KH154'),
(34, 13, 'RA129'),
(35, 13, 'CS134'),
(36, 14, 'BA23'),
(37, 15, 'CN131'),
(38, 15, 'BA12'),
(39, 15, 'MP132'),
(40, 16, 'VS102'),
(41, 16, 'CS134'),
(42, 17, 'GT631'),
(43, 19, 'KH154'),
(44, 19, 'BA23'),
(45, 21, 'CN131'),
(46, 21, 'BA12'),
(47, 22, 'KH154'),
(48, 23, 'CS134'),
(49, 23, 'MH122'),
(50, 23, 'KH154'),
(51, 24, 'BA23'),
(52, 25, 'CN131'),
(53, 25, 'FR5'),
(54, 25, 'BA23');
