--7. Continentwise +ve cases
SELECT 
    location,
    max(total_cases) AS total_cases 
FROM covid_deaths 
WHERE continent IS NULL 
GROUP BY location 
ORDER BY total_cases DESC;