with source as(
    select * from {{ ref('ORDER_test' )}}
),
TOTAL_ORDER as (
select
    ORDER_ID,
    sum(AMOUNT) as TOTAL_AMOUNT
from source
group by ORDER_KEY
having TOTAL_AMOUNT > 0
)
select * from TOTAL_ORDER
