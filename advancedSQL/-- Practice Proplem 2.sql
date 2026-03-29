-- Practice Proplem 2 
SELECT COUNT(*) as total_jobs,
    EXTRACT(
        MONTH
        FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York'
    ) as month
FROM job_postings_fact as job_postings
WHERE EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023
GROUP BY month
ORDER BY month