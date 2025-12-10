-- Problem link: https://datalemur.com/questions/rolling-average-tweets

WITH tweet_averages AS (
    SELECT 
        user_id,
        tweet_date,
        AVG(tweet_count) OVER (
            PARTITION BY user_id 
            ORDER BY tweet_date 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS rolling_avg_3d
    FROM tweets
)

SELECT 
    user_id,
    tweet_date,
    ROUND(rolling_avg_3d, 2)
FROM tweet_averages
