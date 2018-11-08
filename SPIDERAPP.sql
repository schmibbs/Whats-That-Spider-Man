DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Spider;
DROP TABLE IF EXISTS Habitat;
DROP TABLE IF EXISTS Color;
DROP TABLE IF EXISTS Users;

CREATE TABLE Location (
latitude DECIMAL(9, 6),
longitude DECIMAL(9, 6)
);

CREATE TABLE Spider (
commonname char(100) PRIMARY KEY,
isvenomous bool,
photo BLOB(10)
);

CREATE TABLE Habitat(
continent char(30),
section char(30),
country char(30),
region char(30),
city char(30)
);

CREATE TABLE Color (
primarycolor char(25),
secondarycolor char(25)
);

INSERT INTO Habitat 
VALUES(
"North America", "America", "united states", "south florida", "miami"
);

CREATE TABLE Users ( 
username char(25),
passW char(25)
);

INSERT INTO Spider 
VALUES
("Spiny orb weaver", FALSE, NULL),
("Huntsman", FALSE, NULL),
("Carolina wolf", FALSE, NULL),
("Southern Black Widow", TRUE, NULL);

INSERT INTO Location
VALUES
(25.758916, -80.373866);

select commonname, isvenomous
from spider, Location, Habitat
where Habitat.city = "miami";