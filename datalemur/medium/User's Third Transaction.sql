-- Problem link: https://datalemur.com/questions/sql-third-transaction

WITH rank_users AS(
SELECT 
    user_id,
    spend,
    transaction_date,
    RANK() OVER(PARTITION BY user_id ORDER BY transaction_date)
FROM transactions
)

SELECT 
    user_id,
    spend,
    transaction_date
FROM rank_users
WHERE rank = 3
