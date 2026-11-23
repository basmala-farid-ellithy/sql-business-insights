-- Q3: Member vs normal customers - spend, frequency, rating
SELECT customer_type,
       COUNT(*) AS transactions,
       ROUND(SUM(total), 2) AS revenue,
       ROUND(AVG(total), 2) AS avg_spend,
       ROUND(AVG(rating), 2) AS avg_rating
FROM sales GROUP BY customer_type;
