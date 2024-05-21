--1. Datewise Likelihood of dying due to Covid-Totalcases vs TotalDeath in Pakistan
SELECT 
	date,
	LOCATION,
	total_cases,
	total_deaths,
	(CAST (total_deaths AS double precision)/CAST(total_cases AS double precision)*100) AS death_percentage
FROM 
	covid_deaths 
WHERE LOCATION LIKE '%Pakistan%';
