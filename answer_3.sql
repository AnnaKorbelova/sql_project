CREATE OR REPLACE VIEW v_answer_3V AS
SELECT DISTINCT 
		average_wages,
		food_category,
		food_average_price,
		payroll_year
FROM v_anna_korbelova_project_sql_primary_final vakpspf 
GROUP BY 	payroll_year,
			average_wages,
			food_category,
			food_average_price;

CREATE OR REPLACE VIEW v_anna_korbelova_sql_answer_3r AS
SELECT 
	va.food_category,  
	va.payroll_year,
	va2.payroll_year + 1 AS year_prev,
	ROUND((va.food_average_price - va2.food_average_price) / va2.food_average_price * 100, 2) AS food_average_price_growth
FROM v_answer_3V va2
JOIN v_answer_3V va2  
	ON va.food_category = va2.food_category  
	AND va.payroll_year = va2.payroll_year + 1
GROUP BY va.food_category,  
	 va.payroll_year
ORDER BY food_average_price_growth;


SELECT 
	food_category, 
	food_average_price_growth,
CASE 
	WHEN food_average_price_growth < 10 THEN 'price_slow_growth'
	WHEN food_average_price_growth < 40 THEN 'price_fast_growth'
	ELSE 'price_hight_growth'
	END AS price_growth
FROM v_anna_korbelova_sql_answer_3r 
GROUP BY food_category;

SELECT 
		food_category, 
		food_average_price_growth,
	CASE 
		WHEN food_average_price_growth < 10 THEN 'price_slow_growth'
		WHEN food_average_price_growth < 40 THEN 'price_fast_growth'
		ELSE 'price_hight_growth'
		END AS price_growth
FROM v_anna_korbelova_sql_answer_3r 
GROUP BY food_category,
	 food_average_price_growth
ORDER BY food_average_price_growth
LIMIT 1;
