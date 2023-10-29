with
CTE_SOURCE as (
  select *
  from {{ ref('PARTNER_CONSULTANT__EXPECTED__RAW') }}
)

, CTE_RENAME as (
    select
      PARTNER_ID::int as PARTNER_ID 
      , PARTNER_CONSULTANT_ID::int as PARTNER_CONSULTANT_ID 
    from CTE_SOURCE
)

select *
from CTE_RENAME