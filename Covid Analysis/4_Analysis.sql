--3.Verify 2 by getting info separately.
SELECT 
	MAX(total_deaths) AS total_deaths,
	AVG(CAST(population AS double precision)) AS population
FROM 
	covid_deaths 
WHERE LOCATION LIKE '%Pakistan%';