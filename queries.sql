SELECT 
    COUNT(*) FILTER (WHERE title ILIKE '%Data Engineer%') AS data_engineering,
    COUNT(*) FILTER (WHERE title NOT ILIKE '%Data Engineer%') AS others
FROM jobs;

-----

SELECT 
    COUNT(*) FILTER (WHERE date_posted >= CURRENT_DATE - INTERVAL '7 days') AS last_7_days,
    COUNT(*) FILTER (WHERE date_posted BETWEEN CURRENT_DATE - INTERVAL '14 days' AND CURRENT_DATE - INTERVAL '8 days') AS last_8_14_days,
    COUNT(*) FILTER (WHERE date_posted BETWEEN CURRENT_DATE - INTERVAL '21 days' AND CURRENT_DATE - INTERVAL '15 days') AS last_15_21_days,
    COUNT(*) FILTER (WHERE date_posted < CURRENT_DATE - INTERVAL '21 days') AS older_than_21_days
FROM jobs;

----

SELECT job_type, COUNT(*) AS count
FROM jobs
GROUP BY job_type
WHERE job_type IS NOT NULL
ORDER BY count DESC;

----

SELECT location, COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS percentage
FROM jobs
GROUP BY location
ORDER BY percentage DESC;

----

SELECT TRIM(unnested_skill) AS skill, COUNT(*) AS frequency
FROM (
    SELECT unnest(string_to_array(skills, ',')) AS unnested_skill
    FROM jobs
) AS subquery
GROUP BY skill
ORDER BY frequency DESC;

----

SELECT company_industry, COUNT(*) AS job_count
FROM jobs
WHERE company_industry IS NOT NULL
GROUP BY company_industry
ORDER BY job_count DESC
LIMIT 5;

----

SELECT 
    MIN(min_amount) AS min_salary, 
    MAX(max_amount) AS max_salary
FROM jobs
WHERE min_amount IS NOT NULL AND max_amount IS NOT NULL;

----

SELECT company_num_employees, COUNT(*) AS job_count
FROM jobs
WHERE company_num_employees IS NOT NULL
GROUP BY company_num_employees
ORDER BY job_count DESC;