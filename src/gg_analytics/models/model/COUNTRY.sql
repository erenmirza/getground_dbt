with
CTE_COUNTRY_SOURCE as (
  select *
  from (
    values 
    (1, 'United Kingdom', 'GBR', 'UK')
    , (2, 'Hong Kong', 'HKG', 'HongKong')
    , (3, 'Singapore', 'SGP', 'Singapore')
  ) COUNTRY(COUNTRY_ID, COUNTRY_NAME, COUNTRY_ISO_CODE, COUNTRY_ALIAS)
)

, CTE_FINAL as (
    select
      COUNTRY_ID
      , COUNTRY_NAME
      , COUNTRY_ISO_CODE
      , COUNTRY_ALIAS
    from CTE_COUNTRY_SOURCE
)

select *
from CTE_FINAL