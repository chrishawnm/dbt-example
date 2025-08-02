select
  *,
  strftime('%m-%Y', created) as mon_year
from 
  {{ ref('bronze_events') }}