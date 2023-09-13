with t1 as (
select
a.empId,
a.name,
b.bonus
from Employee a
left join Bonus b on a.empId = b.empId
)
select
name,
bonus
from t1
where empId not in (select empId from t1 where bonus >= 1000)