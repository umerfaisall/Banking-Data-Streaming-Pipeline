{{config(materialized='incremental',unique_key='transaction_id')}}
select 
    t.transaction_id,
    t.account_id,
    a.customer_id,
    t.amount,
    t.related_account_id,
    t.status,
    t.txn_type as trnasaction_type,
    t.created_at as transaction_time,
    current_timestamp AS load_timestamp,
from {{ref('staging_transactions')}} t
LEFT JOIN {{ ref('staging_accounts')}} a
ON t.account_id = a.account_id
