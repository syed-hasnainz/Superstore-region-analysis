-- The key query: how discount level erodes profit, broken out by region
-- This is where the "why is a region underperforming" answer usually lives
SELECT
    Region,
    CASE
        WHEN Discount = 0 THEN '0% (no discount)'
        WHEN Discount <= 0.2 THEN '1-20%'
        WHEN Discount <= 0.4 THEN '21-40%'
        ELSE '41%+'
    END AS discount_band,
    ROUND(SUM(Sales), 2)                       AS total_sales,
    ROUND(SUM(Profit), 2)                       AS total_profit,
    ROUND(SUM(Profit) * 1.0 / SUM(Sales), 4)     AS profit_margin,
    COUNT(*)                                    AS order_lines
FROM orders
GROUP BY Region, discount_band
ORDER BY Region, discount_band;
