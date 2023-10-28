with
CTE_REFERRALS_SOURCE as (
  select *
  from {{ ref('GG_REFERRALS') }}
)

, CTE_DISTINCT_COMPANIES as (
  select distinct
    COMPANY_ID
  from CTE_REFERRALS_SOURCE
)

, CTE_FINAL as (
    select
      COMPANY_ID
      {# , COMPANY_STATUS #}
    from CTE_DISTINCT_COMPANIES
)

select *
from CTE_FINAL