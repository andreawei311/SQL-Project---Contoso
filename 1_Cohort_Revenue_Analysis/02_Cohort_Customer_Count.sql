WITH customer_cohort AS (
SELECT DISTINCT 
    customerkey,
    EXTRACT(YEAR FROM MIN(orderdate) OVER (PARTITION BY customerkey)) as cohort_year,
    EXTRACT(YEAR FROM orderdate) AS order_year
FROM sales
)

SELECT 
    cohort_year,
    order_year,
    COUNT(customerkey) AS customer_count
FROM customer_cohort
GROUP BY cohort_year, order_year
ORDER BY cohort_year, order_year

