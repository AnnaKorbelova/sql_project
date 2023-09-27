-- BREAD	

WITH first_measured_year_bread AS (
	SELECT 
		MIN(payroll_year) AS first_measured_time,
		measured_week,
		average_wages, 
		food_category,
		food_average_price,
		price_unit
	FROM v_anna_korbelova_project_sql_primary_final vakpspf  
	WHERE food_category = 'Chléb konzumní kmínový'
	GROUP BY measured_week,
		 payroll_year
	ORDER BY first_measured_time,
		 measured_week
)
		SELECT 
			average_wages,
			first_measured_time,
			measured_week,
			ROUND(average_wages/food_average_price, 2) AS first_price
		FROM first_measured_year_bread
		WHERE measured_week = 1
		GROUP BY first_price, 
			 average_wages,
			 measured_week,
			 first_measured_time
		ORDER BY first_measured_time
		LIMIT 1;


WITH last_measured_year_bread AS (
	SELECT 
		MAX(payroll_year) AS last_measured_time,
		measured_week,
		average_wages, 
		food_category,
		food_average_price,
		price_unit
	FROM v_anna_korbelova_project_sql_primary_final vakpspf  
	WHERE food_category = 'Chléb konzumní kmínový'
	GROUP BY measured_week,
		 payroll_year
	ORDER BY last_measured_time DESC, 
		 measured_week DESC
)
		SELECT 	
			average_wages,
			last_measured_time,
			measured_week,
			ROUND(average_wages/food_average_price, 2) AS last_price
		FROM last_measured_year_bread
		WHERE measured_week = 50
		GROUP BY last_price, 
			 average_wages, 
			 measured_week,
			 last_measured_time
		ORDER BY last_measured_time DESC
		LIMIT 1;
	
-- MILK

WITH first_measured_year_milk AS (
	SELECT 
		MIN(payroll_year) AS first_measured_time,
		measured_week,
		average_wages, 
		food_category,
		food_average_price,
		price_unit
	FROM v_anna_korbelova_project_sql_primary_final vakpspf  
	WHERE food_category = 'Mléko polotučné pasterované'
	GROUP BY measured_week ,
		 payroll_year
	ORDER BY first_measured_time,
		 measured_week
)
		SELECT 
			average_wages,
			first_measured_time,
			measured_week,
			ROUND(average_wages/food_average_price, 2) AS first_price
		FROM first_measured_year_milk
		WHERE measured_week = 1
		GROUP BY first_price, 
			 average_wages,
			 measured_week,
			 first_measured_time
		ORDER BY first_measured_time
		LIMIT 1;


WITH last_measured_year_milk AS (
	SELECT 
		MAX(payroll_year) AS last_measured_time,
		measured_week,
		average_wages, 
		food_category,
		food_average_price,
		price_unit
	FROM v_anna_korbelova_project_sql_primary_final vakpspf  
	WHERE food_category = 'Mléko polotučné pasterované'
	GROUP BY measured_week,
		 payroll_year 
	ORDER BY last_measured_time DESC, 
		 measured_week DESC
)
		SELECT 
			average_wages,
			last_measured_time,
			measured_week,
			ROUND(average_wages/food_average_price, 2) AS last_price
		FROM last_measured_year_milk
		WHERE measured_week = 50
		GROUP BY last_price, 
			 average_wages, 
			 measured_week,
			 last_measured_time
		ORDER BY last_measured_time DESC
		LIMIT 1;
	
