CREATE VIEW v_anna_korbelova_project_SQL_primary_final AS

	SELECT 
		WEEKOFYEAR(cp.date_from) AS measured_week,
		cpay.payroll_year AS payroll_year,
    		cpay.value AS average_wages,
    		cpib.code AS industry_code,
		cpib.name AS industry_name,
		cpcat.name AS food_category,
		cp.value AS food_average_price,
		cpcat.price_unit
	FROM czechia_price cp 
	JOIN czechia_payroll cpay
		ON cpay.payroll_year = YEAR(cp.date_from)
	LEFT JOIN czechia_price_category cpcat
		ON cp.category_code = cpcat.code
	LEFT JOIN czechia_payroll_industry_branch cpib 
		ON cpay.industry_branch_code = cpib.code	
	LEFT JOIN czechia_payroll_value_type cpvt 
		ON cpay.value_type_code = cpvt.code 
	LEFT JOIN czechia_payroll_unit cpu 
		ON cpay.unit_code = cpu.code
	LEFT JOIN czechia_payroll_calculation cpc 
		ON cpay.calculation_code = cpc.code
	WHERE cpay.value_type_code = 5958
	GROUP BY payroll_year, measured_week, industry_name, food_category
	ORDER BY payroll_year, measured_week;
	
