select *
from {{ref("stg_gz_raw_data__sales")}} s
join {{ref("stg_gz_raw_data__product")}} p
using (products_id)
