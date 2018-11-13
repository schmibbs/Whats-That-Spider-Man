SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Spider;
DROP TABLE IF EXISTS Habitat;
DROP TABLE IF EXISTS Color;
DROP TABLE IF EXISTS Users;
DROP PROCEDURE IF EXISTS nameSearch;
DROP PROCEDURE IF EXISTS userPicLocations;

CREATE TABLE Location (
username char(25) PRIMARY KEY,
latitude DECIMAL(9, 6),
longitude DECIMAL(9, 6),
FOREIGN KEY (username) REFERENCES Users(username)
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
passW char(25),
FOREIGN KEY (username) REFERENCES Location(username)
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
("Schmibbs", 25.758916, -80.373866);

DELIMITER sqlPls
CREATE PROCEDURE nameSearch(spiderName char(100))
BEGIN
select Spider.commonname, city, primarycolor, secondarycolor
from spider, Location, Habitat, Color
where Color.commonname = Spider.commonname AND Spider.commonname = spiderName;
END sqlPls

CREATE PROCEDURE userPicLocations(passedUserName char(25))
BEGIN
select latitude, longitude
from Location, Users
where Location.username = Users.username AND Location.username = passedUserName;
END sqlPls

DELIMITER ;

-- call nameSearch("Carolina Wolf");
 call userPicLocations("Schmibbs");