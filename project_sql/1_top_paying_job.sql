/* 
Question: What are the top-paying data analyst jobs?
- identifiy the top 10 highest paying data analyst roles that are available remotely.
- focuses on job postings with specified salaries (removes null)
- why? highlight the top-paying opportunitiesfor the data analysts, offering insight
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact jpf
LEFT JOIN   company_dim ON jpf.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
    