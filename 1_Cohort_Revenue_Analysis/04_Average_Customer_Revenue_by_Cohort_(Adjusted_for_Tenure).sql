WITH tenure AS (
    SELECT
        cohort_year,
        customerkey,
        total_net_revenue,
        orderdate - MIN(orderdate) OVER (PARTITION BY customerkey) AS tenure_days
    FROM cohort_analysis
)

SELECT 
    cohort_year,
    tenure_days,
    SUM(total_net_revenue) AS cohort_revenue,
    SUM(total_net_revenue) / (SELECT SUM(total_net_revenue) FROM cohort_analysis) * 100 as percentage_of_total_revenue,
    SUM(SUM(total_net_revenue) / (SELECT SUM(total_net_revenue) FROM cohort_analysis) * 100) OVER (ORDER BY tenure_days) as cumulative_percentage_of_total_revenue
FROM tenure
GROUP BY cohort_year, tenure_days
ORDER BY cohort_year, tenure_days
