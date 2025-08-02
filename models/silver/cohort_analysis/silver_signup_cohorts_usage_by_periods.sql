select
    sc.cohort_month,
    date(strftime('%Y-%m-01', e.created)) as activity_month,
    e.user_id,
    count(*)                  as total_events,
    sum(e.num_docs)           as total_docs
from 
  {{ref('bronze_events')}} e
join 
  {{ref('silver_signup_cohorts')}} sc
on 
  e.user_id = sc.user_id
group by 
  1,2,3