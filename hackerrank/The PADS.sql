-- Problem link: https://www.hackerrank.com/challenges/the-pads
-- Problem Difficulty: Medium
SELECT CONCAT(NAME, '(', LEFT(occupation, 1), ')') AS NameOccupation
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT("There are a total of ", count(*), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(name), occupation;