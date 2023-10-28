with CTE_SOURCE as (
    select *
    from {{ ref('GG_SALES_EMPLOYEES_RAW') }}
)

, CTE_RENAME as (
    select
    NAME::varchar as SALES_EMPLOYEE_NAME
    , COUNTRY::varchar as SALES_EMPLOYEE_COUNTRY
    from CTE_SOURCE
)

select *
from CTE_RENAME