-- Problem link: https://datalemur.com/questions/sql-case-marvel-avengers

SELECT
  actor,
  character,
  platform,
  avg_likes,
  CASE 
    WHEN avg_likes >= 15000 THEN 'Super Likes'
    WHEN avg_likes >= 5000 THEN 'Good Likes'
    ELSE 'Low Likes'
  END AS likes_category
FROM marvel_avengers
ORDER BY avg_likes DESC;
