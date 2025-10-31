-- Problem link: https://www.hackerrank.com/challenges/contest-leaderboard
-- Problem Difficulty: Medium
SELECT 
    hacker_id,
    name,
    sum(max_score)
FROM
    (
    select 
        h.hacker_id,
        name,
        challenge_id,
        max(s.score) as max_score
    from 
        hackers h 
    join 
        submissions s 
    on  
        h.hacker_id = s.hacker_id
    group by 
        h.hacker_id, name, challenge_id
    )t
GROUP BY 
    hacker_id, name
HAVING 
    sum(max_score) != 0
ORDER BY 
    sum(max_score) DESC,
    hacker_id