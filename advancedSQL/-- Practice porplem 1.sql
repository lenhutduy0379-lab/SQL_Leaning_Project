-- Practice porplem 1
SELECT job_schedule_type,
    AVG (salary_year_avg) as avg_yearly_salary,
    AVG (salary_hour_avg) as avg_hourly_salary
FROM job_postings_fact
WHERE date(job_posted_date) >= '2023-06-01'
GROUP BY job_schedule_type