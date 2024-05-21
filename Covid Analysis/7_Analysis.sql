--6 .Total % of covid +ve cases- in world
SELECT 
    location,
    (cast(max(total_cases) as double precision)/avg(cast(population as double precision))*100) as percentage 
FROM 
    covid_deaths
GROUP BY location 
ORDER BY percentage DESC;