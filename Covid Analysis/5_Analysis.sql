--4.Country with the highest DEATH PERCENTAGE
SELECT 
	location,
	(CAST(MAX(total_deaths) AS double precision)/AVG(CAST(population AS double precision))*100) AS percentage
FROM
	covid_deaths 
GROUP BY LOCATION  
ORDER BY  percentage DESC;