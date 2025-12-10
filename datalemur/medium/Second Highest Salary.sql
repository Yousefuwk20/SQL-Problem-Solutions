-- Problem link: https://datalemur.com/questions/sql-second-highest-salary

WITH salary_rank AS(
    SELECT 
        salary,
        ROW_NUMBER() OVER(ORDER BY salary DESC)
    FROM employee
)

SELECT
    salary AS second_highest_salary
FROM salary_rank
WHERE row_number = 2

