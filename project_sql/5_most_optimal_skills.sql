/*
Question: What are the most optimal skills to learn ( high demand and high paying both)?
-also concentrate on remote positions with specified salaries
*/


WITH skills_demand AS (
    SELECT 
        sd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS demand_count
    FROM job_postings_fact jpf
    INNER JOIN skills_job_dim sjd ON  jpf.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE jpf.job_title_short = 'Data Analyst' AND
        jpf.job_work_from_home = TRUE AND
        jpf.salary_year_avg IS NOT NULL
    GROUP BY sd.skill_id, sd.skills
), Avg_salary AS (
    SELECT 
        sjd.skill_id,
        ROUND(AVG(jpf.salary_year_avg), 0) AS Average_salary
    FROM job_postings_fact jpf
    INNER JOIN skills_job_dim sjd ON  jpf.job_id = sjd.job_id
    WHERE jpf.job_title_short = 'Data Analyst' AND
        jpf.salary_year_avg IS NOT NULL AND
        jpf.job_work_from_home = TRUE
    GROUP BY sjd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    Average_salary
FROM
    skills_demand
INNER JOIN Avg_salary ON skills_demand.skill_id = Avg_salary.skill_id
WHERE demand_count > 10
ORDER BY Average_salary DESC,
        demand_count DESC
        
LIMIT 10

/*

Cloud Platforms in Demand: Skills like Snowflake, Azure, AWS, and BigQuery are in high demand among data roles. This reflects the industry's reliance on cloud computing for data storage, processing, and analysis. Professionals with expertise in managing and analyzing data on these platforms are highly sought after.
Big Data Technologies: Hadoop, a widely-used framework for distributed storage and processing of large datasets, is among the top skills. This suggests a continued demand for professionals skilled in big data technologies, as organizations deal with increasingly large and complex datasets.
Collaboration and Documentation Tools: Confluence and Jira are tools commonly used for collaboration and project management. Their inclusion in the list indicates the importance of communication and project coordination skills in data roles, especially in teams working on data-related projects.
Programming Languages: Go (Golang) and Java are programming languages that feature in the top skills list. While Java has been a staple in software development for years, the inclusion of Go suggests a growing interest in its efficiency and concurrency features, particularly for data-intensive applications.
Integration and ETL Tools: SSIS (SQL Server Integration Services) is an ETL (Extract, Transform, Load) tool used for data integration and workflow automation. Its presence in the list indicates the importance of data integration skills in data roles, as organizations need to extract, transform, and load data from various sources for analysis.

[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "average_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "average_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "average_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "average_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "average_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "average_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "average_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "average_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "average_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "average_salary": "104918"
  }
]

*/