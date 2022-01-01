-- CREATE DATABASE Tournament;

--A table to hold the id and name of the stadium
CREATE TABLE Stadiums (
  st_id BIGSERIAL PRIMARY KEY,
  --Two stadiums cannot have the same name
  st_name varchar(50) NOT NULL UNIQUE
);

--A table for the names of the teams
CREATE TABLE Teams(
    team_id BIGSERIAL PRIMARY KEY,
    --Two teams cannot have the same name
    team_name varchar(50) NOT NULL UNIQUE
);

--A table for the department name
CREATE TABLE Departments(
  dept_id BIGSERIAL PRIMARY KEY,
  --Two departments cannot have the same name
  dept_name varchar(50) NOT NULL UNIQUE
);

--A table for the data of a game
CREATE TABLE Games(
    game_id BIGSERIAL PRIMARY KEY,
    game_datetime TIMESTAMP NOT NULL,
    st_id int REFERENCES Stadiums(st_id)NOT NULL,
    home_team_id bigint REFERENCES teams(team_id) NOT NULL,
    away_team_id bigint REFERENCES teams(team_id) NOT NULL,
    home_goals int NOT NULL,
    away_goals int NOT NULL
    CHECK ( home_team_id <> away_team_id )
    CHECK (home_goals >= 0),
    CHECK (away_goals >= 0)
);


--A table for the Players data
CREATE TABLE Players(
    player_id BIGSERIAL NOT NULL PRIMARY KEY,
    student_id int NOT NULL UNIQUE ,
    player_first_name varchar(50) NOT NULL,
    player_last_name varchar(50) NOT NULL,
    team_id bigint REFERENCES Teams(team_id) NOT NULL,
    dept_id bigint REFERENCES Departments(dept_id) NOT NULL
);

--A table for the scorers data
CREATE TABLE Scorers(
    game_id bigint REFERENCES Games(game_id) NOT NULL,
    player_id bigint REFERENCES Players(player_id) NOT NULL
);



--st_id 1
INSERT INTO Stadiums (st_name) VALUES ('Sportspark pitch 1');
--st_id 2
INSERT INTO Stadiums (st_name) VALUES ('Sportspark pitch 2');
--st_id 3
INSERT INTO Stadiums (st_name) VALUES ('Sportspark pitch 3');

--team_id 1
INSERT INTO Teams (team_name) VALUES ('Andreski');
--team_id 2
INSERT INTO Teams (team_name) VALUES ('Colquhoun');
--team_id 3
INSERT INTO Teams (team_name) VALUES ('Cottingham');
--team_id 4
INSERT INTO Teams (team_name) VALUES ('Fulford');

--dept_id 1
INSERT INTO Departments (dept_name) VALUES ('Computer Science');
--dept_id 2
INSERT INTO Departments (dept_name) VALUES ('Chemistry');
--dept_id 3
INSERT INTO Departments (dept_name) VALUES ('Meteorology');
--dept_id 4
INSERT INTO Departments (dept_name) VALUES ('Pharmacy');
--dept_id 5
INSERT INTO Departments (dept_name) VALUES ('Agriculture');
--dept_id 6
INSERT INTO Departments (dept_name) VALUES ('Biological Science');
--dept_id 7
INSERT INTO Departments (dept_name) VALUES ('Law');
--dept_id 8
INSERT INTO Departments (dept_name) VALUES ('Humanities');

--game_id 1
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-10-1 16:00:00',1,1,2,2,0);
--game_id 2
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-10-1 16:00:00',2,3,4,1,1);
--game_id 3
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-10-8 16:00:00',2,1,3,2,1);
--game_id 4
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-10-8 16:00:00',3,2,4,2,1);
--game_id 5
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-10-22 16:00:00',3,1,4,0,0);
--game_id 6
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-10-22 16:00:00',2,2,3,1,2);
--game_id 7
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-10-29 16:00:00',1,2,1,2,2);
--game_id 8
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-10-29 16:00:00',3,4,3,1,2);
--game_id 9
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-11-5 16:00:00',3,3,1,3,2);
--game_id 10
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-11-5 16:00:00',1,4,2,0,1);
--game_id 11
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-11-12 16:00:00',2,4,1,2,0);
--game_id 12
INSERT INTO Games (game_datetime, st_id, home_team_id, away_team_id,home_goals,away_goals) VALUES ('2018-11-12 16:00:00',3,3,2,2,2);

--player_id 1
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (101,'Louis','Long',1,1);
--player_id 2
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (102,'Terry','Brooks',1,3);
--player_id 3
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (103,'Ronald','Scott',1,6);
--player_id 4
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (104,'Jeremy','Adams',1,4);
--player_id 5
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (105,'Fred','Taylor',1,2);
--player_id 6
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (106,'Douglas','Patterson',1,6);
--player_id 7
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (107,'Andrew','Wright',1,7);
--player_id 8
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (108,'Eric','Miller',1,8);
--player_id 9
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (109,'Matthew','Ramirez',1,7);
--player_id 10
INSERT INTO Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (110,'Patric','Walker',1,7);
--player_id 11
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (111,'Todd','White',2,2);
--player_id 12
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (112,'William','Wilson',2,5);
--player_id 13
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (113,'Bobby','Robinson',2,1);
--player_id 14
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (114,'Jose','Watson',2,7);
--player_id 15
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (115,'Thomas','Morgan',2,7);
--player_id 16
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (116,'Wayne','Smith',2,4);
--player_id 17
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (117,'Carlos','Davis',2,6);
--player_id 18
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (118,'Peter','Carter',2,5);
--player_id 19
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (119,'Roger','Butler',2,8);
--player_id 20
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (120,'Adam','Mitchel',2,8);
--player_id 21
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (121,'Aaron','Perry',3,2);
--player_id 22
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (122,'Benjamin','Hughes',3,8);
--player_id 23
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (123,'Jerry','Gonzales',3,2);
--player_id 24
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (124,'Ernest','Nelson',3,5);
--player_id 25
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (125,'John','Brown',3,8);
--player_id 26
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (126,'Edward','Gray',3,4);
--player_id 27
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (127,'Keith','Evans',3,3);
--player_id 28
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (128,'Joshua','Coleman',3,8);
--player_id 29
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (129,'Jonathan','Moore',3,6);
--player_id 30
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (130,'Gary','Washington',3,8);
--player_id 31
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (131,'Gerald','Cook',4,5);
--player_id 32
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (132,'Donald','Roberts',4,3);
--player_id 33
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (133,'Dennis','Henderson',4,6);
--player_id 34
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (134,'Michael','Jones',4,8);
--player_id 35
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (135,'Chris','Cox',4,4);
--player_id 36
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (136,'Anthony','Baker',4,4);
--player_id 37
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (137,'Clarence','Perez',4,5);
--player_id 38
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (138,'Steve','Peterson',4,2);
--player_id 39
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (139,'Craig','Johnson',4,6);
--player_id 40
INSERT INTO  Players (student_id, player_first_name, player_last_name, team_id, dept_id) VALUES (140,'Paul','Jenkis',4,6);

INSERT INTO Scorers(game_id, player_id) VALUES (1,8);
INSERT INTO Scorers(game_id, player_id) VALUES (1,7);
INSERT INTO Scorers(game_id, player_id) VALUES (2,27);
INSERT INTO Scorers(game_id, player_id) VALUES (2,35);
INSERT INTO Scorers(game_id, player_id) VALUES (3,8);
INSERT INTO Scorers(game_id, player_id) VALUES (3,8);
INSERT INTO Scorers(game_id, player_id) VALUES (3,27);
INSERT INTO Scorers(game_id, player_id) VALUES (4,19);
INSERT INTO Scorers(game_id, player_id) VALUES (4,17);
INSERT INTO Scorers(game_id, player_id) VALUES (4,35);
INSERT INTO Scorers(game_id, player_id) VALUES (6,19);
INSERT INTO Scorers(game_id, player_id) VALUES (6,28);
INSERT INTO Scorers(game_id, player_id) VALUES (6,27);
INSERT INTO Scorers(game_id, player_id) VALUES (7,19);
INSERT INTO Scorers(game_id, player_id) VALUES (7,16);
INSERT INTO Scorers(game_id, player_id) VALUES (7,8);
INSERT INTO Scorers(game_id, player_id) VALUES (7,3);
INSERT INTO Scorers(game_id, player_id) VALUES (8,35);
INSERT INTO Scorers(game_id, player_id) VALUES (8,25);
INSERT INTO Scorers(game_id, player_id) VALUES (8,27);
INSERT INTO Scorers(game_id, player_id) VALUES (9,29);
INSERT INTO Scorers(game_id, player_id) VALUES (9,29);
INSERT INTO Scorers(game_id, player_id) VALUES (9,26);
INSERT INTO Scorers(game_id, player_id) VALUES (9,7);
INSERT INTO Scorers(game_id, player_id) VALUES (9,8);
INSERT INTO Scorers(game_id, player_id) VALUES (10,19);
INSERT INTO Scorers(game_id, player_id) VALUES (11,35);
INSERT INTO Scorers(game_id, player_id) VALUES (11,37);
INSERT INTO Scorers(game_id, player_id) VALUES (12,26);
INSERT INTO Scorers(game_id, player_id) VALUES (12,25);
INSERT INTO Scorers(game_id, player_id) VALUES (12,19);
INSERT INTO Scorers(game_id, player_id) VALUES (12,18);





-- DROP TABLE scorers;
-- DROP TABLE players;
-- DROP TABLE games;
-- DROP TABLE departments;
-- DROP TABLE stadiums;
-- DROP TABLE teams;