CREATE OR REPLACE VIEW v_anna_korbelova_project_sql_secondary_final AS
WITH Europe AS (
	SELECT 
		country,
		GDP,
		gini,
		population,
		year
	FROM economies e 
	WHERE e.country LIKE '%euro%'
	)
		SELECT 
		* 	
		FROM Europe
		WHERE year >= '2006'  AND year <= '2018'
		ORDER BY year;



