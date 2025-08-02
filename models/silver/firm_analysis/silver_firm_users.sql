select
  id as user_id,
  strftime('%m-%Y', created) as signup_month
from 
  {{ ref('bronze_users') }}