with
CTE_SALES_CONTACTS_SOURCE as (
  select *
  from {{ gg_ref('GG_SALES_CONTACTS', enable_mock=false) }}
)

, CTE_COUNTRY_SOURCE as (
  select *
  from {{ gg_ref('COUNTRY', enable_mock=false) }}
)

, CTE_SALES_CONTACTS as (
  select
  row_number() over (
    order by SC.SALES_CONTACT_NAME, C.COUNTRY_ID
  ) as SALES_CONTACT_ID
  , SC.SALES_CONTACT_NAME
  , C.COUNTRY_ISO_CODE as SALES_CONTACT_COUNTRY_CODE
  from CTE_SALES_CONTACTS_SOURCE SC
  left join CTE_COUNTRY_SOURCE C
  on SC.SALES_CONTACT_COUNTRY_NAME = C.COUNTRY_ALIAS
)

, CTE_FINAL as (
  select
    SALES_CONTACT_ID
    , SALES_CONTACT_NAME
    , SALES_CONTACT_COUNTRY_CODE
  from CTE_SALES_CONTACTS
)

select *
from CTE_FINAL