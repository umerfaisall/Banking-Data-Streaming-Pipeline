{{config(materialized='view')}}
select 
    v:id::string as transaction_id,
    v:account_id::string as account_id,
    v:txn_type::string as txn_type,
    v:amount::float as amount,
    v:related_account_id::string as related_account_id,
    v:status::string as status,
    v:created_at::timestamp as created_at,
    current_timestamp() as load_timestamp,
from  {{source('raw','transactions')}}
