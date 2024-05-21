--9. Countrywise total vaccinated persons
SELECT 
    covid_deaths.location as country,
    max(covid_vaccinations.people_fully_vaccinated) as Fully_vaccinated 
FROM covid_deaths 
JOIN covid_vaccinations on covid_deaths.iso_code=covid_vaccinations.iso_code and covid_deaths.date=covid_vaccinations.date 
WHERE 
    covid_deaths.continent IS NOT NULL
GROUP BY  country 
ORDER BY  Fully_vaccinated DESC;

