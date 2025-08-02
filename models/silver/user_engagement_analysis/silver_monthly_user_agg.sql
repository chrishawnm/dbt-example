select 
    a.*,
    active_days,
    total_docs/active_days as avg_docs_per_active_day
from 
    {{ref('silver_monthly_user_data_metrics1')}} a
join 
    {{ref('silver_monthly_user_data_metrics2')}} b
on 
    a.mon_year = b.mon_year
and 
    a.user_id = b.user_id
