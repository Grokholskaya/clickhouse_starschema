# 1. Configure ClickHouse cluster

Кластер создан через консоль

# 2. Configure database connection

## **dbt**

```yml
clickhouse_starschema:
  target: dev
  outputs:
    dev:
      type: clickhouse
      schema: dbt
      host: c-<ID>.rw.mdb.yandexcloud.net
      port: 8443
      user: user1
      password: <pwd>
      secure: True
```      

# 3. Configure dbt project & run queries

Push Git repo with dbt project to Github:
- external tables to S3
- sources.yml
- base tabes
- wide table
- tests and docs for models

https://clickhouse.tech/docs/en/getting-started/example-datasets/star-schema/

Send results of queries: 
- Q2.1
- Q3.3
- Q4.2

# (optional) Creating source tables with dbt macro

`dbt run-operation init_s3_sources`
Find a way how to cope with error: `Multi-statements are not allowed`