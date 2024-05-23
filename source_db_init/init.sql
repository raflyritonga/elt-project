-- Create the tables
CREATE TABLE movies(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    released_year INTEGER NOT NULL,
    imdb_certificate VARCHAR(20) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating >= 1 AND rating <= 10)
);

CREATE TABLE actors(
    id SERIAL PRIMARY KEY,
    actor_name VARCHAR(255) NOT NULL
);

CREATE TABLE genres(
    id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE movies_and_actor(
    movie_id INTEGER REFERENCES movies(id),
    actor_id INTEGER REFERENCES actors(id),
    PRIMARY KEY (movie_id, actor_id)
);

CREATE TABLE movies_and_genre(
    movie_id INTEGER REFERENCES movies(id),
    genre_id INTEGER REFERENCES genres(id),
    PRIMARY KEY (movie_id, genre_id)
);


-- Load data from the CSVs file
\copy movies(title, released_year, imdb_certificate, rating) FROM '/datasets/clean/imdb_movie.csv' DELIMITER ',' CSV HEADER;

\copy actors(actor_name) FROM '/datasets/clean/actor.csv' DELIMITER ',' CSV HEADER;

\copy genres(genre_name) FROM '/datasets/clean/genre.csv' DELIMITER ',' CSV HEADER;

\copy movies_and_actor(movie_id, actor_id) FROM '/datasets/clean/movie_and_actor.csv' DELIMITER ',' CSV HEADER;

\copy movies_and_genre(movie_id, genre_id) FROM '/datasets/clean/movie_and_genre.csv' DELIMITER ',' CSV HEADER;