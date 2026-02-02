-- Problem link: https://datalemur.com/questions/sql-average-deal-size

SELECT 
  ROUND(SUM(num_seats * yearly_seat_cost)::DECIMAL / 
    COUNT(customer_id), 2) AS average_deal_size
FROM contracts
