/*
Question: What are the top skills based on the salary?
- Avg Salary Associated with the each skill for data analyst positions.
- Focuses on roles with specified salaries, regardless of location.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS Average_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON  jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    -- job_work_from_home = TRUE
GROUP BY skills
ORDER BY Average_salary DESC
LIMIT 25


/* 
Results:
Certainly:

- New Tools: The rise of big data technologies is evident in skills like Apache Kafka,
     Cassandra, and Airflow. Kafka is a distributed streaming platform used for building
    real-time data pipelines, while Cassandra is a distributed NoSQL database designed
    for handling large volumes of data. Airflow is a platform for orchestrating complex 
    data workflows, indicating a focus on managing and analyzing vast amounts of data efficiently.

- Machine Learning Emphasis: Within big data environments, there's a significant emphasis 
on machine learning frameworks like PyTorch, TensorFlow, and Keras. These frameworks are 
utilized not only for traditional data analysis but also for advanced analytics tasks within 
big data sets, such as predictive modeling and pattern recognition.

- Cloud and Automation: Big data often requires scalable infrastructure, leading to the adoption 
of cloud platforms like Terraform and VMware for managing resources dynamically. 
Automation tools like Puppet play a crucial role in provisioning and managing large-scale 
data processing environments, ensuring that big data workflows can be executed reliably 
and efficiently across distributed systems.
*/
