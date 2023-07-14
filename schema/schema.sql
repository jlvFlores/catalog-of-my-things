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

CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  publisher VARCHAR(60) NOT NULL,
  cover_state VARCHAR(60) NOT NULL
)

CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(60) NOT NULL,
  color VARCHAR(60) NOT NULL
)

CREATE TABLE items_labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  label_id INT REFERENCES labels (id)
)

