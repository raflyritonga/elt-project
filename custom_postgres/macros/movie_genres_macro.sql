{% macro generate_movie_genre() %}

SELECT
    movies.title AS movie_title,
    genres.genre_name AS genre
FROM
    movies_and_genre
INNER JOIN movies ON movies_and_genre.movie_id = movies.id
INNER JOIN genres ON movies_and_genre.genre_id = genres.id

{% endmacro %}