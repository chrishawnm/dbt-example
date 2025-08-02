with event_agg as (
  select * from {{ ref('silver_firm_monthly_event_agg') }}
),
new_users as (
  select * from {{ ref('silver_firm_new_monthly_users') }}
),
firms as (
  select * from {{ ref('bronze_firms') }}
)
select 
  e.mon_year,
  f.id as firm_id,
  f.firm_size,
  f.arr_in_thousands,
  e.active_users,
  e.events,
  e.total_docs,
  e.avg_docs_per_event,
  e.avg_feedback_score,
  e.workflow,
  e.vault,
  e.assistant,
  e.total_docs / nullif(e.active_users, 0) as avg_docs_per_user,
  f.arr_in_thousands / nullif(e.total_docs, 0) as arr_per_doc,
  f.arr_in_thousands / nullif(e.active_users, 0) as arr_per_active_user
from 
  event_agg e
left join 
  firms f 
on 
  e.firm_id = f.id
left join 
  new_users n 
on 
  e.firm_id = n.firm_id 
and 
  e.mon_year = n.signup_month
order by 
  1,2
