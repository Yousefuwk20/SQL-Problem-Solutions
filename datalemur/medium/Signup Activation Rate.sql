-- Problem link: https://datalemur.com/questions/signup-confirmation-rate

WITH action_count AS(
    SELECT 
        signup_action,
        COUNT(e.email_id) AS unique_counts
    FROM emails e 
    LEFT JOIN texts t 
    ON t.email_id = e.email_id
    AND t.signup_action = 'Confirmed'
    GROUP BY signup_action
)

SELECT 
    ROUND(
        SUM(CASE 
                WHEN signup_action = 'Confirmed' 
                THEN unique_counts 
                ELSE 0 
            END) 
        / SUM(unique_counts)
    , 2) AS activation_rate
FROM action_count;
