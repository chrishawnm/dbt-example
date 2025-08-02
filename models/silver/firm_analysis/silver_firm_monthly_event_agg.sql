select
  firm_id,
  mon_year,
  count(*) as events,
  count(distinct user_id) as active_users,
  sum(num_docs) as total_docs,
  avg(num_docs) as avg_docs_per_event,
  avg(feedback_score) as avg_feedback_score,
  sum(case when event_type = 'WORKFLOW' then 1 else 0 end) as workflow,
  sum(case when event_type = 'VAULT' then 1 else 0 end) as vault,
  sum(case when event_type = 'ASSISTANT' then 1 else 0 end) as assistant
from 
  {{ ref('silver_firm_events') }}
group by 
  1, 2
