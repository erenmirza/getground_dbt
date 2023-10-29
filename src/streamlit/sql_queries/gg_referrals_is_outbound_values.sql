select
IS_OUTBOUND
, count(*) as CNT
from base.gg_referrals
group by IS_OUTBOUND