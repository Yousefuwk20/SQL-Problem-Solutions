-- Problem link: https://datalemur.com/questions/non-profitable-drugs

SELECT 
    manufacturer,
    COUNT(drug),
    ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC

