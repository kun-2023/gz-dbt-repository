select
o.orders_id,
o.date_date,
o.margin,
s.shipping_fee,
s.log_cost,
s.ship_cost,
cast(ship_cost as float64) as ship_cost,
round(o.margin+s.shipping_fee-s.log_cost-cast(s.ship_cost as float64),2) as operational_margin
from 
{{ref("int_orders_margin")}} o
left join
{{ref("stg_gz_raw_data__ship")}} s
using(orders_id)
order by orders_id desc