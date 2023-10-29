select
count(*) as row_count
, count(distinct partner_id) as number_of_partners
from base.gg_partners