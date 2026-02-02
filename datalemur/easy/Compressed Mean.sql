-- Problem link: https://datalemur.com/questions/alibaba-compressed-mean


SELECT 
  ROUND((
    SUM(item_count * order_occurrences)::NUMERIC /
    SUM(order_occurrences)),
    1)
FROM items_per_order;
