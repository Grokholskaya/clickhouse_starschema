# 1. Configure ClickHouse cluster with CLI

`yc managed-clickhouse cluster help`


Docs: [yc managed-clickhouse cluster create](https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/managed-clickhouse/cluster/create)

# 2. Configure database connection

## **dbt**

```yml
clickhouse_starschema:
  target: dev
  outputs:
    dev:
      type: clickhouse
      schema: dbt
      host: <your_host>
      port: 9440
      user: <usr>
      password: <pwd>
      secure: True
```      

## **DBeaver** (JDBC)

```
socket_timeout=300000
ssl=true
sslrootcrt=<path_to_cert>
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