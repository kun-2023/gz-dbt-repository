with a as(
    select date_date,
    count(distinct orders_id) as nb_transactions,
    round(sum(revenue),0) as revenue,
    round(sum(margin),0) as margin,
    round(sum(operational_margin),0) as operational_margin,
    round(sum(purchase_cost),0) as purchase_cost,
    round(sum(ship_cost)) as ship_cost,
    round(sum(logcost)) as log_cost,
    round(sum(shipping_fee)) as shipping_fee,
    sum(quantity) as quantity
    from {{ref("int_orders_operational")}}
    group by date_date)
select *,
revenue/nullif(nb_transactions,0) as avg_basket
from a
order by date_date desc;