SELECT
  *,
  norm_sessions    * 0.3
  + norm_active_days * 0.3
  + norm_docs   * 0.2
  + norm_features * 0.2
    AS engagement_score
FROM 
  {{ref('silver_monthly_user_normalized')}}
