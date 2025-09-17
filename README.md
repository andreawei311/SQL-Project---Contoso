# SQL Project: Revenue and Customer Behavior Analysis

## Overview

Contoso Corporation ("Contoso") is a fictional multi-national business. It is a "manufacturing, sales, and support organization with more than 100,000 products." (https://learn.microsoft.com/en-us/microsoft-365/enterprise/contoso-overview?view=o365-worldwide)

In this project, I assumed the position of Data Analyst at Contoso. With the goal of maximizing revenue, I analyzed customer behavior and customer retention.

## Objectives

I sought to answer the following questions:

1. How does cohort year affect customer behaviors (Cohort Revenue Analysis);
2. Identify the most valuable customers (Customer Segmentation Analysis); and 
3. Which groups of customers are more likely to churn (Retention Analysis).

## Data Cleanup

**Query: [view_cohort_analysis](view_cohort_analysis.sql)**

- Identified first purchase dates for cohort analysis
- Consolidated sales and customer data into revenue-focused metrics
- Combined transaction and customer details into a single view

## Analysis

I took two steps in each of the three analyses:

- Step One: **Query Data** using SQL
- Step Two: **Further Aggregate Results and Create 📈 Visualization** in Tableau 

### 💡 Cohort Revenue Analysis

Query Folder: **[1_Cohort_Revenue_Analysis](1_Cohort_Revenue_Analysis)**

1. Defined cohorts based on the year of first order (Query: [01_Cohort_Revenue](1_Cohort_Revenue_Analysis/01_Cohort_Revenue.sql)).
2. Monitored revenue and customer counts across cohorts (Query: [02_Cohort_Customer_Count.sql](1_Cohort_Revenue_Analysis/02_Cohort_Customer_Count.sql)).
3. Conducted revenue analysis at the cohort level \
(Queries: [03_Average_Customer_Revenue_by_Cohort](1_Cohort_Revenue_Analysis/03_Average_Customer_Revenue_by_Cohort.sql); [04_Average_Customer_Revenue_by_Cohort_(Adjusted_for_Tenure)](1_Cohort_Revenue_Analysis/04_Average_Customer_Revenue_by_Cohort_(Adjusted_for_Tenure).sql)).

**Visualizations** 

**📈 Plot 1** (View in Tableau: [Plot_1](https://public.tableau.com/views/CohortAnalysis_17568466486670/AnnualCohortRevenues?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)) \
<img src="Annual Cohort Revenues.png" alt="" width="70%">

**Key Findings:**
 - Customers tend to spend the most during their first year; spending declines over time.
 - A drastic decline in revenue is typically followed by an uptick two years after (see total revenues in 2016 vs. 2018, as well as 2020 vs. 2022).

**Insights & Recommendations:**
- Retention campaigns (e.g., loyalty programs, point rewards) may help sustain spending beyond the first year.
- Reactivation campaigns around the 18–24 month mark may accelerate the revenue rebound.

**📈 Plot 2** (View in Tableau: [Plot_2](https://public.tableau.com/views/CohortAnalysis_17568466486670/CohortYearImpactonCustomerGrowth?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)) \
<img src="Cohort Year Impact on Customer Growth.png" alt=" " width="70%">

**📈 Plot 3** (View in Tableau: [Plot_3](https://public.tableau.com/views/CohortAnalysis_17568466486670/CohortRevenuesPerYear?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) \
<img src="Average Annual Cohort Revenues.png" alt=" " width="70%">

**Key Findings:**
- Customers from earlier cohorts tend to spend more (On average, the 2015-2019 cohorts have spent $4500 on average, while the 2020-2024 cohorts have spent under $4000), although
- Although customer volume rose between 2020 and 2022, average annual spending per customer continued to decrease.
- The average annual cohort revenues of recent cohorts appear to be considerably higher than those of earlier cohorts.

**Insights & Recommendations:**
- It may be necessary to reassess pricing strategies - some products might have been underpriced (which might explain why in 2022, the company gained the most customers, but the average customer spending was low).
- The end of the Covid-19 pandemic may have encouraged customers' spending; some tests may be necessary to see which incentives and/or factors can lift average spending.

**📈 Plot 4** (View in Tableau: [Plot_4](https://public.tableau.com/views/CohortAnalysis_17568466486670/RevenueDistributionSinceFirstOrder?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) \
<img src="Revenue Distribution Since First Order.png" alt=" " style="width:70%; height:350">

**Finding & Recommendation:**
- Most customers spend very little (if any) after their first purchase, indicating that customer retention is weak.
- We need to explore how we can boost customer retention.

### 💡 Customer Segmentation Analysis

Query Folder: **[2_Customer_Segmentation_Analysis](2_Customer_Segmentation_Analysisis)**

1. Calculated each customer's total lifetime value (LTV) and categorized customers into four age groups (Query: [01_Customer_LTV](2_Customer_Segmentation_Analysis/01_Customer_LTV.sql)).
2. Assigned customers to High, Mid, and Low-value segments based on LTV (Query: [02_Segments](2_Customer_Segmentation_Analysis/02_Segments.sql)).
3. Calculated key metrics such as total and average LTV, grouped by segment and age group (Query: [03_Segmentation_Analysis](2_Customer_Segmentation_Analysis/03_Segmentation_Analysis.sql)).

**Visualizations** 

**📈 Plot 5** (View in Tableau: [Plot_5](https://public.tableau.com/views/CustomerLTV_17568471899110/TotalLTVbyAgeGroup?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) \
<img src="Total LTV by Age Group.png" alt=" " style="width:70%; height:500">

**Key Findings:**
- The youngest customers (under 25) have the lowest total LTV, while senior customers (55 or older) have the highest, consistent with the progression of age.
- Average customer tenure (in days) remains stable across age groups.

**Insights & Recommendations:**
- Total LTV of an age group is nearly unaffected by customer tenure, indicating that older customers simply spend more money on each purchase.
- It may be helpful to increase product update/innovation in order to boost the LTV of younger customers.

**📈 Plot 6** (View in Tableau: [Plot_6](https://public.tableau.com/views/CustomerLTV_17568471899110/CustomerCount?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) \
<img src="Customer Count.png" alt=" " width="70%">

**📈 Plot 7** (View in Tableau: [Plot_7](https://public.tableau.com/views/CustomerLTV_17568471899110/TotalLTVbySegment?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) \
<img src="Total LTV by Segment.png" alt=" " style="width:70%; height:400">

**📈 Plot 8** (View in Tableau: [Plot_8](https://public.tableau.com/views/CustomerLTV_17568471899110/LTVPercentagebySegment?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) \
<img src="LTV Percentage by Segment.png" alt=" " style="width:70%; height:400;">

**Key Findings:**
- There are more customes in the mid-value group than the other two; such a trend is consistently obeserved across all age groups.
- Senior customers form the largest customer group, followed by middle-age customers (35-45); this is consistent with the trending across all segments.

**Insights & Recommendations:**
- Since the mid value group is the largest across all age groups, we should prioritize marketing, retention, and upsell strategies toward this segment to maximize revenue impact.
- Senior customers form the largest age group, so we can develop products, services, or messaging that specifically appeal to their preferences and needs.
- It may be helpful to consider streamlining support or marketing efforts for low-value customers to improve overall efficiency; or
- Assess whether offerings can be tailored or simplified to better meet the needs of the low-value customers at lower cost, potentially increasing engagement without heavy investment; or
- Alternatively, we can focus resources on higher-value segments while maintaining minimal engagement with low-value customers.
- As to the high-value customers, we need to prioritize customer service and support for this segment to maintain satisfaction and loyalty.

### 💡 Retention Analysis

For each cohort year:

1. Calculated how many customers remain active and how many have churned (Query: [01_Customer_Status](3_Retention_Analysis/01_Customer_Status.sql)); and 
2. Calculated the percentages of active and churned customers (Query: [02_Retention_Analysis](3_Retention_Analysis/02_Retention_Analysis.sql)).

**Visualizations** 

**📈 Plot 9** (View in Tableau: [Plot_9](https://public.tableau.com/views/RetentionAnalysis_17568552147410/CustomerStatus?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) \
<img src="Customer Status.png" alt=" " style="width:70%; height:400">

**📈 Plot 10** (View in Tableau: [Plot_10](https://public.tableau.com/views/RetentionAnalysis_17568552147410/StatusPercentage?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)) \
<img src="Status Percentage.png" alt=" " style="width:70%; height:400;">

**Key Findings:**
- Churn rates are relatively consistent across all cohorts.
- It appears that the Covid-19 pandemic did not negatively affect customer loyalty.

**Insights & Recommendations:** \
To reduce customer churn, the following method may be helpful:
- Use targeted campaigns (email, in-app, SMS) to encourage repeat purchases.
- Closely track the behavior, value, or lifecycle of each customer segment and tailor communications accordingly.
- Introduce loyalty programs or tiered rewards to incentivize ongoing activity.

## Tools
**Database:** PostgreSQL \
**Analysis Tools:** PostgreSQL, Visual Studio Code \
**Visualization:** Tableau