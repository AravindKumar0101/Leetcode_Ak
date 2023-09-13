with t1 as (
select
a.machine_id,
a.process_id,
b.timestamp-a.timestamp timep
from (select machine_id, process_id, timestamp from Activity
where activity_type = 'start') a
join (select machine_id, process_id, timestamp from Activity where
activity_type = 'end') b
on a.machine_id = b.machine_id
and a.process_id = b.process_id
)
select
machine_id,
round(sum(timep)/count(distinct process_id),3) processing_time
from t1
group by machine_id
