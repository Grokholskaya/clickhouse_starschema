{{
    config (
      engine='MergeTree()',
      order_by=['S_SUPPKEY']
    )
}}

select * from {{ source('db1', 'supplier') }}