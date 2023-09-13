select
b.product_name,
a.year,
a.price
from Sales a
left join Product b on a.product_id = b.product_id