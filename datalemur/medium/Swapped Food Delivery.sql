-- Problem link: https://datalemur.com/questions/sql-swapped-food-delivery

SELECT
  item,
  CASE 
    WHEN (order_id % 2 = 1 AND COUNT(*) OVER() = order_id) THEN order_id
    WHEN order_id % 2 = 0 THEN order_id - 1
    ELSE order_id + 1
  END corrected_order_id
FROM orders
ORDER BY corrected_order_id
