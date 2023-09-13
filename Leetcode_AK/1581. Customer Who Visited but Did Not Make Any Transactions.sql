with t1 as (
select
visit_id,
customer_id
from Visits
where visit_id not in (select distinct visit_id from Transactions)
)
select
customer_id,
count(*) count_no_trans
from t1
group by customer_id