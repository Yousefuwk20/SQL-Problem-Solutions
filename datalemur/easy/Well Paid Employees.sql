-- Problem link: https://datalemur.com/questions/sql-well-paid-employees

WITH managers AS(
SELECT * 
FROM employee
WHERE manager_id IS NULL
)

SELECT 
    e.employee_id,
    e.name AS employee_name
FROM employee e 
INNER JOIN managers m 
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary
