-- Practice proplem 1 Subquery : 
/* Idenfine the top 5 skill that are most frequently mentioned in job postings
 Used a subquery to find the skill IDs with the highest counts in the skill job dim table 
 and join this result with the skill_dim table to get skills name  */
SELECT skills_dim.skills
FROM (
        SELECT skill_id,
            count (*) as skill_count
        FROM skills_job_dim
        GROUP BY skill_id
        ORDER BY skill_count DESC
        LIMIT 5
    ) as top_skills
    LEFT JOIN skills_dim on top_skills.skill_id = skills_dim.skill_id