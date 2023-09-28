CREATE OR REPLACE VIEW v_anna_korbelova_project_sql_secondary_final AS
WITH Europe AS (
	SELECT 
		country,
		GDP,
		gini,
		population,
		year
	FROM economies e 
	WHERE e.country LIKE '%euro%' -- Původně zde měl být filtr 'Europe', ale zahlédla jsem i oblast 'Euro Area', tak jsem filtr upravila, aby zahrnul všechna evropská data. 
	)
		SELECT 
		* 	
		FROM Europe
		WHERE year >= '2006'  AND year <= '2018'
		ORDER BY year;



