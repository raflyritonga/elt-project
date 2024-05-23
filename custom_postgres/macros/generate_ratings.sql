-- Using macros

{% macro generate_ratings() %}

CASE 
    WHEN rating >= 8 AND rating <= 10 THEN 'Excellent'
    WHEN rating >= 7 AND rating < 8 THEN 'Good'
    WHEN rating >= 6 AND rating < 7 THEN 'Average'
    ELSE 'Poor'
END AS rating_category

{% endmacro %}