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
При запуске `dbt run -s lineorder`
dbt вылетал минут через 5 с ошибкой, что `Exception: Table db1.lineorder__dbt_tmp already exist`
Если в sql для `lineorder` установить LIMIT, то отрабатывает успешно, поэтому сгенерировала таблицу для 1 миллиона записей

Так же при генерации lineorder_flat вываливалась ошибка при использовании `dbt_utils.surrogate_key`, применила [фильтры](https://github.com/Grokholskaya/clickhouse_starschema/blob/master/models/star/lineorder_flat.sql) для результата, возвращаемого dbt_utils


Ну и еще у меня не сработал codegen, так что сформировала коды для моделей пока вручную

- tests and docs for models

Тесты использовала стандарные, [результаты](https://github.com/Grokholskaya/clickhouse_starschema/blob/master/results/tests.log)

Документирование честно не делала

Send results of queries: 
- Q2.1
- Q3.3
- Q4.2

# (optional) Creating source tables with dbt macro
Применила для скрипта `split` и запустила в цикле `run_query`

`dbt run-operation` [init_s3_sources](https://github.com/Grokholskaya/clickhouse_starschema/blob/master/macros/init_s3_sources.sql)
Find a way how to cope with error: `Multi-statements are not allowed`

