with CTE_SOURCE as (
    select *
    from {{ ref('GG_REFERRALS_RAW') }}
)

, CTE_RENAME as (
    select
    ID as REFERRAL_ID
    , CREATED_AT as CREATED_AT_DATE_TIME_UTC
    , UPDATED_AT as UPDATED_AT_DATE_TIME_UTC
    , COMPANY_ID
    , PARTNER_ID
    , CONSULTANT_ID
    , STATUS
    , IS_OUTBOUND
    from CTE_SOURCE
)

select *
from CTE_RENAME