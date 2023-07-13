DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Albums;

CREATE TABLE Item (
  id INT GENERATED ALWAYS AS IDENTITY,
  archived BOOLEAN,
  PRIMARY KEY (id)
);

CREATE TABLE Genre (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Albums (
  id INT PRIMARY KEY,
  genre_id INT,
  publish_date DATE,
  on_spotify BOOLEAN,
  FOREIGN KEY (id) REFERENCES Item(id),
  FOREIGN KEY (genre_id) REFERENCES Genre(id)
);
