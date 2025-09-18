{{
    config(
        materialized='table'
    )
}}
select o.order_id, o.cust_id, o.totalprice, l.quantity, l.part_id,o.order_date
from {{ ref("stg_orders") }} o
join {{ ref("stg_lineitem") }} l on o.order_id = l.order_id
