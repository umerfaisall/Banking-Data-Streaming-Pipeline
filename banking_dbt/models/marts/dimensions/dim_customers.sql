{{ config(materialized='table')}}
with latest as (
    select 
        customer_id,
        first_name,
        last_name,
        email,
        created_at,
        dbt_valid_from as effective_from,
        dbt_valid_to as effective_to,
        CASE WHEN dbt_valid_to IS NULL THEN TRUE ELSE FALSE END as is_current
        FROM {{ref('customers_snapshot')}}
)
select * from latest

