DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE area (
  id SERIAL PRIMARY KEY,
  area_name TEXT NOT NULL
);


CREATE TABLE player (
  id SERIAL PRIMARY KEY,
  player_name TEXT NOT NULL,
  area_id INTEGER REFERENCES area ON DELETE CASCADE
);



CREATE TABLE team (
  id SERIAL PRIMARY KEY,
  team_name TEXT NOT NULL,
  area_id INTEGER REFERENCES area ON DELETE CASCADE,
  player_id INTEGER REFERENCES player ON DELETE CASCADE
);



CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  team1_id INTEGER REFERENCES team ON DELETE CASCADE,
  team2_id INTEGER REFERENCES team ON DELETE CASCADE,
  match_date TEXT NOT NULL,
  match_time TEXT NOT NULL
);



CREATE TABLE goal (
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES team ON DELETE CASCADE,
  matches_id INTEGER REFERENCES matches ON DELETE CASCADE,
  player_id INTEGER REFERENCES player ON DELETE CASCADE
);


CREATE TABLE winner (
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES team ON DELETE CASCADE,
  goal_id INTEGER REFERENCES goal ON DELETE CASCADE
);

CREATE TABLE detail(
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES team ON DELETE CASCADE,
  player_id INTEGER REFERENCES player ON DELETE CASCADE,
  matches_id INTEGER REFERENCES matches ON DELETE CASCADE,
  goal_id INTEGER REFERENCES goal ON DELETE CASCADE,
  winner_id INTEGER REFERENCES winner ON DELETE CASCADE
);


INSERT INTO area
(area_name)
VALUES
('Portugal'),
('Ghana'),
('Uruguay'),
('Korea Republic');

INSERT INTO player
(player_name,area_id)
VALUES
('Kudus Mohammed',2),
('Bruno Fernandes',1),
('Rodrigo',3),
('Son Heung-min',4);
;

INSERT INTO team
(team_name,area_id,player_id)
VALUES
('POR',1,2),
('GHA',2,1),
('URU',3,3),
('KOR',4,4);

INSERT INTO matches
(team1_id,team2_id,match_date,match_time)
VALUES
(4,3,'11/24/22','EST 8:00AM'),
(4,2,'11/28/22','EST 8:00AM'),
(4,1,'12/3/22','EST 10:00AM');

INSERT INTO goal
(team_id,matches_id,player_id)
VALUES
(1,1,2),
(4,1,4),
(2,2,1);

INSERT INTO winner
(team_id,goal_id)
VALUES
(1,2);


INSERT INTO detail
(team_id,player_id,matches_id,goal_id,winner_id)
VALUES
(1,1,1,1,1),
(2,2,2,2,NULL),
(3,3,3,3,NULL),
(4,4,NULL,NULL,NULL);







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

select player_name,a.team_name AS team1 ,b.team_name AS team2,
match_date,match_time,c.team_name AS goal,
d.team_name AS winner_team from detail
left join matches on detail.matches_id = matches.id
left join team a on a.id = matches.team1_id
left join team b on b.id = matches.team2_id
left join player on player.id = detail.player_id
left join goal on goal.id = detail.goal_id
left join team c on c.id = goal.team_id
left join winner on winner.id = detail.winner_id
left join team d on winner.team_id = d.id;
