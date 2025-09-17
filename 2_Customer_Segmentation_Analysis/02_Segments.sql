WITH customer_ltv AS (
    SELECT
        customerkey,
        fullname,
        CASE
            WHEN age < 25 THEN 'Under 25'
            WHEN age <= 35 AND age >= 25 THEN '25-35'
            WHEN age <= 45 AND age > 35 THEN '35-45'
            WHEN age <= 55 AND age > 45 THEN '35-45'
            ELSE 'Senior (>55)'
        END AS age_group,
        SUM(total_net_revenue) AS total_ltv
    FROM cohort_analysis
    GROUP BY 
        customerkey,
        fullname,
        age_group
),

ltv_percentiles AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_ltv) AS ltv_25th_percentile,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_ltv) AS ltv_75th_percentile
    FROM customer_ltv
)

SELECT
    c.customerkey,
    c.fullname,
    c.age_group,
    c.total_ltv,
    CASE
        WHEN c.total_ltv < lp.ltv_25th_percentile THEN '1 - Low-Value'
        WHEN c.total_ltv BETWEEN lp.ltv_25th_percentile AND lp.ltv_75th_percentile THEN '2 - Mid-Value'
        ELSE '3 - High-Value'
    END AS customer_segment
FROM customer_ltv c, ltv_percentiles lp
