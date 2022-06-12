{{
    config (
      engine='MergeTree()',
      order_by=['LO_ORDERDATE', 'LO_ORDERKEY']
    )
}}

select * from {{ source('db1', 'lineorder') }} LIMIT 1000000