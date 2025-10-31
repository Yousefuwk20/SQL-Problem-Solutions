-- Problem link: https://www.hackerrank.com/challenges/weather-observation-station-18
-- Problem Difficulty: Medium
SELECT ROUND(ABS(MAX(LONG_W) - MIN(LONG_W)) + ABS(MAX(LAT_N ) - MIN(LAT_N)), 4)
FROM Station
