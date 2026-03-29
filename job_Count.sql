/*Determine the size category ('Small', 'Medium', or 'Large') for each company by first identifying the number of job postings they have.
 Use a subquery to calculate the total job postings per company.
 A company is considered:
 'Small' if it has less than 10 job postings
 'Medium' if the number of job postings is between 10 and 50
 'Large' if it has more than 50 job postings
 Implement a subquery to aggregate job counts per company before classifying them based on size.*/
SELECT company_id,
    job_count,
    CASE
        WhEN job_count < 10 then 'smol'
        WHEN job_count between 10 and 50 then 'medium'
        else 'Large'
    END as classification
FROM (
        SELECT company_id,
            count(*) as job_count
        FROM job_postings_fact
        GROUP BY company_id
    )