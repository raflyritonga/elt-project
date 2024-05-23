{% macro generate_movie_actor() %}

SELECT
    movies.title AS movie_title,
    actors.actor_name
FROM
    movies_and_actor
INNER JOIN movies ON movies_and_actor.movie_id = movies.id
INNER JOIN actors ON movies_and_actor.actor_id = actors.id

{% endmacro %}