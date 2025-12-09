-- Problem link: https://datalemur.com/questions/sql-histogram-tweets

WITH user_tweet_counts AS (
SELECT 
      user_id,
      COUNT(*) AS num_of_tweets
FROM tweets
WHERE EXTRACT(YEAR FROM tweet_date) = 2022
GROUP BY user_id
)

SELECT
      num_of_tweets AS tweet_bucket,
      COUNT(user_id) AS users_num
FROM user_tweet_counts
GROUP BY num_of_tweets;
