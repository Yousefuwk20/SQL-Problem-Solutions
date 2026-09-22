-- Problem link: https://datalemur.com/questions/nyc-area-code

SELECT COUNT(*) AS nyc_count
FROM phone_calls pc
WHERE EXISTS (
    SELECT 1
    FROM phone_info p
    WHERE p.caller_id IN (pc.caller_id, pc.receiver_id)
      AND p.phone_number LIKE '+1-212%'
);