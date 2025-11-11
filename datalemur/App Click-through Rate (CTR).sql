-- Problem link: https://datalemur.com/questions/click-through-rate
-- Problem Difficulty: Easy

WITH stats AS(
SELECT
    app_id,
    COUNT(*) FILTER (WHERE event_type = 'impression') AS impression,
    COUNT(*) FILTER (WHERE event_type = 'click') AS click
FROM events
WHERE EXTRACT(YEAR FROM timestamp) = 2022 
GROUP BY app_id
)

SELECT 
    app_id,
    ROUND((100.0 * click / impression), 2) AS ctr
FROM stats
