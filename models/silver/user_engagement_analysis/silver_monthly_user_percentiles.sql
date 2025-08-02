SELECT
  mon_year,
  MAX(CASE WHEN rn = CAST(cnt * 0.75 AS INT) THEN engagement_score END) AS p75,
  MAX(CASE WHEN rn = CAST(cnt * 0.50 AS INT) THEN engagement_score END) AS p50
FROM 
  {{ref('silver_monthly_user_ranked')}}
GROUP BY 
  mon_year
