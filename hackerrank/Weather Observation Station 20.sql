-- Problem link: https://www.hackerrank.com/challenges/weather-observation-station-20
-- Problem Difficulty: Medium
SELECT ROUND(MEDIAN(LAT_N), 4)
FROM STATION
ORDER BY LAT_N
