with 

source as (

    select * from {{ source('gz_raw_data', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        -- shipping_fee_1,
        logcost,
        cast(ship_cost as float64) as ship_cost,
        shipping_fee-shipping_fee_1 as fee_differences

    from source
    where shipping_fee<>shipping_fee_1

)

select * from renamed