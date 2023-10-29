select
referral_status
, count(*) as CNT
from base.gg_referrals
group by referral_status