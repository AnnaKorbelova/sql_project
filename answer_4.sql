WITH answer_4_average_wages AS (
    SELECT *
    FROM v_anna_korbelova_project_sql_primary_final
    WHERE average_wages  > 10
)
		SELECT
			industry_name, 
    		ROUND (AVG(payroll_year), 0) AS year_average_wages
		FROM answer_4_average_wages
		WHERE industry_name IS NOT NULL;

WITH answer_4_food_average_price AS (
    SELECT *
    FROM v_anna_korbelova_project_sql_primary_final
    WHERE food_average_price  > 10
)
		SELECT
			food_category, 
    		ROUND (AVG(payroll_year), 0) AS year_food_average_price
		FROM answer_4_food_average_price;
		 
	
	
	
	
	