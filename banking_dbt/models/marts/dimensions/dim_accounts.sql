{{config(materialized='table')}}
with source_data as (
    select 
        account_id,
        customer_id,
        account_type,
        balance,
        currency,
        created_at,
        dbt_valid_from as effective_from,
        dbt_valid_to as effective_to,
        CASE WHEN dbt_valid_to IS NULL THEN TRUE ELSE FALSE END as is_current
        FROM {{ref('accounts_snapshot')}}
)
select * from source_data