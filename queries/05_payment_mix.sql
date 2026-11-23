-- Q5: Payment method mix by customer type
SELECT payment, customer_type,
       COUNT(*) AS transactions,
       ROUND(SUM(total), 2) AS revenue,
       ROUND(100.0 * SUM(total) / SUM(SUM(total)) OVER (PARTITION BY customer_type), 1) AS pct_of_type_revenue
FROM sales GROUP BY payment, customer_type ORDER BY customer_type, revenue DESC;
