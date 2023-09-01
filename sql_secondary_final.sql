WITH population_2018 AS (
SELECT 
	*
FROM countries c 
JOIN economies e 
ON c.population = e.population
)
	SELECT 
	country AS location,
	population
	FROM population_2018 
	WHERE `year` = 2018;