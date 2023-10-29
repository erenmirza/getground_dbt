with
cte_dates as (
select date_key from model.date
where date_key >='2020-08-01'
and date_key <= '2021-06-01'
)

, cte_referrals as (
select *
from base.gg_referrals
)

, cte_referral_status as (
    select distinct referral_status
    from cte_referrals
)

, cte_date_status as (
    select
    date_key
    , referral_status
    from cte_dates
    cross join cte_referral_status
)

, cte_referrals_created_per_day as (
select
d.date_key
, r.referral_id
, d.referral_status
from cte_date_status d
left join cte_referrals r
on d.date_key = r.CREATED_AT_DATE_TIME::date
and r.referral_status = d.referral_status
)

, cte_daily_count as (
select 
date_key
, referral_status
,  count(referral_id) as referral_count
from  cte_referrals_created_per_day
group by date_key, referral_status
)

, CTE_FINAL as (
select
    *
    , AVG(referral_count) OVER (
        PARTITION BY referral_status
        ORDER BY date_key ASC
        RANGE BETWEEN INTERVAL 3 DAYS PRECEDING
                  AND INTERVAL 3 DAYS FOLLOWING
        ) as REFERRALS_CREATED_7_DAY_AVG
from cte_daily_count
)

select *
from CTE_FINAL