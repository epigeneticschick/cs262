--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden modified by Lorrayya Williams on Oct 18, 2019
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PropertyGame;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Properties;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Game;







-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp,
	complete boolean
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Properties(
		ID integer PRIMARY KEY,
		name varchar(50),
		colorGroup varchar(50),
		price integer,
		rent integer,
		rentHouse1 integer,
		rentHouse2 integer,
		rentHouse3 integer,
		rentHouse4 integer,
		rentHotel integer,
		houseCost integer
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	location integer REFERENCES Properties(ID)
	);



CREATE TABLE PropertyGame(
	ID integer PRIMARY KEY,
	gameID integer REFERENCES Game(ID),
	propertiesID integer REFERENCES Properties(ID),
	playerID integer REFERENCES Player(ID),
	houses integer,
	mortgaged boolean
);



-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Properties TO PUBLIC;
GRANT SELECT ON PropertyGame TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00', TRUE);
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00', TRUE);
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00', TRUE);
INSERT INTO Game VALUES (4, '2019-10-18 18:41:00', FALSE);

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Properties VALUES(1,'Go', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Properties VALUES(2, 'Mediterranean Avenue','brown',60,2,10, 30,90, 160,250,50);
INSERT INTO Properties VALUES(3, 'St. Charles Place', 'pink', 140, 10, 50, 150,450,625,750, 100);
INSERT INTO Properties VALUES(4, 'Chance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO PlayerGame VALUES (1, 1, 0,0,1);
INSERT INTO PlayerGame VALUES (1, 2, 0,0,2);
INSERT INTO PlayerGame VALUES (1, 3, 2350, 100, 3);
INSERT INTO PlayerGame VALUES (2, 1, 1000, 0,4);
INSERT INTO PlayerGame VALUES (2, 2, 0,0,4);
INSERT INTO PlayerGame VALUES (2, 3, 500,0,3);
INSERT INTO PlayerGame VALUES (3, 2, 0,0,2);
INSERT INTO PlayerGame VALUES (3, 3, 5500,0,1);



INSERT INTO PropertyGame VALUES(1, 4,4,1,2, FALSE);
INSERT INTO PropertyGame VALUES(2,4,2,2,1, FALSE);
INSERT INTO PropertyGame VALUES(3,4,3,3,2,FALSE);
INSERT INTO PropertyGame VALUES(4,4,3,2,1,FALSE);
