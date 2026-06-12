------------------------------------------------------------------
-- Banking Analysis
------------------------------------------------------------------


-- Q1: Which branch has the most customers?
select bc.branch_name, 
count(cc.customer_id) as customer_count
from public.branches_clean as bc
join public.customers_clean as cc 
	on bc.branch_id = cc.branch_id
group by 1
order by 2 desc
limit 1

-- Q2: Which branch generates the most loan revenue?
select bc.branch_name, 
sum(lc.amount_paid) as total_revenue
from public.branches_clean as bc
LEFT join public.loans_clean as lc 
	on bc.branch_id = lc.branch_id
group by 1
order by 2 desc
limit 1

-- Q3: Which branch has the highest average account balance?
select bc.branch_name, 
round(avg(ac.balance), 2) as avg_balance
from public.branches_clean as bc
join public.accounts_clean as ac 
	on bc.branch_id = ac.branch_id
group by 1
order by 2 desc
limit 1


-- Q4: Which branch has the most employees?
select bc.branch_name, 
count(ec.employee_id) as employee_count
from public.branches_clean as bc
join public.employees_clean as ec 
	on bc.branch_id = ec.branch_id
group by 1
order by 2 desc
limit 1

-- Q5: Which branch has the most transactions?
select bc.branch_name, 
count(tc.transaction_id) as transaction_count
from public.branches_clean as bc
join public.transactions_clean as tc 
	on bc.branch_id = tc.branch_id
group by 1
order by 2 desc
limit 1

-- Q6: Which branch has the highest performing employees?
select bc.branch_name, 
round(avg(ec.performance_rating), 1) as avg_rating
from public.branches_clean as bc
join public.employees_clean as ec 
	on bc.branch_id = ec.branch_id
group by 1
order by 2 desc
limit 1


-- Q7: Which branches are below their monthly target?
select bc.branch_name,
    bc.monthly_target,
    round(sum(lc.monthly_payment), 2) as actual_revenue,
    round(bc.monthly_target - sum(lc.monthly_payment), 2) as gap
from public.branches_clean as bc
join public.loans_clean as lc 
	on bc.branch_id = lc.branch_id
group by bc.branch_name, bc.monthly_target
having sum(lc.monthly_payment) < bc.monthly_target
order by gap desc


-- Q8: Which country has the most branches?
select country, count(branch_id) as total_branches
from public.branches_clean
group by country
order by total_branches desc
limit 1


-- Q9: How many customers per country?
select country, count(customer_id) as total_customers
from public.customers_clean
group by country
order by 2 desc

-- Q10: What is the average credit score by country?
select country, 
round(avg(credit_score), 1) as avg_credit_score
from public.customers_clean
group by 1
order by 2 desc

-- Q11: How many customers have more than one account?
select cc.full_name, count(ac.account_id) as account_count
from public.customers_clean as cc
join public.accounts_clean as ac 
	on cc.customer_id = ac.customer_id
group by 1
having count(ac.account_id) > 1
order by 2 desc

-- Q12: How many customers have more than one loan?
select cc.full_name, count(lc.loan_id) as loan_count
from public.customers_clean as cc
join public.loans_clean as lc 
	on cc.customer_id = lc.customer_id
group by cc.full_name
having count(lc.loan_id) > 1
order by 2 desc

-- Q13: Which customers have BOTH multiple accounts and multiple loans?
with cte_accounts as (
    select customer_id, count(account_id) as account_count
    from public.accounts_clean
    group by customer_id
    having count(account_id) > 1
),
cte_loans as (
    select customer_id, count(loan_id) as loan_count
    from public.loans_clean
    group by customer_id
    having count(loan_id) > 1
)
select cc.full_name, ca.account_count, cl.loan_count
from public.customers_clean as cc
join cte_accounts as ca 
	on cc.customer_id = ca.customer_id
join cte_loans as cl 
	on cc.customer_id = cl.customer_id

-- Q14: What is the average annual income by employment status?
select employment_status, 
round(avg(annual_income), 2) as avg_income
from public.customers_clean
group by 1
order by 2 desc

-- Q15: Which customers have the highest total balance?
select cc.full_name, 
sum(ac.balance) as total_balance
from public.customers_clean as cc
join public.accounts_clean as ac 
	on cc.customer_id = ac.customer_id
group by 1
having sum(ac.balance) is not null
order by 2 desc
limit 10

-- Q16: Which customers have never made a transaction?
select cc.full_name
from public.customers_clean as cc
LEFT join public.transactions_clean as tc 
	on cc.customer_id = tc.customer_id
where tc.transaction_id is null

-- count 
select count(cc.full_name)
from public.customers_clean as cc
LEFT join public.transactions_clean as tc 
	on cc.customer_id = tc.customer_id
where tc.transaction_id is null


-- Q17: Which customers have unverified KYC?
select * from public.customers_clean
where kyc_verified = 'No'

-- Q18: What is the age distribution of customers?
select customer_id,
    case
        when extract(year from age(date_of_birth::DATE)) between 0 and 17 then 'Minor'
        when extract(year from age(date_of_birth::DATE)) between 18 and 35 then 'Young Adult'
        when extract(year from age(date_of_birth::DATE)) between 36 and 55 then 'Middle Aged'
        when extract(year from age(date_of_birth::DATE)) between 56 and 70 then 'Senior'
        when extract(year from age(date_of_birth::DATE)) > 70 then 'Elderly'
        else 'Unknown'
    end as age_group
    from public.customers_clean
    where date_of_birth is not null
    and date_of_birth not in ('Invalid', 'Invalied')
    and date_of_birth != ''



with age_groups as (
    select customer_id,
    case
        when extract(year from age(date_of_birth::DATE)) between 0 and 17 then 'Minor'
        when extract(year from age(date_of_birth::DATE)) between 18 and 35 then 'Young Adult'
        when extract(year from age(date_of_birth::DATE)) between 36 and 55 then 'Middle Aged'
        when extract(year from age(date_of_birth::DATE)) between 56 and 70 then 'Senior'
        when extract(year from age(date_of_birth::DATE)) > 70 then 'Elderly'
        else 'Unknown'
    end as age_group
    from public.customers_clean
    where date_of_birth is not null
    and date_of_birth not in ('Invalid', 'Invalied')
    and date_of_birth != ''
)
select age_group, count(*) as customer_count
from age_groups
group by age_group
order by customer_count desc

-- Q19: Which nationality has the highest average credit score?
select country, 
round(avg(credit_score), 1) as avg_credit_score
from public.customers_clean
group by country
order by 2 desc
limit 1

-- Q20: How many male vs female customers?
select gender, count(customer_id) as total_count
from public.customers_clean
group by gender
order by 2 desc


-- Q21: What is the total balance by account type?
select account_type, sum(balance) as total_balance
from public.accounts_clean
group by account_type
order by 2 desc

-- Q22: Which account type has the highest average balance?
select account_type, round(avg(balance), 2) as avg_balance
from public.accounts_clean
group by account_type
order by 2 desc
limit 1

-- Q23: How many dormant accounts?
select count(*) as dormant_accounts
from public.accounts_clean
where account_status = 'Dormant'

-- Q24: Which currency is most common?
select currency, count(*) as total
from public.accounts_clean
group by currency
order by 2 desc
limit 1

-- Q25: How many accounts have negative balance?
select count(*) as negative_balance_count
from public.accounts_clean
where balance < 0

-- Q26: What is the total balance by currency?
select currency, sum(balance) as total_balance
from public.accounts_clean
group by 1
order by 2 desc

-- Q27: Which branch has the most dormant accounts?
select bc.branch_name, count(*) as dormant_count
from public.accounts_clean as ac
join public.branches_clean as bc 
	on ac.branch_id = bc.branch_id
where ac.account_status = 'Dormant'
group by 1
order by 2 desc



-- Q28: How many accounts were opened each year?
select extract(year from open_date::DATE) as year,
    count(*) as accounts_opened
from public.accounts_clean
where open_date is not null and open_date != ''
group by 1
order by 1

--Cleaning
update public.accounts_clean
set open_date = to_date(open_date, 'DD-MM-YYYY')::varchar
where open_date ~ '^\d{2}-\d{2}-\d{4}$'

-- Q29: Total deposits vs withdrawals
select
    sum(case when transaction_type = 'Deposit' then amount else 0 end) as total_deposits,
    sum(case when transaction_type = 'Withdrawal' then abs(amount) else 0 end) as total_withdrawals
from public.transactions_clean

-- Q30: Which month had the most transactions?
select extract(month from transaction_date::DATE) as month,
    count(transaction_id) as transaction_count
from public.transactions_clean
where transaction_date != 'Invalid'
group by 1
order by 2 desc
limit 1

-- Q31: Which customer has the highest total spending?
select cc.full_name, sum(abs(tc.amount)) as total_spending
from public.customers_clean as cc
join public.transactions_clean as tc 
	on cc.customer_id = tc.customer_id
where tc.transaction_type = 'Withdrawal'
group by 1
order by 2 desc
limit 1

-- Q32: Average transaction amount by channel
select channel, 
round(avg(amount), 2) as avg_amount
from public.transactions_clean
group by 1
order by 2 desc

-- Q33: How many failed transactions?
select count(*) as failed_count
from public.transactions_clean
where status = 'Failed'

-- Q34: Which account has the most transactions?
select account_id, count(transaction_id) as transaction_count
from public.transactions_clean
group by account_id
order by transaction_count desc
limit 1

-- Q35: Total transaction amount by year
select extract(year from transaction_date::DATE) as year,
    sum(amount) as total_amount
from public.transactions_clean
where transaction_date != 'Invalid'
group by 1
order by 1

-- Q36: Which branch processed the most transaction volume?
select bc.branch_name, 
sum(abs(tc.amount)) as transaction_volume
from public.transactions_clean as tc
join public.branches_clean as bc 
	on tc.branch_id = bc.branch_id
group by bc.branch_name
order by 2 desc
limit 1

-- Q37: How many suspicious transactions (amount > 500000)?
select * from public.transactions_clean
where amount > 500000

-- Q38: Busiest day of the week
select
case extract(DOW from transaction_date::DATE)
    when 0 then 'Sunday'
    when 1 then 'Monday'
    when 2 then 'Tuesday'
    when 3 then 'Wednesday'
    when 4 then 'Thursday'
    when 5 then 'Friday'
    when 6 then 'Saturday'
end as day_name,
count(transaction_id) as transaction_count
from public.transactions_clean
where transaction_date != 'Invalid'
group by 1, extract(DOW from transaction_date::DATE)
order by 2 desc

-- Q39: Total loan amount by loan type
select loan_type, 
sum(loan_amount) as total_loan
from public.loans_clean
group by 1
order by 2 desc

-- Q40: Which loan type has the highest default rate?
with total_loans as (
    select loan_type, count(loan_id) as total
    from public.loans_clean
    group by loan_type
),
defaulted_loans as (
    select loan_type, count(loan_id) as defaults
    from public.loans_clean
    where loan_status = 'Default'
    group by loan_type
)
select tl.loan_type,
    tl.total,
    coalesce(dl.defaults, 0) as defaults,
    round(coalesce(dl.defaults, 0) * 100.0 / tl.total, 1) as default_rate
from total_loans as tl
left join defaulted_loans as dl 
	on tl.loan_type = dl.loan_type
order by default_rate desc

-- Q41: Average interest rate by loan type
select loan_type, round(avg(interest_rate), 1) as avg_interest_rate
from public.loans_clean
group by 1
order by 2 desc

-- Q42: Which customers have defaulted loans?
select cc.customer_id, 
cc.full_name, cc.gender,
lc.loan_type, lc.monthly_payment, lc.amount_paid,
lc.balance_due, lc.loan_status
from public.customers_clean as cc
join public.loans_clean as lc 
	on cc.customer_id = lc.customer_id
where lc.loan_status = 'Default'

-- Q43: Total outstanding balance
select sum(balance_due) as total_outstanding
from public.loans_clean

-- Q44: Which branch has the most defaulted loans?
select bc.branch_name, count(lc.customer_id) as default_count
from public.loans_clean as lc
join public.branches_clean as bc
	on lc.branch_id = bc.branch_id
where lc.loan_status = 'Default'
group by 1
order by 2 desc
limit 1

-- Q45: How many loans were restructured?
select count(customer_id) as total_restructured
from public.loans_clean
where loan_status = 'Restructured'

-- Q46: Average loan term by loan type
select loan_type, round(avg(term_months), 1) as avg_term_months
from public.loans_clean
group by 1
order by 2 desc

-- Q47: Which currency has the highest total loan amount?
select currency, sum(loan_amount) as total_loan
from public.loans_clean
group by 1
order by 2 desc

-- Q48: Customers with both mortgage and business loan
with mortgage_customers as (
    select customer_id from public.loans_clean where loan_type = 'Mortgage'
),
business_customers as (
    select customer_id from public.loans_clean where loan_type = 'Business'
)
select count(*) as both_loan_count
from mortgage_customers
join business_customers 
	on mortgage_customers.customer_id = business_customers.customer_id

-- Q49: Average salary by department
select department, round(avg(salary), 2) as avg_salary
from public.employees_clean
group by 1
order by 2 desc

-- Q50: Which department has highest performing employees?
select department,
    round(avg(performance_rating), 1) as avg_rating,
    sum(performance_rating) as total_rating
from public.employees_clean
group by 1
order by 2 desc

-- Q51: Which branch has the highest average employee salary?
select bc.branch_name, round(avg(ec.salary), 1) as avg_salary
from public.employees_clean as ec
join public.branches_clean as bc 
	on ec.branch_id = bc.branch_id
group by 1
order by 2 desc
limit 1

-- Q52: How many employees were hired each year?
select extract(YEAR from hire_date::DATE) as year,
    count(employee_id) as total_hired
from public.employees_clean
where hire_date is not null
group by 1
order by 1

--Cleaning
update public.employees_clean
set hire_date = null
where hire_date = ''

-- Q53: Which employees have been with the company longest?
select full_name, hire_date,
    extract(YEAR from age(hire_date::DATE)) as years_with_company,
    extract(MonTH from age(hire_date::DATE)) as months,
    extract(DAY from age(hire_date::DATE)) as days
from public.employees_clean
where hire_date is not null and hire_date != ''
order by years_with_company desc
limit 5

-- Q54: Salary range by job title
select job_title,
    Min(salary) as min_salary,
    max(salary) as max_salary,
    max(salary) - Min(salary) as salary_range
from public.employees_clean
group by job_title
order by salary_range desc

-- Q55: Which manager has the most employees?
select e.full_name as manager_name,
    count(emp.employee_id) as total_reports
from public.employees_clean as e
join public.employees_clean as emp 
	on e.employee_id = emp.manager_id
where emp.manager_id is not null
group by e.full_name
order by total_reports desc


-- Q56: Customer financial profile
with cte_accounts as (
    select customer_id, count(account_id) as total_accounts
    from public.accounts_clean
    group by customer_id
),
cte_loans as (
    select customer_id,
        count(loan_id) as total_loan_count,
        sum(loan_amount) as total_loans
    from public.loans_clean
    group by customer_id
),
cte_transactions as (
    select customer_id, count(transaction_id) as total_transactions
    from public.transactions_clean
    group by customer_id
)
select cc.full_name,
    coalesce(ca.total_accounts, 0) as total_accounts,
    coalesce(cl.total_loan_count, 0) as total_loans,
    coalesce(cl.total_loans, 0) as total_loan_amount,
    coalesce(ct.total_transactions, 0) as total_transactions
from public.customers_clean as cc
left join cte_accounts as ca 
	on cc.customer_id = ca.customer_id
left join cte_loans as cl on cc.customer_id = cl.customer_id
left join cte_transactions as ct 
	on cc.customer_id = ct.customer_id
order by total_loan_amount desc

-- Q57: Customers with loans but no active accounts
select cc.full_name, lc.loan_type, lc.loan_status, lc.balance_due
from public.loans_clean as lc
join public.customers_clean as cc 
	on lc.customer_id = cc.customer_id
where lc.customer_id not in (
    select customer_id
    from public.accounts_clean
    where account_status = 'Active'
)

-- Q58: Employees who processed most loan applications
select ec.full_name, count(lc.loan_id) as total_loans
from public.employees_clean as ec
join public.loans_clean as lc 
	on ec.employee_id = lc.employee_id
group by 1
order by 2 desc
limit 1

-- Q59: Branches where loan amount exceeds account balance
with cte_loans as (
    select branch_id, sum(loan_amount) as total_loan_amount
    from public.loans_clean
    group by 1
),
cte_accounts as (
    select branch_id, sum(balance) as total_balance
    from public.accounts_clean
    group by 1
)
select bc.branch_name,
    cl.total_loan_amount,
    ca.total_balance,
    cl.total_loan_amount - ca.total_balance as difference
from public.branches_clean as bc
join cte_loans as cl 
	on bc.branch_id = cl.branch_id
join cte_accounts as ca 
	on bc.branch_id = ca.branch_id
where cl.total_loan_amount > ca.total_balance
order by difference desc

-- Q60: Top 10 customers by net worth
with cte_assets as (
    select customer_id, sum(balance) as total_assets
    from public.accounts_clean
    group by 1
),
cte_liabilities as (
    select customer_id, sum(balance_due) as total_liabilities
    from public.loans_clean
    group by 1
)
select cc.full_name,
    coalesce(ca.total_assets, 0) - coalesce(cl.total_liabilities, 0) as net_worth
from public.customers_clean as cc
LEFT join cte_assets as ca 
	on cc.customer_id = ca.customer_id
LEFT join cte_liabilities as cl 
	on cc.customer_id = cl.customer_id
order by net_worth desc
limit 10


-- Q61: Total loan amount by year with YoY growth %
with yearly_loans as (
    select extract(YEAR from start_date::DATE) as year,
        sum(loan_amount) as total_loans
    from public.loans_clean
    where start_date != 'Invalid' and start_date is not null
    group by 1
)
select year, total_loans,
    lag(total_loans, 1) over (order by year) as previous_year,
    round((total_loans - lag(total_loans, 1) over (order by year))
        / lag(total_loans, 1) over (order by year) * 100, 1) as yoy_growth_pct
from yearly_loans
order by year

-- Q62: Total deposits year over year
with yearly_deposits as (
    select extract(YEAR from transaction_date::DATE) as year,
        sum(amount) as total_deposits
    from public.transactions_clean
    where transaction_type = 'Deposit'
    and transaction_date != 'Invalid'
    group by 1
)
select year, total_deposits,
    lag(total_deposits, 1) over (order by year) as previous_year,
    round((total_deposits - lag(total_deposits, 1) over (order by year))
        / lag(total_deposits, 1) over (order by year) * 100, 1) as yoy_change
from yearly_deposits
order by year

-- Q63: Branch with most transaction growth YoY
with cte_1 as (
    select branch_id,
        extract(YEAR from transaction_date::DATE) as year,
        sum(amount) as total_amount
    from public.transactions_clean
    where transaction_date != 'Invalid'
    group by 1, 2
)
select bc.branch_name, cte_1.year, total_amount,
    lag(total_amount, 1) over (PARTITIon BY cte_1.branch_id order by year) as prev_year,
    round((total_amount - lag(total_amount, 1) over (PARTITIon BY cte_1.branch_id order by year))
        / lag(total_amount, 1) over (PARTITIon BY cte_1.branch_id order by year) * 100, 1) as yoy_growth
from public.branches_clean as bc
join cte_1 
	on bc.branch_id = cte_1.branch_id
order by yoy_growth desc

-- Q64: Monthly transaction volume for 2024
select extract(MonTH from transaction_date::DATE) as month,
    sum(amount) as total_volume
from public.transactions_clean
where extract(year from transaction_date::DATE) = 2024
and transaction_date != 'Invalid'
group by 1
order by 1

-- Q65: Which month had the highest loan approvals?
select extract(MonTH from start_date::DATE) as month,
    count(loan_id) as loan_approvals
from public.loans_clean
where start_date != 'Invalid' and start_date is not null
group by 1
order by 2 desc
limit 2

-- Q66: Month over month change in account balances
with monthly_balance as (
    select extract(MonTH from open_date::DATE) as month,
    sum(balance) as total_balance
    from public.accounts_clean
    where open_date is not null and open_date != 'Invalid'
    group by 1
)
select month, total_balance,
    lag(total_balance, 1) over (order by month) as previous_month,
    round(total_balance - lag(total_balance, 1) over (order by month), 2) as mom_change
from monthly_balance
order by 1

-- Q67: Customer segmentation by balance
with cte_balance as (
    select customer_id, sum(balance) as total_balance
    from public.accounts_clean
    group by 1
),
cte_segments as (
    select customer_id,
    case
        when total_balance between 0 and 10000 then 'Low'
        when total_balance between 10001 and 50000 then 'Medium'
        when total_balance > 50000 then 'High'
        else 'Unknown'
    end as segment
    from cte_balance
)
select segment, count(*) as customer_count
from cte_segments
group by segment
order by customer_count desc

-- Q68: Customers with bank the longest
select full_name, join_date,
    extract(YEAR from age(join_date::DATE)) as years_with_bank
from public.customers_clean
where join_date is not null
order by years_with_bank desc
limit 5

-- Q69: Customers who joined in 2020 with active accounts
select cc.full_name, cc.join_date, ac.account_status
from public.customers_clean as cc
join public.accounts_clean as ac 
	on cc.customer_id = ac.customer_id
where extract(YEAR from cc.join_date::DATE) = 2020
and ac.account_status = 'Active'

-- Q70: Customer segment with highest default rate
with cte_1 as (
    select customer_id, sum(balance) as total_balance
    from public.accounts_clean
    group by 1
),
cte_2 as (
    select customer_id,
    case
        when total_balance between 0 and 10000 then 'Low'
        when total_balance between 10001 and 50000 then 'Med'
        when total_balance > 50000 then 'High'
        else 'Unknown'
    end as category
    from cte_1
),
cte_3 as (
    select customer_id
    from public.loans_clean
    where loan_status = 'Default'
)
select cte_2.category,
    count(cte_3.customer_id) as default_count,
    count(cte_2.customer_id) as total_customers,
    round(count(cte_3.customer_id) * 100.0 / count(cte_2.customer_id), 1) as default_rate
from cte_2
LEFT join cte_3 
	on cte_2.customer_id = cte_3.customer_id
group by cte_2.category
order by default_rate desc

-- Q71: Running total of deposits by month in 2024
with monthly_deposits as (
    select extract(MonTH from transaction_date::DATE) as month,
        sum(amount) as total_deposits
    from public.transactions_clean
    where transaction_type = 'Deposit'
    and transaction_date != 'Invalid'
    group by 1
)
select month, total_deposits,
    sum(total_deposits) over (order by month) as running_total
from monthly_deposits
where extract(YEAR from current_date) = 2024
   or total_deposits is not null
order by month

-- Q72: 3 month moving average of transaction amounts
select transaction_date, amount,
    round(avg(amount) over (
        order by transaction_date::DATE
        rows between 2 PRECEDinG and current row
    ), 2) as moving_avg_3month
from public.transactions_clean
where transaction_date != 'Invalid'
order by transaction_date::DATE

-- Q73: Cumulative loan amount by branch
select branch_id,
extract(month from start_date::DATE) as month,
loan_amount,
sum(loan_amount) over (partition BY branch_id order by extract(month from start_date::DATE)) as cumulative_amount
from public.loans_clean
where start_date != 'Invalid' and start_date is not null
order by branch_id, month

-- Q74: Rank branches by total revenue using DENSE_rank
select bc.branch_name,
    sum(lc.amount_paid) as total_revenue,
    DENSE_rank() over (order by sum(lc.amount_paid) DESC) as revenue_rank
from public.loans_clean as lc
join public.branches_clean as bc 
	on lc.branch_id = bc.branch_id
group by bc.branch_name
order by revenue_rank

-- Q75: Rank customers by credit score within each country
select country,
round(avg(credit_score), 1) as avg_credit_score,
dense_rank() over (order by avg(credit_score) desc) as rank
from public.customers_clean
group by 1
order by rank

