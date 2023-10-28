with
CTE_SOURCE as (
    select *
    from {{ ref('SALES_PEOPLE_RAW') }}
)

, CTE_RENAME as (
    select
    NAME::varchar as SALES_CONTACT_NAME
    , COUNTRY::varchar as SALES_CONTACT_COUNTRY_NAME
    from CTE_SOURCE
)

select *
from CTE_RENAME