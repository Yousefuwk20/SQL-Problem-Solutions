-- Problem link: https://datalemur.com/questions/laptop-mobile-viewership
-- Problem Difficulty: Easy

WITH count_views AS(
SELECT 
      CASE 
          WHEN device_type = 'phone' THEN 'tablet' 
          ELSE device_type
      END
FROM viewership
)

SELECT COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
       COUNT(*) FILTER (WHERE device_type = 'tablet') AS mobile_views
FROM count_views