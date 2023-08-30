CREATE OR REPLACE VIEW v_anna_korbelova_sql_answer_3 AS
	SELECT 
		food_category,
		payroll_year,
		AVG(food_average_price) AS price_growth_by_year 
	FROM v_anna_korbelova_project_sql_primary_final vakpspf 
	GROUP BY food_category,
		 payroll_year  
	ORDER BY price_growth_by_year;
