CREATE OR REPLACE VIEW v_czech_rep AS
SELECT 
	e.country,
	e.GDP,
	e.population,
	e.year
FROM economies e 
	JOIN countries c 
	ON e.country = c.country
WHERE e.year >= '2006'  
	AND e.year <= '2018' 
	AND e.country = 'Czech Republic';


CREATE OR REPLACE VIEW v_anna_korbelova_sql_answer_5 AS
SELECT 
	va4v.payroll_year,
	va4v.year_prev,
	va4v.food_average_price_growth,
	va4v.average_wages_growth,
	vcr.GDP  
FROM v_czech_rep vcr
	JOIN v_answer_4v va4v 
	ON va4v.payroll_year = vcr.YEAR
GROUP BY va4v.payroll_year,
	 va4v.year_prev,
	 va4v.food_average_price_growth,
	 va4v.average_wages_growth,
	 vcr.GDP;
	

