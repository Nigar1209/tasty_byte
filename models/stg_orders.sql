select
    o_orderkey as order_id,
    o_custkey as cust_id,
    o_totalprice as totalprice,
    o_orderdate as order_date
from snowflake_sample_data.tpch_sf100.orders
where year(o_orderdate) = 1995
