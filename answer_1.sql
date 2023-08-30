CREATE OR REPLACE VIEW v_anna_korbelova_sql_answer_1 AS	
	SELECT 
		payroll_year,
		industry_name,
		average_wages
	FROM v_anna_korbelova_project_sql_primary_final vakpspf
	WHERE industry_name IS NOT NULL
	GROUP BY payroll_year, 
		 industry_name 
	ORDER BY industry_name, 
	         payroll_year; 
