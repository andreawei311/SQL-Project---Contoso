SELECT
    cohort_year,
    SUM(total_net_revenue) AS cohort_revenue,
    COUNT(DISTINCT customerkey) AS customer_count,
    SUM(total_net_revenue) / COUNT(DISTINCT customerkey) AS avg_customer_revenue
FROM cohort_analysis
GROUP BY cohort_year