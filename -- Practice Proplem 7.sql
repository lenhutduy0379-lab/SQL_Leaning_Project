-- Practice Proplem 7
-- Find the count of the number of remote job postings per skill 
-- - Display the topo 5 skills by their demand in remote jobs
-- - Iuclude skill IDs , name , and count of job posting requiring the skill
WITH remote_job_skills as (
    SELECT skill_id,
        count(*) as skill_count
    FROM skills_job_dim as skill_to_job
        INNER JOIN job_postings_fact as job_posting on job_posting.job_id = skill_to_job.job_id
    WhEre job_posting.job_title_short = 'Data Engineer'
    GROUP BY skill_id
)
SELECT skills.skill_id,
    skill_count,
    skills as skill_name
FROM remote_job_skills
    INNER JOIN skills_dim as skills on skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5