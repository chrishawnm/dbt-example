with events as (
  select distinct user_id, firm_id from {{ ref('silver_firm_events') }}
),
users as (
  select * from {{ ref('silver_firm_users') }}
)
select
  e.firm_id,
  u.signup_month
from 
  events e
left join 
  users u 
on 
  e.user_id = u.user_id
group by
  1,2