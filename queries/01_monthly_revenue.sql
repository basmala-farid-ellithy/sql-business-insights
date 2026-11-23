-- Q1: Monthly revenue trend
SELECT substr(date, 1, 7) AS month, ROUND(SUM(total), 2) AS revenue
FROM sales GROUP BY month ORDER BY month;
