WITH customer_cohort AS (
SELECT DISTINCT 
    customerkey,
    EXTRACT(YEAR FROM MIN(orderdate) OVER (PARTITION BY customerkey)) as cohort_year
FROM sales
)

SELECT
    cc.cohort_year,
    EXTRACT(YEAR FROM s.orderdate) AS order_year,
    SUM(s.quantity * s.netprice * s.exchangerate) AS net_revenue
FROM sales s 
LEFT JOIN customer_cohort cc on s.customerkey = cc.customerkey
GROUP BY cc.cohort_year, order_year
ORDER BY cc.cohort_year, order_year

