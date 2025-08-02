SELECT
  *,
  (sessions - MIN(sessions)   OVER (PARTITION BY mon_year))
  / NULLIF(MAX(sessions)   OVER (PARTITION BY mon_year)
          - MIN(sessions)   OVER (PARTITION BY mon_year),0)
    AS norm_sessions,

  (active_days - MIN(active_days) OVER (PARTITION BY mon_year))
  / NULLIF(MAX(active_days) OVER (PARTITION BY mon_year)
          - MIN(active_days) OVER (PARTITION BY mon_year),0)
    AS norm_active_days,

  (avg_docs_per_active_day - MIN(avg_docs_per_active_day) OVER (PARTITION BY mon_year))
  / NULLIF(MAX(avg_docs_per_active_day) OVER (PARTITION BY mon_year)
          - MIN(avg_docs_per_active_day) OVER (PARTITION BY mon_year),0)
    AS norm_docs,

    (num_event_types - MIN(num_event_types) OVER (PARTITION BY mon_year))
  / NULLIF(MAX(num_event_types) OVER (PARTITION BY mon_year)
          - MIN(num_event_types) OVER (PARTITION BY mon_year),0)
    AS norm_features

FROM 
  {{ref('silver_monthly_user_agg')}}