--8. Continentwise deaths
SELECT 
    location,
    max(total_deaths) AS total_deaths 
FROM 
    covid_deaths 
WHERE continent IS NULL 
GROUP BY  location 
ORDER BY  total_deaths DESC;