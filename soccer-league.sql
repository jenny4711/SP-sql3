DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE areas (
  id SERIAL PRIMARY KEY,
  area_name TEXT NOT NULL

);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name TEXT NOT NULL,
  area_id INTEGER REFERENCES areas ON DELETE CASCADE
  
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  player_name TEXT NOT NULL,
  team_id INTEGER REFERENCES teams ON DELETE CASCADE
);



CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  team1_id INTEGER REFERENCES teams ON DELETE CASCADE,
  team2_id INTEGER REFERENCES teams ON DELETE CASCADE,
  match_date TEXT NOT NULL,
  match_time TEXT NOT NULL
);


CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  match_id INTEGER REFERENCES matches ON DELETE CASCADE,
  player_id INTEGER REFERENCES players ON DELETE CASCADE
);



CREATE TABLE results(
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams ON DELETE CASCADE,
  match_id INTEGER REFERENCES matches ON DELETE CASCADE,
  result TEXT NOT NULL
);




INSERT INTO areas
(area_name)
VALUES
('Portugal'),
('Ghana'),
('Uruguay'),
('Korea Republic');

INSERT INTO teams
(team_name,area_id)
VALUES
('POR',1),
('GHA',2),
('URU',3),
('KOR',4);



INSERT INTO players
(player_name,team_id)
VALUES
('Kudus Mohammed',2),
('Bruno Fernandes',1),
('Rodrigo',3),
('Son Heung-min',4);




INSERT INTO matches
(team1_id,team2_id,match_date,match_time)
VALUES
(4,3,'11/24/22','EST 8:00AM'),
(4,2,'11/28/22','EST 8:00AM'),
(4,1,'12/3/22','EST 10:00AM');

INSERT INTO goals
(match_id,player_id)
VALUES
(1,2),
(1,4),
(2,1);



INSERT INTO results
(team_id,match_id,result)
VALUES
(1,1,'Win'),
(1,2,'lose'),
(2,1,'lose'),
(2,3,'lose'),
(3,3,'Win'),
(3,2,'Win');










-- ALTER TABLE "team" ADD FOREIGN KEY ("id") REFERENCES "matches" ("team1");

-- ALTER TABLE "team" ADD FOREIGN KEY ("id") REFERENCES "matches" ("team2");

-- ALTER TABLE "team" ADD FOREIGN KEY ("id") REFERENCES "winner" ("team");

-- ALTER TABLE "goal" ADD FOREIGN KEY ("id") REFERENCES "winner" ("goal");

-- ALTER TABLE "team" ADD FOREIGN KEY ("id") REFERENCES "goal" ("team");

-- ALTER TABLE "area" ADD FOREIGN KEY ("id") REFERENCES "player" ("area");

-- ALTER TABLE "matches" ADD FOREIGN KEY ("id") REFERENCES "goal" ("matches");

-- ALTER TABLE "player" ADD FOREIGN KEY ("id") REFERENCES "goal" ("player");

-- ALTER TABLE "area" ADD FOREIGN KEY ("id") REFERENCES "team" ("area");

-- ALTER TABLE "player" ADD FOREIGN KEY ("id") REFERENCES "team" ("player");

-- ALTER TABLE "matches" ADD FOREIGN KEY ("id") REFERENCES "winner" ("matches");

select a.team_name,b.team_name,match_date,match_time,result 
from results
join matches m on m.id = results.match_id
join teams a on a.id = m.team1_id
join teams b on b.id =m.team2_id 
