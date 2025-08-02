select
  cohort_month,
  activity_month,
  count(distinct user_id) as active_users,        
  avg(total_events) as avg_events_per_user,  
  avg(total_docs) as avg_docs_per_user
from {{ref('silver_signup_cohorts_usage_by_periods')}}
group by 1,2
order by 1,2