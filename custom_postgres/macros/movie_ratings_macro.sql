-- Using macros

{% macro generate_movie_rating() %}

-- Custom models using CTE technique

WITH movies_with_ratings AS (
    SELECT
        id,
        title,
        released_year,
        imdb_certificate,
        rating,
        {{ generate_ratings() }}
    FROM {{ref('movies')}}
),

movies_with_actor AS (
    SELECT
        m.id,
        m.title,
        STRING_AGG(a.actor_name, ',') AS actors
    FROM {{ ref('movies') }}m
    LEFT JOIN {{ ref('movies_and_actor') }} ma ON m.id = ma.movie_id
    LEFT JOIN {{ ref('actors') }} a ON ma.actor_id = a.id
    GROUP BY m.id, m.title
)

SELECT 
    mwr.*,
    mwa.actors
FROM movies_with_ratings mwr
LEFT JOIN movies_with_actor mwa ON mwr.id = mwa.id

{% endmacro %}
