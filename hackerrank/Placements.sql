-- Problem link: https://www.hackerrank.com/challenges/placements
-- Problem Difficulty: Medium
WITH friend AS (
    SELECT s.ID, s.Name, p.Salary
    FROM Students s
    JOIN Packages p 
    ON s.ID = p.ID
),

bf_friend AS (
    SELECT f.id, p.salary
    FROM Friends f
    JOIN Packages p
    ON f.friend_id = p.id
)

SELECT ff.Name
FROM friend ff
JOIN bf_friend bf 
ON ff.id = bf.id
WHERE bf.salary > ff.salary
ORDER BY bf.Salary;
