DROP DATABASE IF EXISTS songs;

CREATE DATABASE songs;

\c songs;


CREATE TABLE artist (
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE album (
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  producers_name TEXT NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist1_id INTEGER REFERENCES artist ON DELETE CASCADE,
  artist2_id INTEGER REFERENCES artist ON DELETE CASCADE,
  album_id INTEGER REFERENCES album ON DELETE CASCADE,
  producers1_id INTEGER REFERENCES producers ON DELETE CASCADE,
  producers2_id INTEGER REFERENCES producers ON DELETE CASCADE
  
);

-- ALTER TABLE "artist" ADD FOREIGN KEY ("id") REFERENCES "songs" ("artist");

-- ALTER TABLE "album" ADD FOREIGN KEY ("id") REFERENCES "songs" ("album");

-- ALTER TABLE "producers" ADD FOREIGN KEY ("id") REFERENCES "songs" ("producers1");

-- ALTER TABLE "producers" ADD FOREIGN KEY ("id") REFERENCES "songs" ("producers2");
INSERT INTO artist
(artist_name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avrill Lavigne'),
('Destiny"s Child');

INSERT INTO album
(album_name)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing"s on the Wall');

INSERT INTO producers
(producers_name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benney Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs
(title,duration_in_seconds,
release_date,artist1_id,artist2_id,
album_id,producers1_id,producers2_id)
VALUES
  ('MMMBop', 238, '04-15-1997',1,NULL,1,1, 2),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2,NULL ,2, 3,NULL),
  ('One Sweet Day', 282, '11-14-1995',3, 4 , 3,4,NULL),
  ('Shallow', 216, '09-27-2018',5, 6 ,4,5,NULL),
  ('How You Remind Me', 223, '08-21-2001', 7,NULL ,5,6,NULL),
  ('New York State of Mind', 276, '10-20-2009', 8, 9, 6, 7,NULL),
  ('Dark Horse', 215, '12-17-2013', 10, 11, 7,8, 9),
  ('Moves Like Jagger', 201, '06-21-2011', 12, 13, 8,12, 13),
  ('Complicated', 244, '05-14-2002', 14,NULL,9, 10,NULL),
  ('Say My Name', 240, '11-07-1999', 15,NULL, 10, 11,NULL);


select title,duration_in_seconds,release_date,
a.artist_name AS artist1,b.artist_name AS artist2,album_name,
c.producers_name AS producer1,d.producers_name AS producer2
from songs
left join artist a on songs.artist1_id = a.id
left join artist b on songs.artist2_id = b.id
left join producers c on songs.producers1_id =c.id
left join producers d on songs.producers2_id=d.id
left join album on songs.album_id=album.id;