SELECT
  r.mon_year as mon_year,
  user_id,
  CASE
    WHEN r.engagement_score >= p.p75 THEN 'High'
    WHEN r.engagement_score >= p.p50 THEN 'Medium'
    ELSE 'Low'
  END AS engagement_tier
FROM {{ref('silver_monthly_user_ranked')}} r
JOIN {{ref('silver_monthly_user_percentiles')}} p
  ON r.mon_year = p.mon_year