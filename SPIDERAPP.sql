DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Spider;
DROP TABLE IF EXISTS Habitat;

CREATE TABLE Location (
latitude DECIMAL(3, 2),
longitude DECIMAL(3, 2)
);

CREATE TABLE Spider (
commonname char(100) PRIMARY KEY,
isvenomous bool,
photo BLOB(10),
color char(15)
);

CREATE TABLE Habitat(
continent char(30),
section char(30),
country char(30),
region char(30),
city char(30)
);

INSERT INTO Spider 
VALUES
("Daddy long legs", FALSE, NULL, "brown");

select *
from spider;