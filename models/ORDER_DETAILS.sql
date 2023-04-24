{{
    config(
        materialized='table'
    )
}}
with source as(
        select * from {{source('PC_DBT_DB','ORDER_DETAILS')}}

) ,
ORDERS as
(
    select 
        ORDER_KEY,
        ORDER_ID ,
        CUSTOMER_ID ,
        BILLINGCITY ,
        SHIPPINGCITY ,
        AMOUNT ,
        STATUS 
    from source
)
select * from ORDERS
