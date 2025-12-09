-- Problem link: https://datalemur.com/questions/final-account-balance

SELECT 
    account_id,
    SUM(
      CASE 
        WHEN transaction_type = 'Withdrawal' THEN amount * -1
        ELSE amount
      END
    ) AS total_amount
FROM transactions
GROUP BY account_id;
