-- Problem link: https://datalemur.com/questions/cards-issued-difference


WITH diff AS(
  SELECT
      card_name,
      issued_amount - FIRST_VALUE(issued_amount) OVER (PARTITION BY card_name ORDER BY issued_amount) AS difference
  FROM monthly_cards_issued
)

SELECT 
  card_name,
  MAX(difference) AS difference
FROM diff
GROUP BY card_name
ORDER BY difference DESC

-- Another approach
SELECT 
    card_name, 
    MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;