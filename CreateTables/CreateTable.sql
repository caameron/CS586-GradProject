

CREATE TABLE Player (
  Player_id SERIAL PRIMARY KEY,
  name VARCHAR(60),
  height INT,
  weight INT,
  year_start INT,
  year_end INT,
  DOB DATE,
  college_id INT references college(college_id)
);


CREATE TABLE staging (
  name VARCHAR(60) PRIMARY KEY,
  height INT,
  weight INT,
  year_start INT,
  year_end INT,
  DOB DATE,
  college VARCHAR(60),
  position VARCHAR(60)
);

CREATE TABLE staging_two (
  name VARCHAR(60) PRIMARY KEY,
  year INT,
  team VARCHAR(60),
  games INT,
  games_started INT,
  minutes_played INT,
  field_goals INT,
  field_goal_attempts INT,
  three_point INT,
  three_point_attempts INT,
  rebounds INT,
  assists INT,
  steals INT,
  blocks INT,
  points INT
);

CREATE TABLE college (
  College_id SERIAL PRIMARY KEY,
  name VARCHAR(60)
);

CREATE TABLE position (
  Position_id SERIAL PRIMARY KEY,
  position VARCHAR(60), 
  abbreviation VARCHAR(60)
);

CREATE TABLE PositionPlayed (
  Player_id INT references player(player_id),
  position_id INT references position(position_id),
  PRIMARY KEY (Player_id, position_id)
);

CREATE TABLE team (
  Team_id SERIAL PRIMARY KEY,
  abbreviation VARCHAR(60), 
  name VARCHAR(60)
);

CREATE TABLE Played_For (
  Player_id INT references player(player_id),
  team_id INT references team(team_id),
  position_id INT references position(position_id),
  PRIMARY KEY (Player_id, team_id,position_id)
);

CREATE TABLE Season (
  Season_id SERIAL PRIMARY KEY,
  year INT
);

CREATE TABLE Played_In (
  Player_id INT references player(player_id),
  season_id INT references season(season_id),
  games INT,
  games_started INT,
  minutes_played INT,
  field_goals INT,
  field_goal_attempts INT,
  three_point INT,
  three_point_attempts INT,
  rebounds INT,
  assists INT,
  steals INT,
  blocks INT,
  points INT,
  PRIMARY KEY (Player_id, season_id)
);

CREATE TABLE Season_team (
  Player_id INT references player(player_id),
  team_id INT references team(team_id),
  season_id INT references season(season_id),
  games INT,
  games_started INT,
  minutes_played INT,
  field_goals INT,
  field_goal_attempts INT,
  three_point INT,
  three_point_attempts INT,
  rebounds INT,
  assists INT,
  steals INT,
  blocks INT,
  points INT,
  PRIMARY KEY (Player_id, team_id, season_id)
);

/* INSERT STATEMENTS FOR LOADING DATA AFTER THIS POINT */
INSERT INTO staging(name, height, weight, year_start, year_end, dob, college, position) VALUES
('Alex Abrines',78,190,2017,2018,'08/01/1993','', 'G-F');

/* Statement used to parse data in excel sheet into sql 
="('"&A2&"',"&K2&","&F2&","&B2&","&C2&",'"&TEXT(G2, "MM/DD/YYYY")&"','"&H2&"', '"&D2&"'),"
*/

INSERT INTO staging_two(name, year, team, games, games_started, minutes_played, field_goals, field_goal_attempts, three_point, three_point_attempts, rebounds, assists, steals, blocks, points)
VALUES
('Alex Abrines',2017,'OKC',68,6,1055,134,341,94,247,86,40,37,8,406),

/* Statement used to parse data in excel sheet into sql 
="('"&C2&"',"&B2&",'"&F2&"',"&G2&","&H2&","&I2&","&AF2&","&AG2&","&AI2&","&AJ2&","&AU2&","&AV2&","&AW2&","&AX2&","&BA2&"),"
*/

INSERT INTO player (name, height, weight, year_start, year_end, dob, college_id)
SELECT S.name, S.height, S.weight, S.year_start, S.year_end, S.dob, C.college_id
  FROM staging S JOIN college C ON S.college = C.name


INSERT INTO college (name)
SELECT DISTINCT S.college
  FROM staging S

INSERT INTO position (position, abbreviation)
VALUES ('Guard', 'G'),
('Forward', 'F'),
('Center', 'C')

//For guard
INSERT INTO positionPlayed (player_id, position_id)
  SELECT P.player_id, 1
FROM player P JOIN Staging S ON P.name = S.name
WHERE position LIKE '%G%'

//For forward
INSERT INTO positionPlayed (player_id, position_id)
  SELECT P.player_id, 2
FROM player P JOIN Staging S ON P.name = S.name
WHERE position LIKE '%F%'

//For center
INSERT INTO positionPlayed (player_id, position_id)
  SELECT P.player_id, 3
FROM player P JOIN Staging S ON P.name = S.name
WHERE position LIKE '%C%'

//Unfortunately had to manually enter in the names of the teams, the dataset only had their abbreviations
INSERT INTO team (name, city)
VALUES ('DEN', 'Nuggets'),
('CHI', 'Bulls'),
('HOU', 'Rockets'),
('IND', 'Pacers'),
('GSW', 'Warriors'),
('BOS', 'Celtics'),
('LAC', 'Clippers'),
('BRK', 'Nets'),
('ATL', 'Hawks'),
('CLE', 'Cavaliers'),
('POR', 'Trail Blazers'),
('NOP', 'Pelicans'),
('DAL', 'Mavericks'),
('TOT', 'Total'),
('SAC', 'Kings'),
('MIL', 'Bucks'),
('WAS', 'Wizards'),
('NJN', 'Nets'),
('NOH', 'Hornets'),
('LAL', 'Lakers'),
('TOR', 'Raptors'),
('SAS', 'Spurs'),
('OKC', 'Thunder'),
('CHO', 'Hornets'),
('PHO', 'Suns'),
('CHA', 'Hornets'),
('MIN', 'Timberwolves'),
('NYK', 'Knicks'),
('MEM', 'Grizzlies'),
('ORL', 'Magic'),
('PHI', '76ers'),
('MIA', 'Heat'),
('UTA', 'Jazz'),
('DET', 'Pistons');

INSERT INTO played_for (player_id, team_id, position_id)
  SELECT DISTINCT P.player_id, T.team_id, PO.position_id
FROM player P JOIN Staging_two S ON P.name = S.name
              JOIN team T ON T.abbreviation = S.team
              JOIN positionplayed PO ON PO.player_id = P.player_id


INSERT INTO season (year)
SELECT DISTINCT S.year
  FROM staging_two S


INSERT INTO played_in (player_id, season_id, games, games_started, minutes_played, field_goals, field_goal_attempts, three_point, three_point_attempts, rebounds, assists, steals, blocks, points)
  SELECT P.player_id, S.season_id, SUM(ST.games), SUM(ST.games_started), SUM(ST.minutes_played), SUM(ST.field_goals), SUM(ST.field_goal_attempts), SUM(ST.three_point), SUM(ST.three_point_attempts), SUM(ST.rebounds), SUM(ST.assists), SUM(ST.steals), SUM(ST.blocks), SUM(ST.points)
FROM player P JOIN Staging_two ST ON P.name = ST.name
              JOIN season S ON S.year = ST.year
WHERE team <> 'TOT'
GROUP BY player_id, season_id

INSERT INTO season_team (player_id, team_id, season_id, games, games_started, minutes_played, field_goals, field_goal_attempts, three_point, three_point_attempts, rebounds, assists, steals, blocks, points)
  SELECT P.player_id, T.team_id, S.season_id, ST.games, ST.games_started, ST.minutes_played, ST.field_goals, ST.field_goal_attempts, ST.three_point, ST.three_point_attempts, ST.rebounds, ST.assists, ST.steals, ST.blocks, ST.points
FROM player P JOIN Staging_two ST ON P.name = ST.name
              JOIN season S ON S.year = ST.year
              JOIN team T ON T.abbreviation = ST.team
WHERE team <> 'TOT'
