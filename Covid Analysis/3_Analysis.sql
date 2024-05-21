--2.Total % of deaths out of entire population- in Pakistan
SELECT 
	(CAST(MAX(total_deaths) AS double precision)/AVG(CAST(population AS double precision))*100) AS percentage
FROM 
	covid_deaths 
WHERE LOCATION LIKE '%Pakistan%';

-- So if you are in Pakistan, there is 0.0129 percentage chance of you dying from COVID.