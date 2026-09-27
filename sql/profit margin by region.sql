-- Profit margin by region
SELECT
    Region,
    ROUND(SUM(Sales), 2)                        AS total_sales,
    ROUND(SUM(Profit), 2)                        AS total_profit,
    ROUND(SUM(Profit) * 1.0 / SUM(Sales), 4)      AS profit_margin
FROM orders
GROUP BY Region
ORDER BY profit_margin ASC;
