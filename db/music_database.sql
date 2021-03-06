DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  artist_id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE albums (
  album_id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(artist_id) -- Foreign Key
);