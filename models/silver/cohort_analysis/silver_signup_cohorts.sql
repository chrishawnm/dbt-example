  select
    user_id,
    date(strftime('%Y-%m-01', min(created))) as cohort_month  
  from 
    {{ref('bronze_events')}}
  group by 
    1