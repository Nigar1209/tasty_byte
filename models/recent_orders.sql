{{ config(materialized="incremental") }}
with
    recent_orders as (
        select dateadd(year, 31, o_orderdate) as order_date,
            SUM(O_TOTALPRICE) AS total_revenue,
            COUNT(O_ORDERKEY) AS total_orders
        from snowflake_sample_data.tpch_sf100.orders
        WHERE YEAR(o_orderdate) = 1994
        GROUP BY 1
    )
select order_date, total_revenue, total_orders
from recent_orders
{% if is_incremental() %}
 WHERE  order_date BETWEEN CURRENT_DATE - INTERVAL '29 days' AND CURRENT_DATE
{% endif %}
ORDER BY order_date