select
  SALES_CONTACT_COUNTRY_NAME
  , count(*) as CNT
from base.gg_sales_contacts
group by
  SALES_CONTACT_COUNTRY_NAME
