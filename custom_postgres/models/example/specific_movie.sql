-- Using jinja 
{% set movie_title = 'War for the Planet of the Apes' %}

SELECT * 
    FROM {{ ref('movies') }}
    WHERE title = '{{ movie_title }}'