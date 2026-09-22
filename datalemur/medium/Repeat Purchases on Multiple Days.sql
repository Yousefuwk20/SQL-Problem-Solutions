-- Problem link: https://datalemur.com/questions/sql-repeat-purchases

WITH users AS(
SELECT 
    user_id,
    product_id,
    COUNT(DISTINCT purchase_date::date)
FROM purchases
GROUP BY user_id, product_id
ORDER BY user_id
)

SELECT
  COUNT(DISTINCT user_id)
FROM users
WHERE count > 1