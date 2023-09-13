with t1 as (
select
a.id,
a.recordDate,
a.temperature,
b.temperature temppre,
b.id as preid
from weather a
left join weather b
on a.recordDate -1 = b.recordDate
)
select
id ID
from t1
where temperature > temppre