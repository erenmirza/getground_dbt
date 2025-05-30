with
CTE_REFERALLS_SOURCE as (
  select *
  from {{ gg_ref('GG_REFERRALS', enable_mock=false) }}
)

, CTE_PARTNERS_SOURCE as (
  select *
  from {{ gg_ref('PARTNER', enable_mock=false) }}
)

, CTE_SALES_CONTACTS_SOURCE as (
  select *
  from {{ gg_ref('SALES_CONTACT', enable_mock=false) }}
)

, CTE_PARTNER_REFERRALS as (
  select
    R.REFERRAL_ID
    , R.COMPANY_ID
    , case
        when R.IS_OUTBOUND then 'Outbound'
        when not(R.IS_OUTBOUND) then 'Inbound'
      end as REFERRAL_TYPE
    , R.REFERRAL_STATUS
    , P.PARTNER_SALES_CONTACT_COUNTRY_CODE as REFERRAL_COUNTRY_CODE
    , P.PARTNER_ID
    , R.PARTNER_CONSULTANT_ID
    , P.PARTNER_SALES_CONTACT_ID as PARTNER_SALES_CONTACT_ID
    , R.CREATED_AT_DATE_TIME
    , R.UPDATED_AT_DATE_TIME
  from CTE_REFERALLS_SOURCE as R
  left join CTE_PARTNERS_SOURCE as P
  on R.PARTNER_ID = P.PARTNER_ID
  left join CTE_SALES_CONTACTS_SOURCE as SC
  on P.PARTNER_SALES_CONTACT_ID = SC.SALES_CONTACT_ID
)

, CTE_FINAL as (
  select
    REFERRAL_ID
    , COMPANY_ID
    , REFERRAL_TYPE
    , REFERRAL_STATUS
    , REFERRAL_COUNTRY_CODE
    , PARTNER_ID
    , PARTNER_CONSULTANT_ID
    , PARTNER_SALES_CONTACT_ID
    , CREATED_AT_DATE_TIME
    , UPDATED_AT_DATE_TIME
  from CTE_PARTNER_REFERRALS
)

select *
from CTE_FINAL