CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
  id SERIAL PRIMARY KEY,
  name TEXT,
  image_url TEXT
);

INSERT INTO dishes (name, image_url) VALUES ('cake', 'https://www.melskitchencafe.com/wp-content/uploads/2011/02/Chocolate-Pudding.jpg');
INSERT INTO dishes (name, image_url) VALUES ('pudding', 'https://www.melskitchencafe.com/wp-content/uploads/2011/02/Chocolate-Pudding.jpg');
INSERT INTO dishes (name, image_url) VALUES ('cake pudding', 'https://www.melskitchencafe.com/wp-content/uploads/2011/02/Chocolate-Pudding.jpg');