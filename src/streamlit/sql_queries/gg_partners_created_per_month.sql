select
  strftime(created_at_date_time, '%Y-%m') as YEAR_MONTH
  , partner_type
  , count(*) as cnt
from base.gg_partners
group by
YEAR_MONTH
, partner_type