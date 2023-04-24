{% snapshot USER %}
{{
    config(
      target_database='TRANSFORMATION',
      target_schema='MODEL',
      unique_key='ID',
      strategy='check',
      check_cols=["USERNAME","FIRSTNAME","DEPARTMENT","CITY"]
    )
}}
select *
 from {{ source('PC_DBT_DB', 'USER') }}
{% endsnapshot %}