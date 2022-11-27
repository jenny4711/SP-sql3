DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE area (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE user (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  area_id INTEGER REFERENCES area ON DELETE CASCADE
);

CREATE TABLE "categories" (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE "posts" (
  id SERIAL PRIMARY KEY,
  username_id INTEGER REFERENCES username ON DELETE CASCADE,
  area_id INTEGER REFERENCES area ON DELETE CASCADE,
  title TEXT,
  memo TEXT,
  categories_id INTEGER REFERENCES categories ON DELETE CASCADE
);

-- ALTER TABLE "user" ADD FOREIGN KEY ("id") REFERENCES "posts" ("username");

-- ALTER TABLE "area" ADD FOREIGN KEY ("id") REFERENCES "posts" ("area");

-- ALTER TABLE "categories" ADD FOREIGN KEY ("id") REFERENCES "posts" ("categories");

-- ALTER TABLE "area" ADD FOREIGN KEY ("name") REFERENCES "user" ("area");
