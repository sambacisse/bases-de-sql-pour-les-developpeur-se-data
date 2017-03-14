@@ -1,44 +0,0 @@
CREATE TABLE films (
  id                    INTEGER     PRIMARY KEY,
  title                 VARCHAR,
  release_year          INTEGER,
  duration              INTEGER,
  gross                 INTEGER,
  country               VARCHAR,
  certification         VARCHAR,
  language              VARCHAR,
  review_id             INTEGER,
  color                 VARCHAR
);

CREATE TABLE people (
  id                    INTEGER     PRIMARY KEY,
  name                  VARCHAR,
  dob                   DATE,
  dod                   DATE
);

CREATE TABLE reviews (
  id                    INTEGER     PRIMARY KEY,
  num_user              INTEGER,
  num_critic            INTEGER,
  imdb_score            REAL,
  num_votes             INTEGER,
  facebook_likes        INTEGER
);

CREATE TABLE roles (
  id                    INTEGER     PRIMARY KEY,
  film_id               INTEGER,
  person_id             INTEGER,
  roles                 VARCHAR
);

-- Copy over data from CSVs
\copy films FROM 'data/films/films.csv' DELIMITER ',' CSV HEADER;
\copy people FROM 'data/films/people.csv' DELIMITER ',' CSV HEADER;
\copy reviews FROM 'data/films/reviews.csv' DELIMITER ',' CSV HEADER;
\copy roles FROM 'data/films/roles.csv' DELIMITER ',' CSV HEADER;


/*
createdb films
psql films < data/films/films.sql
*/
