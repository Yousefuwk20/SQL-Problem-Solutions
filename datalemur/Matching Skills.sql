-- Problem link: https://datalemur.com/questions/matching-skills
-- Problem Difficulty: Easy

WITH arr_skills AS(
SELECT 
  candidate_id,
  ARRAY_AGG(skill) AS skills
FROM candidates
GROUP BY candidate_id
)

SELECT candidate_id
FROM arr_skills
WHERE skills @> ARRAY['Python', 'PostgreSQL', 'Tableau']::varchar[]


--ANOTHER APPROACH--
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'PostgreSQL', 'Tableau')
GROUP BY candidate_id
HAVING COUNT(skill) = 3;