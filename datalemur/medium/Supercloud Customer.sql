-- Problem link: https://datalemur.com/questions/supercloud-customer

WITH cnt AS(
  SELECT 
    c.customer_id,
    COUNT(DISTINCT p.product_category) AS product_count
  FROM customer_contracts c
  LEFT JOIN products p 
  ON c.product_id = p.product_id
  GROUP BY c.customer_id
)

SELECT 
  customer_id
FROM cnt 
WHERE product_count = 3