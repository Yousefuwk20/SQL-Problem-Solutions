-- Problem link: https://datalemur.com/questions/completed-trades
-- Problem Difficulty: Easy

SELECT 
    u.city,
    COUNT(*) AS total_orders
FROM trades t 
INNER JOIN users u 
ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;