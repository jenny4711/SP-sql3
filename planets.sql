DROP DATABASE IF EXISTS planets;

CREATE DATABASE planets;

\c planets;


CREATE TABLE orbits_around (
  id SERIAL PRIMARY KEY,
  orbits_around_name TEXT NOT NULL
);

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE moon (
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL
);

CREATE TABLE planet (
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_perid_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER REFERENCES orbits_around ON DELETE CASCADE,
  galaxy_id INTEGER REFERENCES galaxy ON DELETE CASCADE,
  moon1_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon2_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon3_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon4_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon5_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon6_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon7_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon8_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon9_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon10_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon11_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon12_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon13_id INTEGER REFERENCES moon ON DELETE CASCADE,
  moon14_id INTEGER REFERENCES moon ON DELETE CASCADE
  
);

-- ALTER TABLE orbits_around ADD FOREIGN KEY (id) REFERENCES planet (orbits_around);

-- ALTER TABLE galaxy ADD FOREIGN KEY (id) REFERENCES planet (galaxy);

-- ALTER TABLE moon ADD FOREIGN KEY (id) REFERENCES planet (moon);

-- ALTER TABLE moon ADD FOREIGN KEY (id) REFERENCES planet (moon1);

-- ALTER TABLE moon ADD FOREIGN KEY (id) REFERENCES planet (moon2);

-- ALTER TABLE moon ADD FOREIGN KEY (id) REFERENCES planet (moon3);

-- ALTER TABLE moon ADD FOREIGN KEY (id) REFERENCES planet (moon4);

-- ALTER TABLE moon ADD FOREIGN KEY (id) REFERENCES planet (moon5);

INSERT INTO orbits_around
(orbits_around_name)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');


INSERT INTO galaxy
(galaxy_name)
VALUES
('Milky Way');


INSERT INTO moon
(moon_name)
VALUES
('The Moon'),('Phobos'),
('Naiad'),('Thalassa'),
('Despina'),('Galatea'),
('Larissa'),('S/2004 N 1'),
('Proteus'),('Triton'),
('Nereid'),('Halimede'),
('Sao'),('Laomedeia'),
('Psamathe'),('Neso'),('Deimmos');


INSERT INTO planet
(planet_name,orbital_perid_in_years,orbits_around_id,galaxy_id,
moon1_id,moon2_id,moon3_id,moon4_id,moon5_id,moon6_id,moon7_id,
moon8_id,moon9_id,moon10_id,moon11_id,moon12_id,moon13_id,moon14_id)
VALUES
  ('Earth', 1.00, 1, 1, 1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  ('Mars', 1.88, 1, 1, 2, 17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  ('Venus', 0.62, 1, 1, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  ('Neptune', 164.8, 1, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16),
  ('Proxima Centauri b', 0.03, 2, 1, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  ('Gliese 876 b', 0.23, 3, 1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

select planet_name,orbital_perid_in_years,orbits_around_name,galaxy_name,
m1.moon_name AS moon1,m2.moon_name AS moon2,m3.moon_name AS moon3,m4.moon_name AS moon4,
m5.moon_name AS moon5,m6.moon_name AS moon6,m7.moon_name AS moon7,m8.moon_name AS moon8,
m9.moon_name AS moon9,m10.moon_name AS moon10,m11.moon_name AS moon11,m12.moon_name AS moon12,
m13.moon_name AS moon13,m14.moon_name AS moon14
from planet
left join moon m1 on planet.moon1_id = m1.id
left join moon m2 on planet.moon2_id=m2.id
left join moon m3 on planet.moon3_id=m3.id
left join moon m4 on planet.moon4_id=m4.id
left join moon m5 on planet.moon5_id=m5.id
left join moon m6 on planet.moon6_id=m6.id
left join moon m7 on planet.moon7_id=m7.id
left join moon m8 on planet.moon8_id=m8.id
left join moon m9 on planet.moon9_id=m9.id
left join moon m10 on planet.moon10_id=m10.id
left join moon m11 on planet.moon11_id=m11.id
left join moon m12 on planet.moon12_id=m12.id
left join moon m13 on planet.moon13_id=m13.id
left join moon m14 on planet.moon14_id=m14.id
left join orbits_around on planet.orbits_around_id = orbits_around.id
left join galaxy on planet.galaxy_id = galaxy.id;
