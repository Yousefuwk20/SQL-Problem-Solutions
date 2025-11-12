-- Problem link: https://datalemur.com/questions/top-profitable-drugs
-- Problem Difficulty: Easy

SELECT 
    drug,
    (total_sales - cogs) AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;