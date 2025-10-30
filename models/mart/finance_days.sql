with a as
(select 
s.date_date,-- Date
count(s.orders_id) as nb_transactions -- Total number of transactions
sum(s.revenue) as revenue-- Total revenue
sum(s.quantity)/count(distinct orders_id) as avg_basket-- Average Basket
sum(s.purchase_cost) as purchase_cost --Total Purchase Cost
from {{ref("int_sales_margin")}} s
group by date_date),
b as(select 
m.date_date,
sum(o.operational_margin) as Operational_margin,-- Operational Margin
sum(o.shipping_fee) as shipping_cost-- Total shipping fees
sum(logcost) as log_cost-- Total log costs
sum(m.quantity) as total_quantity-- Total quantity of products sold.
from 
{{ref("int_orders_margin")}} m
left join 
{{ref("int_orders_operational")}} o
using(orders_id)
group by m.date_date
)
select a.date_date, a.nb_transactions, a.revenue, a.avg_basket,a.purchase_cost,b.Operational_margin,b.shipping_cost,
b.log_cost,b.total_quantity
from
a left join b using(date_date)
left join 
group by a.date_date;