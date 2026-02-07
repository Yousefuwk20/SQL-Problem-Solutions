-- Problem link: https://datalemur.com/questions/odd-even-measurements

WITH rn AS (
  SELECT 
    measurement_value,
    measurement_time,
    ROW_NUMBER() OVER (
      PARTITION BY measurement_time::date
      ORDER BY measurement_time
    ) AS row_num
  FROM measurements
)

SELECT
  DATE_TRUNC('day', measurement_time) AS measurement_day,
  SUM(CASE WHEN row_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum,
  SUM(CASE WHEN row_num % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum
FROM rn
GROUP BY DATE_TRUNC('day', measurement_time)
ORDER BY measurement_day;





