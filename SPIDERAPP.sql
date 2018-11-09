SET FOREIGN_KEY_CHECKS = 0;
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
photo BLOB(10),
description varchar(1000),
FOREIGN KEY(commonname) REFERENCES Color(commonname),
FOREIGN KEY(commonname) REFERENCES Habitat(commonname)
);

CREATE TABLE Habitat(
commonname char(100),
continent char(30),
section char(30),
country char(30),
region char(30),
city char(30),
FOREIGN KEY(commonname) REFERENCES Spider(commonname)
);

CREATE TABLE Color (
commonname char(100),
primarycolor char(25),
secondarycolor char(25),
FOREIGN KEY(commonname) REFERENCES Spider(commonname)
);

CREATE TABLE Users ( 
username char(25) PRIMARY KEY,
passW char(25)
);

INSERT INTO Habitat 
VALUES(
"Southern Black Widow","North America", "America", "united states", "south florida", "miami"
);

INSERT INTO Spider 
VALUES
("Spiny orb weaver", FALSE, NULL, "See these guys in my backyard all the time"),
("Huntsman", FALSE, NULL, "big enough to eat lizards"),
("Carolina wolf", FALSE, NULL, "Gross pimple like babies"),
("Southern Black Widow", TRUE, NULL, "Do not slap onto friends");

INSERT INTO Color
VALUES 
("Southern Black Widow", "black", "red"),
("Carolina wolf", "brown", "brown");

INSERT INTO Location
VALUES
(25.758916, -80.373866);

select Spider.commonname, city, primarycolor, secondarycolor
from spider, Location, Habitat, Color
where Habitat.city = "miami" AND Color.commonname = Spider.commonname AND primarycolor = "black";