select
partner_type
, count(*) as cnt
, min(created_at_date_time) as first_creation_date_time
, max(created_at_date_time) as last_creation_date_time
from base.gg_partners
group by 
partner_type