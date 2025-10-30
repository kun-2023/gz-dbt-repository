select
o.orders_id,
o.date_date,
o.quantity,
o.revenue,
o.purchase_cost,
o.margin,
s.shipping_fee,
s.logcost,
s.ship_cost,
round(o.margin+s.shipping_fee-s.logcost-s.ship_cost,2) as operational_margin
from 
{{ref("int_orders_margin")}} o
left join
{{ref("stg_gz_raw_data__ship")}} s
using(orders_id)
order by orders_id desc