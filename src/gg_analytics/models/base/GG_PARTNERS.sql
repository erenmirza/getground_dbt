{# {{ config(materialized='external', location='output/{{this}}.csv') }} #}

with
CTE_SOURCE as (
    select *
    from {{ ref('PARTNERS_RAW') }}
)

, CTE_RENAME as (
    select
    ID as PARTNER_ID
    , PARTNER_TYPE
    , LEAD_SALES_CONTACT as PARTNER_SALES_CONTACT_NAME
    , {{ unix_to_timestamp('CREATED_AT', 'ns', 'CREATED_AT_DATE_TIME') }}
    , {{ unix_to_timestamp('UPDATED_AT', 'ns', 'UPDATED_AT_DATE_TIME') }}
    from CTE_SOURCE
)

select *
from CTE_RENAME