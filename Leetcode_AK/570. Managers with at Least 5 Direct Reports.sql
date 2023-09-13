with t1 as (
select
managerId,
count(id) cnt
from Employee
where managerId is not null
group by managerId
)
select
a.name
from Employee a
join t1 b
on a.id = b.managerId
and b.cnt >= 5