with CTE_SOURCE as (
    select *
    from {{ ref('REFERRALS_RAW') }}
)

, CTE_RENAME as (
    select
    ID as REFERRAL_ID
    , COMPANY_ID
    , PARTNER_ID
    , CONSULTANT_ID as PARTNER_CONSULTANT_ID
    , STATUS as REFERRAL_STATUS
    , IS_OUTBOUND
    , {{ unix_to_timestamp('CREATED_AT', 'ns', 'CREATED_AT_DATE_TIME') }}
    , {{ unix_to_timestamp('UPDATED_AT', 'ns', 'UPDATED_AT_DATE_TIME') }}
    from CTE_SOURCE
)

select *
from CTE_RENAME