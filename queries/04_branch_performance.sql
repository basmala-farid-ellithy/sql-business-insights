-- Q4: Branch comparison with peak shopping hour
SELECT city,
       ROUND(SUM(total), 2) AS revenue,
       COUNT(DISTINCT invoice_id) AS invoices,
       (SELECT CAST(substr(s2.time, 1, 2) AS INTEGER) FROM sales s2
        WHERE s2.city = s.city GROUP BY substr(s2.time, 1, 2)
        ORDER BY SUM(s2.total) DESC LIMIT 1) AS peak_revenue_hour
FROM sales s GROUP BY city ORDER BY revenue DESC;
