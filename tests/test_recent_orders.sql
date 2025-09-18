{{
    config(
        severity='ERROR'
    )
}}
WITH invalid_rows AS (
    select * from {{ ref('mart_cust_orders') }}
    WHERE YEAR(order_date) <> 1995 OR totalprice < 0
)
SELECT * FROM invalid_rows