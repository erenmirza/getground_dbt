with
CTE_COUNTRY_SOURCE as (
  select
    COUNTRY_ID
    , COUNTRY_NAME
    , COUNTRY_CODE
  from (
    values 
    (1, 'United Kingdom', 'GBR')
    , (2, 'Hong Kong', 'HKG')
    , (3, 'Singapore', 'SGP')
  ) COUNTRY(COUNTRY_ID, COUNTRY_NAME, COUNTRY_CODE)
)

, CTE_FINAL as (
    select
      COUNTRY_ID
      , COUNTRY_NAME
      , COUNTRY_CODE
    from CTE_COUNTRY_SOURCE
)

select *
from CTE_FINAL