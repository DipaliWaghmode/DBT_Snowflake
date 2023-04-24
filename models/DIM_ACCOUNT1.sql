{{
    config(
        materialized='incremental',
        unique_key='ACCOUNT_KEY'
    )
}}
with events as(
    select * from  {{source('PC_DBT_DB', 'ACCOUNT')}}
    {% if is_incremental() %}
    {{ log("This is an incremental run", info=True) }}
    where DBT_UPDATED_AT >= (select max(DBT_UPDATED_AT) from {{this}} )
    {% endif %}
)
select * from events
