SELECT
  *,
  ROW_NUMBER() OVER (PARTITION BY mon_year ORDER BY engagement_score) AS rn,
  COUNT(*)      OVER (PARTITION BY mon_year) AS cnt
FROM 
  {{ref('silver_monthly_user_engagement_scores')}}