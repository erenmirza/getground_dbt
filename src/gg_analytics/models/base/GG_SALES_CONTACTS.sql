with
CTE_SOURCE as (
    select *
    from {{ source('GETGROUND_INGEST', 'TBL_SALES_PEOPLE') }}
)

, CTE_RENAME as (
    select
    NAME::varchar as SALES_CONTACT_NAME
    , COUNTRY::varchar as SALES_CONTACT_COUNTRY_NAME
    from CTE_SOURCE
)

select *
from CTE_RENAME