with CTE_SOURCE as (
    select *
    from {{ ref('GG_SALES_PEOPLE_RAW') }}
)

, CTE_RENAME as (
    select
    NAME::varchar as CONSULTANT_NAME
    , COUNTRY::varchar as CONSULTANT_COUNTRY
    from CTE_SOURCE
)

select *
from CTE_RENAME