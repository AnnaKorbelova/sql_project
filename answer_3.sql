CREATE OR REPLACE VIEW v_anna_korbelova_sql_answer_3r AS
SELECT 
	vo.food_category,  
	vo.payroll_year,
	vo2.payroll_year + 1 AS year_prev,
	ROUND((vo.food_average_price - vo2.food_average_price) / vo2.food_average_price * 100, 2) AS food_average_price_growth
FROM v_otazka_3 vo
JOIN v_otazka_3 vo2  
	ON vo.food_category = vo2.food_category  
	AND vo.payroll_year = vo2.payroll_year + 1
GROUP BY vo.food_category,  
	 vo.payroll_year
ORDER BY food_average_price_growth;


SELECT 
	food_category, 
	food_average_price_growth,
CASE 
	WHEN food_average_price_growth < 1 THEN 'price_slow_growth'
	WHEN food_average_price_growth < 40 THEN 'price_fast_growth'
	ELSE 'price_hight_growth'
	END AS price_growth
FROM v_anna_korbelova_sql_answer_3r 
GROUP BY food_category  
LIMIT 1;
