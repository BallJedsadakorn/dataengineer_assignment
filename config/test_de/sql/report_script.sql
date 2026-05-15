CREATE VIEW most_popular_plan_by_company AS
--1 Most popular plan in a policy by companies 
with prep_data as (
    select c.name as company_name,
        p.description as policy_name,
        count(cus.customer_id) as customer_apply,
        dense_rank() over (partition by c.name order by count(cus.customer_id) desc) as policy_ranking
    from customers cus
        inner join company c on c.company_id = cus.company_id
        inner join plan p on p.plan_id = cus.plan_id
    group by c.name, p.description
    order by p.description
)
select company_name, policy_name, customer_apply
from prep_data
where policy_ranking = 1;

CREATE VIEW number_customer_by_preferred_hospital AS
--2 Number of customer that is covered by preferred hospital on 1-Feb-2021 (The effective date and expiry date itself also count as covered) for demand projection 
with prep_data as (
    select
        c.name,
        cus.customer_id,
        cus.first_name,
        cus.last_name,
        cus.plan_started_date,
        c.expiry_date,
        cus.preferred_hospital
    from
        customers cus
        join company c on c.company_id = cus.company_id
        inner join plan p on p.plan_id = cus.plan_id
)
select
    p_data.preferred_hospital,
    count(p_data.customer_id) as count_customer
from
    prep_data p_data
where
    p_data.expiry_date > DATE '2021-02-01'
group by
    p_data.preferred_hospital
order by
    count_customer desc;

CREATE VIEW sum_total_year_customer AS
--3 How many years has each customer been with us (one customer can have many policies) 
with prep_data as(
    select
        cu.customer_id,
        cu.first_name,
        cu.last_name,
        cu.plan_started_date,
        c.effective_date,
        c.expiry_date,
        CONCAT(cu.first_name, ' ', cu.last_name) AS full_name,
        ROUND(
            (c.expiry_date - cu.plan_started_date :: DATE) / 365.0,
            2
        ) AS years_with_us
    FROM
        customers cu
        JOIN company c ON c.company_id = cu.company_id
    ORDER BY
        years_with_us desc
)
SELECT
    p_data.full_name,
    SUM(years_with_us) AS total_year_amount
FROM
    prep_data p_data
group by
    p_data.full_name
order by
    total_year_amount ASC;