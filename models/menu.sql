{{
    config(
        materialized='table'
    )
}}

select * ,
(SALE_PRICE_USD - COST_OF_GOODS_USD) AS PROFIT_MARGIN_USD from tasty_bytes_sample_data.raw_pos.menu