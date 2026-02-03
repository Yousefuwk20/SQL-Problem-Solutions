-- Problem link: https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=1

SELECT
    ABS(MAX(salary) - MIN(salary)) AS salary_diff
FROM (
    SELECT
        department_id,
        MAX(salary) AS salary
    FROM db_employee
    WHERE department_id IN (1, 4)
    GROUP BY department_id
) t;
