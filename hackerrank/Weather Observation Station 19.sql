-- Problem link: https://www.hackerrank.com/challenges/weather-observation-station-19
-- Problem Difficulty: Medium
SELECT FORMAT(SQRT(POW((MAX(LONG_W)- MIN(LONG_W)), 2) + (POW((MAX(LAT_N)- MIN(LAT_N)), 2))), 4)
FROM Station
