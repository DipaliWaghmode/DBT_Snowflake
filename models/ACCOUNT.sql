with ACCOUNT_DATA as(
        select * from {{source('PC_DBT_DB','ACCOUNT')}}

),
staged_data as(
select 
    ACCOUNT_KEY,
    ID ,
    NAME,
    BILLINGCITY,
    SHIPPINGCITY,
    PHONE
from ACCOUNT_DATA
)
select * from staged_data

