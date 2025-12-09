-- Problem link: https://datalemur.com/questions/sql-ibm-db2-product-analytics

WITH emp AS(
SELECT 
    e.employee_id,
    COUNT(q.query_id) AS num_of_queries
FROM employees e
LEFT JOIN queries AS q
ON e.employee_id = q.employee_id
AND q.query_starttime >= '2023-07-01T00:00:00Z'
AND q.query_starttime < '2023-10-01T00:00:00Z'
GROUP BY e.employee_id
)

SELECT
    num_of_queries,
    COUNT(employee_id)
FROM emp
GROUP BY num_of_queries
ORDER BY num_of_queries;