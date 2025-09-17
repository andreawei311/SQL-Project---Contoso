WITH tenure AS (
    SELECT
        cohort_year,
        customerkey,
        total_net_revenue,
        orderdate - MIN(orderdate) OVER (PARTITION BY customerkey) AS tenure_days
    FROM cohort_analysis
)

SELECT
    ca.customerkey,
    ca.fullname,
    CASE
        WHEN ca.age < 25 THEN 'Under 25'
        WHEN ca.age <= 35 AND ca.age >= 25 THEN '25-35'
        WHEN ca.age <= 45 AND ca.age > 35 THEN '35-45'
        WHEN ca.age <= 55 AND ca.age > 45 THEN '35-45'
        ELSE 'Senior (>55)'
    END AS age_group,
    t.tenure_days,
    SUM(ca.total_net_revenue) AS total_ltv
FROM cohort_analysis ca
LEFT JOIN tenure t on ca.customerkey = t.customerkey
GROUP BY 
    ca.customerkey,
    ca.fullname,
    age_group,
    t.tenure_days
