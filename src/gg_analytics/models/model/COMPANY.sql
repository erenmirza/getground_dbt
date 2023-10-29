with
CTE_REFERRALS_SOURCE as (
  select *
  from {{ gg_ref('GG_REFERRALS', enable_mock=false) }}
)

, CTE_DISTINCT_COMPANIES as (
  select
    COMPANY_ID
    , max(REFERRAL_ID) as LAST_REFERRAL_ID
    , min(REFERRAL_ID) as FIRST_REFERRAL_ID
  from CTE_REFERRALS_SOURCE
  group by COMPANY_ID
)

, CTE_COMPANY_DETAILS as (
  select
    DC.COMPANY_ID
    , R.REFERRAL_STATUS as LAST_REFERRAL_STATUS
    , if(
      LAST_REFERRAL_STATUS in ('successful', 'pending')
      , 'Active'
      , 'Inactive'
    ) as COMPANY_STATUS
  from CTE_DISTINCT_COMPANIES DC
  inner join CTE_REFERRALS_SOURCE R
  on DC.LAST_REFERRAL_ID = R.REFERRAL_ID
)

, CTE_FINAL as (
    select
      COMPANY_ID
      , COMPANY_STATUS
    from CTE_COMPANY_DETAILS
)

select *
from CTE_FINAL