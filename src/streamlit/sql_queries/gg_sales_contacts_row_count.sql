select
count(*) as row_count
, count(distinct(sales_contact_name || '-' || SALES_CONTACT_COUNTRY_NAME)) as PK_distinct_count
, count(distinct sales_contact_name) as name_distinct_count
from base.gg_sales_contacts
limit 1