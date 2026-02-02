-- Problem link: https://datalemur.com/questions/second-day-confirmation

SELECT DISTINCT emails.user_id
FROM emails 
INNER JOIN texts
ON emails.email_id = texts.email_id
WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND signup_action = 'Confirmed';