-- Problem link: https://datalemur.com/questions/sql-average-post-hiatus-1

WITH diff_date AS(
SELECT 
  user_id,
  MIN(post_date) AS first_post_date,
  MAX(post_date) AS last_post_date
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
)

SELECT 
      user_id,
      (last_post_date::date - first_post_date::date) AS days_between
FROM diff_date
WHERE (last_post_date::date - first_post_date::date) > 0

