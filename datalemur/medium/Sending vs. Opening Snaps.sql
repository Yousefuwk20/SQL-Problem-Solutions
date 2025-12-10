-- Problem link: https://datalemur.com/questions/time-spent-snaps

WITH stats AS(
    SELECT 
        a.age_bucket,
        SUM(t.time_spent) FILTER (WHERE t.activity_type = 'send') AS send,
        SUM(t.time_spent) FILTER (WHERE t.activity_type = 'open') AS open
    FROM activities t 
    INNER JOIN age_breakdown a
    ON t.user_id = a.user_id
    WHERE activity_type IN ('send', 'open')
    GROUP BY a.age_bucket
)

SELECT
    age_bucket,
    ROUND((send / (open + send)) * 100.0, 2) AS send_perc,
    100 - ROUND((send / (open + send)) * 100.0, 2) AS open_perc
FROM stats