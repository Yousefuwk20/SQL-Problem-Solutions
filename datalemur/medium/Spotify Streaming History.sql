-- Problem link: https://datalemur.com/questions/spotify-streaming-history

WITH history AS (
SELECT user_id, song_id, song_plays
FROM songs_history

UNION ALL

SELECT user_id, song_id, COUNT(song_id) AS song_plays
FROM songs_weekly
WHERE listen_time <= '2022-08-05'
GROUP BY user_id, song_id
)

SELECT user_id, song_id, SUM(song_plays) AS song_plays
FROM history
GROUP BY user_id, song_id
ORDER BY song_plays DESC;


