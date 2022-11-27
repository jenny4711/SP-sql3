CREATE TABLE "team" (
  "id" integer PRIMARY KEY,
  "name" text,
  "area" integer,
  "player" integer
);

CREATE TABLE "player" (
  "id" integer PRIMARY KEY,
  "name" text,
  "area" integer
);

CREATE TABLE "area" (
  "id" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE "matches" (
  "id" integer PRIMARY KEY,
  "team1" integer,
  "team2" integer,
  "match_date" integer,
  "match_time" integer
);

CREATE TABLE "goal" (
  "id" integer PRIMARY KEY,
  "team" integer,
  "matches" integer,
  "player" integer
);

CREATE TABLE "winner" (
  "matches" integer,
  "team" integer,
  "goal" integer
);

ALTER TABLE "team" ADD FOREIGN KEY ("id") REFERENCES "matches" ("team1");

ALTER TABLE "team" ADD FOREIGN KEY ("id") REFERENCES "matches" ("team2");

ALTER TABLE "team" ADD FOREIGN KEY ("id") REFERENCES "winner" ("team");

ALTER TABLE "goal" ADD FOREIGN KEY ("id") REFERENCES "winner" ("goal");

ALTER TABLE "team" ADD FOREIGN KEY ("id") REFERENCES "goal" ("team");

ALTER TABLE "area" ADD FOREIGN KEY ("id") REFERENCES "player" ("area");

ALTER TABLE "matches" ADD FOREIGN KEY ("id") REFERENCES "goal" ("matches");

ALTER TABLE "player" ADD FOREIGN KEY ("id") REFERENCES "goal" ("player");

ALTER TABLE "area" ADD FOREIGN KEY ("id") REFERENCES "team" ("area");

ALTER TABLE "player" ADD FOREIGN KEY ("id") REFERENCES "team" ("player");

ALTER TABLE "matches" ADD FOREIGN KEY ("id") REFERENCES "winner" ("matches");
