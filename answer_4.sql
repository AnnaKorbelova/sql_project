CREATE OR REPLACE VIEW v_answer_4v AS
SELECT  
	va.payroll_year,
	va2.payroll_year + 1 AS year_prev,
	ROUND((va.food_average_price - va2.food_average_price) / va2.food_average_price * 100, 2) AS food_average_price_growth,
	ROUND((va.average_wages  - va2.average_wages) / va2.average_wages * 100, 2) AS average_wages_growth
FROM v_answer_3V va
JOIN v_answer_3V va2  
	ON va.food_category = va2.food_category  
	AND va.payroll_year = va2.payroll_year + 1 
GROUP BY va.payroll_year 
ORDER BY food_average_price_growth, average_wages_growth;  


	SELECT 
		*
	FROM v_answer_4v vav 
	WHERE food_average_price_growth > 10;
		 
	
	
	
	
	
