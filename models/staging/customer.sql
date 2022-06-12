{{
    config (
      engine='MergeTree()',
      order_by=['C_CUSTKEY']
    )
}}
select C_CUSTKEY, C_NAME, C_ADDRESS, C_CITY, C_NATION, C_REGION, C_PHONE, C_MKTSEGMENT 
from {{ source('db1', 'customer') }}