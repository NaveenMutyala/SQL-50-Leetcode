select
machine_id,
Round(
    AVG(
        CASE
            WHEN activity_type = 'start' then -timestamp
            ELSE timestamp
        END
    )*2
,3) as processing_time
from Activity
group by 1

-- or

select a1.machine_id as machine_id ,round(avg(a2.timestamp-a1.timestamp),3) as processing_time
from Activity a1,Activity a2
where a1.machine_id=a2.machine_id and a1.process_id=a2.process_id and 
a1.activity_type="start" and a2.activity_type="end"
group by a1.machine_id


