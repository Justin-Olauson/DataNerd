/*
**Question: What are the top-paying data analyst jobs, and what skills are required?** 

- Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE '%CA%'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC

/* 
| Skill      | Avg Salary (\$) | Demand (Postings) |
| ---------- | --------------- | ----------------- |
| **SQL**    | 182,232         | 8                 |
| **Python** | 180,670         | 8                 |
| Snowflake  | 165,000         | 1                 |
| R          | 145,500         | 5                 |
| Spark      | 145,000         | 2                 |

| Skill      | Demand (Postings) | Avg Salary (\$) |
| ---------- | ----------------- | --------------- |
| **SQL**    | 8                 | 182,232         |
| **Python** | 8                 | 180,670         |
| R          | 5                 | 145,500         |
| Tableau    | 3                 | 141,500         |
| Looker     | 3                 | 141,500         |

[
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "salary_year_avg": "240000.0",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "salary_year_avg": "240000.0",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 1413561,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Autodesk, Inc.",
    "skills": "sql"
  },
  {
    "job_id": 1413561,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Autodesk, Inc.",
    "skills": "python"
  },
  {
    "job_id": 1413561,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Autodesk, Inc.",
    "skills": "r"
  },
  {
    "job_id": 1413561,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Autodesk, Inc.",
    "skills": "snowflake"
  },
  {
    "job_id": 1413561,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Autodesk, Inc.",
    "skills": "spark"
  },
  {
    "job_id": 594288,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "AMIRI",
    "skills": "sql"
  },
  {
    "job_id": 594288,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "AMIRI",
    "skills": "python"
  },
  {
    "job_id": 594288,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "AMIRI",
    "skills": "r"
  },
  {
    "job_id": 594288,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "AMIRI",
    "skills": "excel"
  },
  {
    "job_id": 594288,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "AMIRI",
    "skills": "tableau"
  },
  {
    "job_id": 594288,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "AMIRI",
    "skills": "power bi"
  },
  {
    "job_id": 594288,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "AMIRI",
    "skills": "looker"
  },
  {
    "job_id": 749276,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Chime",
    "skills": "sql"
  },
  {
    "job_id": 749276,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Chime",
    "skills": "python"
  },
  {
    "job_id": 749276,
    "job_title": "Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Chime",
    "skills": "r"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "sql"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "r"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "bigquery"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "redshift"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "numpy"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "airflow"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "tensorflow"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "pytorch"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "jupyter"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "scikit-learn"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "tableau"
  },
  {
    "job_id": 610044,
    "job_title": "Data Analyst",
    "salary_year_avg": "137500.0",
    "company_name": "Hub Consulting",
    "skills": "looker"
  },
  {
    "job_id": 939857,
    "job_title": "Data Analyst",
    "salary_year_avg": "137000.0",
    "company_name": "FLYR Labs",
    "skills": "sql"
  },
  {
    "job_id": 939857,
    "job_title": "Data Analyst",
    "salary_year_avg": "137000.0",
    "company_name": "FLYR Labs",
    "skills": "python"
  },
  {
    "job_id": 939857,
    "job_title": "Data Analyst",
    "salary_year_avg": "137000.0",
    "company_name": "FLYR Labs",
    "skills": "c"
  },
  {
    "job_id": 939857,
    "job_title": "Data Analyst",
    "salary_year_avg": "137000.0",
    "company_name": "FLYR Labs",
    "skills": "airflow"
  },
  {
    "job_id": 939857,
    "job_title": "Data Analyst",
    "salary_year_avg": "137000.0",
    "company_name": "FLYR Labs",
    "skills": "tableau"
  },
  {
    "job_id": 939857,
    "job_title": "Data Analyst",
    "salary_year_avg": "137000.0",
    "company_name": "FLYR Labs",
    "skills": "looker"
  },
  {
    "job_id": 939857,
    "job_title": "Data Analyst",
    "salary_year_avg": "137000.0",
    "company_name": "FLYR Labs",
    "skills": "git"
  },
  {
    "job_id": 637548,
    "job_title": "Data Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "LHH",
    "skills": "excel"
  },
  {
    "job_id": 637548,
    "job_title": "Data Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "LHH",
    "skills": "powerpoint"
  },
  {
    "job_id": 637548,
    "job_title": "Data Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "LHH",
    "skills": "jira"
  },
  {
    "job_id": 637548,
    "job_title": "Data Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "LHH",
    "skills": "confluence"
  },
  {
    "job_id": 950199,
    "job_title": "Data Analyst",
    "salary_year_avg": "128356.0",
    "company_name": "Global Allsights",
    "skills": "sql"
  },
  {
    "job_id": 950199,
    "job_title": "Data Analyst",
    "salary_year_avg": "128356.0",
    "company_name": "Global Allsights",
    "skills": "python"
  },
  {
    "job_id": 1118912,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Trusted Tech Team",
    "skills": "python"
  },
  {
    "job_id": 1118912,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Trusted Tech Team",
    "skills": "java"
  },
  {
    "job_id": 1118912,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Trusted Tech Team",
    "skills": "r"
  },
  {
    "job_id": 1118912,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Trusted Tech Team",
    "skills": "mysql"
  },
  {
    "job_id": 1118912,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Trusted Tech Team",
    "skills": "azure"
  },
  {
    "job_id": 1118912,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Trusted Tech Team",
    "skills": "spark"
  },
  {
    "job_id": 1118912,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Trusted Tech Team",
    "skills": "hadoop"
  },
  {
    "job_id": 1118912,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Trusted Tech Team",
    "skills": "power bi"
  }
]
*/
