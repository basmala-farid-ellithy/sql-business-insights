-- Q2: Product lines ranked by revenue and gross income, with average basket size
SELECT product_line,
       ROUND(SUM(total), 2) AS revenue,
       ROUND(SUM(gross_income), 2) AS gross_income,
       ROUND(AVG(quantity * unit_price), 2) AS avg_basket
FROM sales GROUP BY product_line ORDER BY revenue DESC;
