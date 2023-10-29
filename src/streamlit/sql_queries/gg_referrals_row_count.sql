select
count(*) as row_count
, count(distinct referral_id) as referral_id_distinct_count
, count(distinct company_id) as company_id_distinct_count
, count(distinct partner_id) as partner_id_distinct_count
, count(distinct partner_consultant_id) as consultant_id_distinct_count
, count(distinct (partner_id || '-' || partner_consultant_id)) as partner_consultant_id_distinct_count
, max(CREATED_AT_DATE_TIME) as max_created_at_date_time
, min(CREATED_AT_DATE_TIME) as min_created_at_date_time
from base.gg_referrals