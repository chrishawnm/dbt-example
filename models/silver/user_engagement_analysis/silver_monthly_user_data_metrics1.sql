select 
    strftime('%m-%Y', created) as mon_year,user_id,
    count(created) as sessions, 
    count(distinct(event_type)) as num_event_types,
    sum(num_docs) as total_docs,
    group_concat(distinct event_type) as types,
    round(sum(num_docs)*1.0/count(created),2) as avg_docs_per_session,
    max(date(created)) as last_day,
    AVG(feedback_score) as avg_feedback_score  ,
    SUM(CASE WHEN feedback_score >= 4 THEN 1 ELSE 0 END) / COUNT(*) as pct_good_feedback 
FROM 
    {{ref('bronze_events')}} rec
group by 1,2