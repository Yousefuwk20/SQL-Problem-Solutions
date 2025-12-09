-- Problem link: https://datalemur.com/questions/duplicate-job-listings

WITH companies AS(
    SELECT
        company_id,
        title,
        COUNT(description) AS duplicate_companies
    FROM job_listings 
    GROUP BY company_id, title
)

SELECT COUNT(duplicate_companies)
FROM companies
WHERE duplicate_companies > 1;