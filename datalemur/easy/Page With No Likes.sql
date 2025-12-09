-- Problem link: https://datalemur.com/questions/sql-page-with-no-likes

SELECT p.page_id
FROM pages p
LEFT JOIN page_likes l
ON p.page_id = l.page_id
WHERE liked_date IS NULL
ORDER BY p.page_id;