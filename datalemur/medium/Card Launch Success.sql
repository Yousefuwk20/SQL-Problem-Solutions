-- Problem link: https://datalemur.com/questions/card-launch-success

WITH issue_ranking AS(
  SELECT 
    card_name,
    issued_amount,
    ROW_NUMBER() OVER(
        PARTITION BY card_name 
        ORDER BY issue_year, issue_month) AS rnk
  FROM monthly_cards_issued
)

SELECT
  card_name,
  issued_amount
FROM issue_ranking
WHERE rnk = 1
ORDER BY issued_amount DESC
