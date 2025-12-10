-- Problem link: https://datalemur.com/questions/sql-top-three-salaries

WITH rank_salaries AS(
    SELECT 
        e.name,
        e.salary,
        d.department_name,
        DENSE_RANK() OVER(
          PARTITION BY e.department_id ORDER BY salary DESC)
    FROM employee e 
    INNER JOIN department d
    ON e.department_id = d.department_id
)

SELECT 
    department_name,
    name,
    salary
FROM rank_salaries
WHERE dense_rank < 4
ORDER BY department_name, salary DESC, name 