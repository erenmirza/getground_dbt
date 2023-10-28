{# {{ config(materialized='external', location='output/GG_PARTNERS.csv') }} #}

with CTE_SOURCE as (
    select *
    from {{ ref('GG_PARTNERS_RAW') }}
)

, CTE_RENAME as (
    select
    ID as PARTNER_ID
    , {{ unix_to_timestamp('CREATED_AT', 'ns', 'CREATED_AT_DATE_TIME') }}
    , {{ unix_to_timestamp('UPDATED_AT', 'ns', 'UPDATED_AT_DATE_TIME') }}
    , PARTNER_TYPE
    , LEAD_SALES_CONTACT as LEAD_CONSULTANT_NAME
    from CTE_SOURCE
)

select *
from CTE_RENAME