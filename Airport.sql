CREATE DATABASE airport;

CREATE TABLE flight (
flight_number  INT NOT NULL PRIMARY KEY,
plane_id INT NOT NULL,
destination VARCHAR(100) NOT NULL,
departure_time_date DATETIME NOT NULL, 
departure_gate VARCHAR(100),
duration INT NOT NULL);

SELECT * FROM flight;



 


