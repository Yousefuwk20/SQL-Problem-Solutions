-- Problem link: https://leetcode.com/problems/rising-temperature

SELECT id
FROM (
    SELECT 
        id,
        recordDate,
        temperature,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date,
        LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
    FROM Weather
) t
WHERE recordDate = prev_date + INTERVAL '1 day'
  AND temperature > prev_temp;
