-- Practice Porplem 3
SELECT companies.name as company_name,
    jobs.job_id,
    companies.company_id,
    job_health_insurance as has_health_insurance
FROM job_postings_fact as jobs
    LEFT JOIN company_dim as companies ON jobs.company_id = companies.company_id
where job_health_insurance = TRUE
    and EXTRACT(
        YEAR
        FROM jobs.job_posted_date
    ) = 2023
    and EXTRACT(
        QUARTER
        FROM jobs.job_posted_date
    ) = 2