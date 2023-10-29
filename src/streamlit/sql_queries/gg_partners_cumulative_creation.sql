with cte_base as (
  select *
  from base.gg_partners
--  where partner_type = 'Agent'
)

, cte_monthly_creations as (
select
  strftime(created_at_date_time, '%Y-%m') as YEAR_MONTH
  , partner_type
  , count(*) as cnt
from cte_base
group by
YEAR_MONTH
, partner_type
)

, cte_cumulative_creation as (
  select *
  , sum(cnt) over (
    partition by partner_type
    order by YEAR_MONTH
  ) as cumulative_count
  from cte_monthly_creations
)

select *
from cte_cumulative_creation
order by partner_type, YEAR_MONTH