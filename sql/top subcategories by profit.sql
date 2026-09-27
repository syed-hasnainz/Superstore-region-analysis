-- Top 5 sub-categories by total profit
SELECT
    "Sub-Category",
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2)  AS total_sales,
    COUNT(*)              AS order_lines
FROM orders
GROUP BY "Sub-Category"
ORDER BY total_profit DESC
LIMIT 5;
