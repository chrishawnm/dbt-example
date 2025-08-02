select 
    strftime('%m-%Y', created) as mon_year,
    user_id,
    sum(active_day) as active_days
from 
    (
    select 
        created,
        user_id,
        case when sum(num_docs) > 1 then 1 else 0 end as active_day
    from 
        {{ref('bronze_events')}} rec
    group by 
        1,2
    ) a
group by 
    1,2
order by 
    3 desc