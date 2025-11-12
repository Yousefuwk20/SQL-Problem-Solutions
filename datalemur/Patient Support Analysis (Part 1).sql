-- Problem link: https://datalemur.com/questions/frequent-callers
-- Problem Difficulty: Easy

WITH cnt AS(
    SELECT policy_holder_id, COUNT(case_id) AS num_of_calls
    FROM callers
    GROUP BY policy_holder_id
)

SELECT 
    COUNT(num_of_calls) AS policy_holder_count
FROM cnt 
WHERE num_of_calls > 2