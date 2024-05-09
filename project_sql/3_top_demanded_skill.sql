/* 
question: what are the most in-demande skills for the data analysts?
- join job postings to inner join table similar to query 2
- identify the top 5 in-demand skills for data analysts
focus on all job postings
*/

SELECT 
    skills,
    COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON  jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5