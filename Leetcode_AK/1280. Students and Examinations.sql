with t1 as (
select
a.student_id,
a.student_name,
b.subject_name
from Students a
join Examinations b on a.student_id = b.student_id
),
t2 as (
select
student_id,
student_name,
subject_name,
count(*) attended_exams
from t1
group by student_id,student_name,subject_name
order by student_id,student_name),
tb as (
select
a.student_id,
a.student_name,
c.subject_name
from Students a,Subjects c
order by a.student_id, a.student_name
)
select
a.student_id,
a.student_name,
a.subject_name,
case when a.student_id = b.student_id and a.student_name=b.student_name and a.subject_name=b.subject_name then b.attended_exams else 0 end attended_exams
from tb a
left join t2 b on a.student_id = b.student_id and a.student_name=b.student_name and a.subject_name=b.subject_name
order by a.student_id,a.student_name,a.subject_name