--5.Total % of covid +ve cases- in Pakistan

SELECT
     (cast(max(total_cases) as double precision)/avg(cast(population as double precision))*100) as percentage 
FROM
     covid_deaths
WHERE LOCATION like '%Pakistan%';

