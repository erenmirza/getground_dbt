with CTE_SOURCE as (
    select *
    from {{ ref('GG_REFERRALS_RAW') }}
)

, CTE_RENAME as (
    select
    ID as REFERRAL_ID
    , {{ unix_to_timestamp('CREATED_AT', 'ns', 'CREATED_AT_DATE_TIME') }}
    , {{ unix_to_timestamp('UPDATED_AT', 'ns', 'UPDATED_AT_DATE_TIME') }}
    , COMPANY_ID
    , PARTNER_ID
    , CONSULTANT_ID
    , STATUS
    , IS_OUTBOUND
    from CTE_SOURCE
)

select *
from CTE_RENAME