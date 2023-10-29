with
CTE_SOURCE as (
  select *
  from {{ ref('GG_REFERRALS__PARTNER_CONSULTANT__MOCK__RAW') }}
)

, CTE_RENAME as (
    select
      REFERRAL_ID
      , COMPANY_ID
      , PARTNER_ID
      , PARTNER_CONSULTANT_ID
      , REFERRAL_STATUS
      , IS_OUTBOUND
      , CREATED_AT_DATE_TIME
      , UPDATED_AT_DATE_TIME
    from CTE_SOURCE
)

select *
from CTE_RENAME