-- Problem link: https://datalemur.com/questions/sql-bloomberg-stock-min-max-1

WITH high AS(
  SELECT
    ticker,
    MAX(open),
    TO_CHAR(date, 'Mon-YYYY') AS datee,
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open DESC) AS Row_num
  FROM stock_prices
  GROUP BY ticker, TO_CHAR(date, 'Mon-YYYY'), open
),

low AS(
  SELECT
    ticker,
    MIN(open),
    TO_CHAR(date, 'Mon-YYYY') AS datee,
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open) AS Row_num
  FROM stock_prices
  GROUP BY ticker, TO_CHAR(date, 'Mon-YYYY'), open
)

SELECT 
  H.ticker,
  H.datee AS highest_mth,
  H.max AS highest_open,
  L.datee AS lowest_mth,
  L.min AS lowest_open
FROM high H
INNER JOIN low L 
ON L.ticker = H.ticker 
AND L.Row_num = 1 
AND H.Row_num = 1
