DROP DATABASE IF EXISTS airline;

CREATE DATABASE airline;

\c airline;


CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airline ON DELETE CASCADE,
  from_city_id INTEGER REFERENCES city ON DELETE CASCADE,
  from_country_id INTEGER REFERENCES country ON DELETE CASCADE,
  to_city_id INTEGER REFERENCES city ON DELETE CASCADE,
  to_country_id INTEGER REFERENCES country ON DELETE CASCADE
);

CREATE TABLE city 
(
  id  SERIAL PRIMARY KEY,
  city_name TEXT,
  country_id INTEGER REFERENCES city ON DELETE CASCADE
);

CREATE TABLE country 
(
  id SERIAL PRIMARY KEY,
  country_name TEXT 
);

CREATE TABLE airline 
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT 
);



-- ALTER TABLE airline ADD FOREIGN KEY (id) REFERENCES tickets (airline_id);

-- ALTER TABLE city ADD FOREIGN KEY (id) REFERENCES tickets (from_city_id);

-- ALTER TABLE country ADD FOREIGN KEY (id) REFERENCES tickets (from_country_id);

-- ALTER TABLE city ADD FOREIGN KEY (id) REFERENCES tickets (to_city_id);

-- ALTER TABLE country ADD FOREIGN KEY (id) REFERENCES tickets (to_country_id);

-- ALTER TABLE country ADD FOREIGN KEY (id) REFERENCES city (country_id);

INSERT INTO country
  (country_name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('United Kingdom'),
  ('Chile');

INSERT INTO city
  (city_name, country_id)
VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('Los Angeles', 1),
  ('Seattle', 1),
  ('Paris', 3),
  ('Dubai', 4),
  ('New York', 1),
  ('Cedar Rapids', 1),
  ('Charlotte', 1),
  ('Sao Paolo', 5),
  ('Santiago', 10),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Beijing', 8),
  ('Casablanca', 7),
  ('Mexico City', 6),
  ('London', 9),
  ('Las Vegas', 1);

INSERT INTO airline
(airline_name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO tickets
(first_name,last_name,seat,departure,arrival,airline_id,
from_city_id,from_country_id,to_city_id,to_country_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 4, 1),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2, 17, 9),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 1, 18, 1),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 1, 16, 6),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 3, 15, 7),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 4, 14, 8),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 1, 9, 1),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 1, 12, 1),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 1, 13, 1),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 5, 11, 10);


select first_name,last_name,seat,departure,arrival,airline_name,
fci.city_name AS from_city_name, fcu.country_name AS from_country_name,
tci.city_name AS to_city_name, tcu.country_name AS to_country_name
from tickets
join city fci on tickets.from_city_id = fci.id
join city tci on tickets.to_city_id =tci.id
join country fcu on tickets.from_country_id = fcu.id
join country tcu on tickets.to_country_id=tcu.id
join airline on tickets.airline_id = airline.id;