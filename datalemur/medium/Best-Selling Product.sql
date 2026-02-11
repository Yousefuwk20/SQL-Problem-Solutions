-- Problem link: https://datalemur.com/questions/best-selling-products

WITH rnk AS(
  SELECT 
    RANK() OVER(
      PARTITION BY p.category_name 
      ORDER BY ps.sales_quantity DESC, ps.rating DESC) AS rating_rnk,
    p.product_name AS product_name,
    p.category_name AS category_name
  FROM products p 
  INNER JOIN product_sales ps
  ON p.product_id = ps.product_id
  ORDER BY p.category_name, p.product_name
)

SELECT 
  category_name,
  product_name
FROM rnk
WHERE rating_rnk = 1