WITH orders AS (
    SELECT
        cohort_year,
        customerkey,
        fullname,
        age,
        orderdate,
        ROW_NUMBER() OVER (PARTITION BY customerkey ORDER BY orderdate DESC) AS order_index,
        first_purchase_date
    FROM cohort_analysis
)

SELECT
    cohort_year,
    customerkey,
    fullname,
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age <= 35 AND age >= 25 THEN '25-35'
        WHEN age <= 45 AND age > 35 THEN '35-45'
        WHEN age <= 55 AND age > 45 THEN '35-45'
        ELSE 'Senior (>55)'
        END AS age_group,
    orderdate AS last_order_date,
    CASE
        WHEN orderdate < '2024-04-20'::date - INTERVAL '6 months' THEN 'Churned'
        ELSE 'Active'
        END AS customer_status
FROM orders
WHERE order_index = 1 AND first_purchase_date < (SELECT MAX(orderdate) FROM sales)::date - INTERVAL '6 months'