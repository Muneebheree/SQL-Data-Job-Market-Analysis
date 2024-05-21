CREATE TABLE covid_vaccinations (
    iso_code VARCHAR(10),
    continent VARCHAR(50),
    location VARCHAR(100),
    date DATE,
    total_tests BIGINT,
    new_tests BIGINT,
    positive_rate FLOAT,
    tests_per_case FLOAT,
    tests_units VARCHAR(50),
    total_vaccinations BIGINT,
    people_vaccinated BIGINT,
    people_fully_vaccinated BIGINT,
    total_boosters BIGINT,
    new_vaccinations BIGINT,
    stringency_index FLOAT,
    population_density FLOAT,
    median_age FLOAT,
    aged_65_older FLOAT,
    aged_70_older FLOAT,
    gdp_per_capita FLOAT,
    extreme_poverty FLOAT,
    cardiovasc_death_rate FLOAT,
    diabetes_prevalence FLOAT,
    handwashing_facilities FLOAT,
    life_expectancy FLOAT,
    human_development_index FLOAT,
    excess_mortality_cumulative FLOAT,
    excess_mortality FLOAT
);


COPY covid_vaccinations (iso_code, continent, location, date, total_tests, new_tests, positive_rate, tests_per_case, tests_units, total_vaccinations, people_vaccinated, people_fully_vaccinated, total_boosters, new_vaccinations, stringency_index, population_density, median_age, aged_65_older, aged_70_older, gdp_per_capita, extreme_poverty, cardiovasc_death_rate, diabetes_prevalence, handwashing_facilities, life_expectancy, human_development_index, excess_mortality_cumulative, excess_mortality)
FROM 'C:\Projects\csv files\CovidVaccinations.csv'
DELIMITER ','
CSV HEADER;


SELECT *
FROM covid_vaccinations
LIMIT 50;



CREATE TABLE covid_deaths (
    iso_code VARCHAR(50),
    continent VARCHAR(50),
    location VARCHAR(100),
    date DATE,
    population BIGINT,
    total_cases BIGINT,
    new_cases BIGINT,
    total_deaths BIGINT,
    new_deaths BIGINT,
    total_deaths_per_million FLOAT,
    new_deaths_per_million FLOAT,
    reproduction_rate FLOAT,
    icu_patients BIGINT,
    hosp_patients BIGINT,
    weekly_icu_admissions BIGINT,
    weekly_hosp_admissions BIGINT
);


COPY covid_deaths (iso_code, continent, location, date, population, total_cases, new_cases, total_deaths, new_deaths, total_deaths_per_million, new_deaths_per_million, reproduction_rate, icu_patients, hosp_patients, weekly_icu_admissions, weekly_hosp_admissions) 
FROM 'C:\Projects\csv files\CovidDeaths.csv' 
DELIMITER ',' 
CSV HEADER;


SELECT *
FROM covid_deaths
LIMIT 5;