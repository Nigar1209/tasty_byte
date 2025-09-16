
select
    l_orderkey as order_id,
    l_partkey as part_id,
    l_quantity as quantity,
    l_shipdate as ship_date
from snowflake_sample_data.tpch_sf100.lineitem
where year(l_shipdate) = 1995
