with CTE_SOURCE as (
    select *
    from {{ ref('GG_PARTNERS_RAW') }}
)

, CTE_RENAME as (
    select
    ID as PARTNER_ID
    , CREATED_AT as CREATED_AT_DATE_TIME_UTC
    , UPDATED_AT as UPDATED_AT_DATE_TIME_UTC
    , PARTNER_TYPE
    , LEAD_SALES_CONTACT
    from CTE_SOURCE
)

select *
from CTE_RENAME