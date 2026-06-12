-- ============================================================
-- Data Clening
-- ============================================================


create table branches_clean as select * from public.branches

create table employees_clean as select * from public.employees

create table customers_clean as select * from public.customers

create table accounts_clean as select * from public.accounts

create table transactions_clean as select * from public.transactions

create table loans_clean as select * from public.loans


-------------------------------------------------
--- Branches cleaning
-------------------------------------------------
-- Check duplicates
select * from (
    select branch_id,
    row_number() over (partition by branch_id, branch_name, address order by branch_id) as rn
    from public.branches_clean
) as sub
where rn > 1
-- 0 duplicates found

-- Fix zip code (remove spaces)
update public.branches_clean
set zip_code = replace(zip_code, ' ', '')

-- Fix state (uppercase)
update public.branches_clean
set state = upper(state)

-- Fix is_active
update public.branches_clean
set is_active = case
    when is_active ilike 'y%' then 'Yes'
    when is_active ilike 'n%' then 'No'
    else 'Check Activity'
end

-- Fix phone (US branches only)
update public.branches_clean
set phone = concat(
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 1, 3), '-',
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 4, 3), '-',
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 7, 4)
)
where country = 'USA'

-- Fix open_date

-- Standardize ALL separators to '-'
update public.branches_clean
set open_date = REGEXP_REPLACE(open_date, '[/.]', '-', 'g')
where open_date is not null and open_date != ''

-- Fix YYYY-DD-MM
update public.branches_clean
set open_date = ConCAT(
    split_part(open_date, '-', 1), '-',
    split_part(open_date, '-', 3), '-',
    split_part(open_date, '-', 2)
)
where length(split_part(open_date, '-', 1)) = 4
and split_part(open_date, '-', 2)::int > 12
and open_date is not null and open_date != ''

-- Verify dates
select DisTinCT open_date
from public.branches_clean
where open_date not like '____-__-__'
and open_date is not null and open_date != ''   -- None

-- trim all text columns
update public.branches_clean
set
    branch_id = trim(branch_id),
    branch_name = trim(branch_name),
    address = trim(address),
    city = trim(city),
    state = trim(state),
    zip_code = trim(zip_code),
    country = trim(country),
    phone = trim(phone),
    manager_name = trim(manager_name),
    is_active = trim(is_active),
    notes = trim(notes)


update public.customers_clean
set country = initcap(country)
where country != initcap(country)

-- EMPLOYEES CLEAN


-- Find and remove exact duplicates
select * from (
    select employee_id,
    row_number() over (PARTITIon BY full_name, 
	gender, 
	date_of_birth order by employee_id) as rn
    from public.employees_clean
) as sub
where rn > 1

delete from public.employees_clean
where employee_id in (
    select employee_id from (
    select employee_id,
    row_number() over (PARTITIon BY full_name, 
	gender, 
	date_of_birth order by employee_id) as rn
    from public.employees_clean
    ) as sub
    where rn > 1
)

-- Delete ghost record
delete from public.employees_clean
where first_name is null
and full_name is null
and hire_date is null

-- Fix name casing
update public.employees_clean
set
    first_name = initcap(first_name),
    last_name = initcap(last_name),
    full_name = initcap(full_name)

-- Fix gender
update public.employees_clean
set gender = case
    when gender ilike 'm%' then 'Male'
    when gender ilike 'f%' then 'Female'
    else gender
end

-- Fix date_of_birth

-- Standardize ALL separators
update public.employees_clean
set date_of_birth = REGEXP_replace(date_of_birth, '[/.]', '-', 'g')
where date_of_birth is not null and date_of_birth != ''

-- Fix yyyy-dd-mm
update public.employees_clean
set date_of_birth = ConCAT(
    split_part(date_of_birth, '-', 1), '-',
    split_part(date_of_birth, '-', 3), '-',
    split_part(date_of_birth, '-', 2)
)
where length(split_part(date_of_birth, '-', 1)) = 4
and split_part(date_of_birth, '-', 2)::inT > 12
and date_of_birth is not null and date_of_birth != ''

select distinct date_of_birth
from public.employees_clean
where date_of_birth not like '____-__-__'
and date_of_birth is not null and date_of_birth != '' -- 0 rows

-- Fix hire_date

-- Standardize ALL separators
update public.employees_clean
set hire_date = REGEXP_replace(hire_date, '[/.]', '-', 'g')
where hire_date is not null and hire_date != ''

-- Fix yyyy-dd-mm
update public.employees_clean
set hire_date = ConCAT(
    split_part(hire_date, '-', 1), '-',
    split_part(hire_date, '-', 3), '-',
    split_part(hire_date, '-', 2)
)
where length(split_part(hire_date, '-', 1)) = 4
and split_part(hire_date, '-', 2)::inT > 12
and hire_date is not null and hire_date != ''

select distinct hire_date
from public.employees_clean
where hire_date not like '____-__-__'
and hire_date is not null and hire_date != '' -- 0 rows

-- Fix salary (abs for negatives)
update public.employees_clean
set salary = abs(salary)

-- Fix phone (US branches only)
update public.employees_clean
set phone = ConCAT(
    SUBSTRinG(REGEXP_replace(phone, '[^0-9]', '', 'g'), 1, 3), '-',
    SUBSTRinG(REGEXP_replace(phone, '[^0-9]', '', 'g'), 4, 3), '-',
    SUBSTRinG(REGEXP_replace(phone, '[^0-9]', '', 'g'), 7, 4)
)
where branch_id in (
    select branch_id from public.branches_clean where country = 'USA'
)

-- Fix email
update public.employees_clean
set email = case
    when email is null or email = '' then 'Unknown'
    when email ilike '%@@%' then replace(email, '@@', '@')
    when email not like '%@%' then 'Invalid - Missing @'
    when email not like '%.%' then 'Invalid - Missing Domain'
    else email
end

-- Fix is_active
update public.employees_clean
set is_active = case
    when is_active ilike 'y%' then 'Yes'
    when is_active ilike 'n%' then 'No'
    else 'Check Activity'
end

-- Fix performance_rating out of range
select performance_rating
from public.employees_clean
where performance_rating > 5
-- 0 rows found

-- Clean notes (keep only meaningful ones)
update public.employees_clean
set notes = null
where notes not ilike '%manager%'

-- trim all text columns
update public.employees_clean
set
    employee_id = trim(employee_id),
    branch_id = trim(branch_id),
    first_name = trim(first_name),
    last_name = trim(last_name),
    full_name = trim(full_name),
    gender = trim(gender),
    job_title = trim(job_title),
    department = trim(department),
    phone = trim(phone),
    email = trim(email),
    manager_id = trim(manager_id),
    is_active = trim(is_active),
    education_level = trim(education_level),
    notes = trim(notes)

-----------------------------------------------------------------------------------
-- CUSTOMERS CLEAN
------------------

-- Find and remove exact duplicates
delete from public.customers_clean
where customer_id in (
    select customer_id from (
        select customer_id,
            row_number() over (PARTITIon BY full_name, date_of_birth, address order by customer_id) as rn
        from public.customers_clean
    ) as sub
    where rn > 1
)

-- Delete ghost record
delete from public.customers_clean
where (full_name is null or full_name = '')
and (date_of_birth is null or date_of_birth = '')
and (phone is null or phone = '')

-- Fix special characters in names
update public.customers_clean
set first_name = replace(replace(replace(replace(replace(
    first_name, '@', 'a'), '#', 'h'), '!', 'i'), '$', 's'), '0', 'o')

update public.customers_clean
set last_name = replace(replace(replace(replace(replace(
    last_name, '@', 'a'), '#', 'h'), '!', 'i'), '$', 's'), '0', 'o')

update public.customers_clean
set full_name = replace(replace(replace(replace(replace(
    full_name, '@', 'a'), '#', 'h'), '!', 'i'), '$', 's'), '0', 'o')

-- Fix name casing
update public.customers_clean
set
    first_name = inITCAP(first_name),
    last_name = inITCAP(last_name),
    full_name = inITCAP(full_name)

-- Fix gender
update public.customers_clean
set gender = case
    when gender ilike 'f%' then 'Female'
    when gender ilike 'm%' then 'Male'
    else gender
end

-- Fix date_of_birth
update public.customers_clean
set date_of_birth = REGEXP_replace(date_of_birth, '[/.]', '-', 'g')
where date_of_birth is not null and date_of_birth != ''

update public.customers_clean
set date_of_birth = ConCAT(
    split_part(date_of_birth, '-', 1), '-',
    split_part(date_of_birth, '-', 3), '-',
    split_part(date_of_birth, '-', 2)
)
where length(split_part(date_of_birth, '-', 1)) = 4
and split_part(date_of_birth, '-', 2)::inT > 12
and date_of_birth is not null and date_of_birth != ''

update public.customers_clean
set date_of_birth = to_date(date_of_birth, 'DD-MM-YYYY')::VARCHAR
where length(split_part(date_of_birth, '-', 1)) = 2
and split_part(date_of_birth, '-', 1)::inT > 12
and date_of_birth is not null and date_of_birth != ''

-- Fix impossible date
update public.customers_clean
set date_of_birth = '1995-09-30'
where date_of_birth = '1995-09-31';

-- Fix future dates
update public.customers_clean
set date_of_birth = 'Invalid'
where date_of_birth ~ '^\d{4}-\d{2}-\d{2}$'
and date_of_birth::DATE > current_date

select DisTinCT date_of_birth
from public.customers_clean
where date_of_birth not like '____-__-__'
and date_of_birth is not null and date_of_birth != ''

-- Fix phone (US customers only)
update public.customers_clean
set phone = ConCAT(
    SUBSTRinG(REGEXP_replace(phone, '[^0-9]', '', 'g'), 1, 3), '-',
    SUBSTRinG(REGEXP_replace(phone, '[^0-9]', '', 'g'), 4, 3), '-',
    SUBSTRinG(REGEXP_replace(phone, '[^0-9]', '', 'g'), 7, 4)
)
where phone is not null and phone != ''
and country = 'USA';

-- Fix email
update public.customers_clean
set email = case
    when email is null or email = '' then 'Unknown'
    when email ilike '%@@%' then replace(email, '@@', '@')
    when email not like '%@%' then 'Invalid - Missing @'
    when email not like '%.%' then 'Invalid - Missing Domain'
    else email
end

-- Fix state (uppercase)
update public.customers_clean
set state = upper(state)

-- Fix zip code
update public.customers_clean
set zip_code = replace(zip_code, ' ', '')

-- Fix country
update public.customers_clean
set country = case
    when country ilike '%america%' then 'USA'
    when country ilike '%united st%' then 'USA'
    when country ilike 'us%' then 'USA'
    when country ilike 'u.s%' then 'USA'
    when country ilike '%united k%' then 'UK'
    when country ilike 'uk%' then 'UK'
    when country ilike '%uae%' then 'UAE'
    else country
end

-- Fix is_active
update public.customers_clean
set is_active = case
    when is_active ilike 'y%' then 'Yes'
    when is_active ilike 'n%' then 'No'
    else 'Check Activity'
end

-- Fix kyc_verified
update public.customers_clean
set kyc_verified = case
    when kyc_verified ilike 'y%' then 'Yes'
    when kyc_verified ilike 'n%' then 'No'
    else 'Check Verification'
end

-- Fix join_date
update public.customers_clean
set join_date = REGEXP_replace(join_date, '[/.]', '-', 'g')
where join_date is not null and join_date != ''

update public.customers_clean
set join_date = ConCAT(
    split_part(join_date, '-', 1), '-',
    split_part(join_date, '-', 3), '-',
    split_part(join_date, '-', 2)
)
where length(split_part(join_date, '-', 1)) = 4
and split_part(join_date, '-', 2)::inT > 12
and join_date is not null and join_date != ''

select DisTinCT join_date
from public.customers_clean
where join_date not like '____-__-__'
and join_date is not null and join_date != ''

-- Fix annual_income (flag missing)
update public.customers_clean
set notes = 'Missing Annual Income - review required'
where annual_income is null

-- trim all text columns
update public.customers_clean
set
    customer_id = trim(customer_id),
    first_name = trim(first_name),
    last_name = trim(last_name),
    full_name = trim(full_name),
    gender = trim(gender),
    phone = trim(phone),
    email = trim(email),
    address = trim(address),
    city = trim(city),
    state = trim(state),
    zip_code = trim(zip_code),
    country = trim(country),
    employment_status = trim(employment_status),
    marital_status = trim(marital_status),
    nationality = trim(nationality),
    is_active = trim(is_active),
    kyc_verified = trim(kyc_verified),
    branch_id = trim(branch_id),
    notes = trim(notes)

-- ============================================================
-- ACcountS CLEAN
-- ============================================================

-- Find and remove exact duplicates
delete from public.accounts_clean
where account_id in (
    select account_id from (
        select account_id,
            row_number() over (PARTITIon BY customer_id, branch_id, account_type, account_status order by account_id) as rn
        from public.accounts_clean
    ) as sub
    where rn > 1
)

-- Fix is_active
update public.accounts_clean
set is_active = case
    when is_active ilike 'y%' then 'Yes'
    when is_active ilike 'n%' then 'No'
    else 'Check Activity'
end;

-- Fix currency
update public.accounts_clean
set currency = upper(currency)

-- Fix open_date
update public.accounts_clean
set open_date = REGEXP_replace(open_date, '[/.]', '-', 'g')
where open_date is not null and open_date != ''

update public.accounts_clean
set open_date = ConCAT(
    split_part(open_date, '-', 1), '-',
    split_part(open_date, '-', 3), '-',
    split_part(open_date, '-', 2)
)
where length(split_part(open_date, '-', 1)) = 4
and split_part(open_date, '-', 2)::inT > 12
and open_date is not null and open_date != ''

-- Fix garbled date ACC007
update public.accounts_clean
set open_date = '2020-07-20'
where open_date = '20/07/2020'

-- Fix swapped day/month
update public.accounts_clean
set open_date = ConCAT(
    split_part(open_date, '-', 1), '-',
    split_part(open_date, '-', 3), '-',
    split_part(open_date, '-', 2)
)
where split_part(open_date, '-', 2)::inT > 12
and length(split_part(open_date, '-', 1)) = 4

-- Fix last_transaction date
update public.accounts_clean
set last_transaction = REGEXP_replace(last_transaction, '[/.]', '-', 'g')
where last_transaction is not null and last_transaction != ''

update public.accounts_clean
set last_transaction = ConCAT(
    split_part(last_transaction, '-', 1), '-',
    split_part(last_transaction, '-', 3), '-',
    split_part(last_transaction, '-', 2)
)
where length(split_part(last_transaction, '-', 1)) = 4
and split_part(last_transaction, '-', 2)::inT > 12
and last_transaction is not null and last_transaction != ''

select DisTinCT last_transaction
from public.accounts_clean
where last_transaction not like '____-__-__'
and last_transaction is not null and last_transaction != ''

-- Flag negative balance (overdraft check)
update public.accounts_clean
set notes = 'Overdraft limit reached - review needed'
where account_id = 'ACC009' and balance < 0

-- Flag invalid interest rates
update public.accounts_clean
set notes = ConCAT('Invalid interest rate was ', interest_rate::VARCHAR, ' - review required')
where interest_rate > 10

update public.accounts_clean
set interest_rate = null
where interest_rate > 10

update public.accounts_clean
set interest_rate = abs(interest_rate)
where interest_rate < 0

-- Flag missing balance and currency
update public.accounts_clean
set notes = case
    when balance is null and currency is null then 'Missing balance and currency - update required'
    when balance is null then 'Missing balance - update required'
    when currency is null then 'Missing currency - update required'
    when interest_rate is null then 'Missing interest rate - review required'
    when interest_rate > 10 then 'Invalid interest rate - review required'
    when balance < 0 and abs(balance) > overdraft_limit then 'Overdraft limit exceeded - review required'
    else notes
end

-- trim all text columns
update public.accounts_clean
set
    account_id = trim(account_id),
    customer_id = trim(customer_id),
    branch_id = trim(branch_id),
    account_type = trim(account_type),
    account_status = trim(account_status),
    open_date = trim(open_date),
    close_date = trim(close_date),
    currency = trim(currency),
    last_transaction = trim(last_transaction),
    is_active = trim(is_active),
    employee_id = trim(employee_id),
    notes = trim(notes);

-- ============================================================
-- TRANSACTIonS CLEAN
-- ============================================================

-- Find and remove exact duplicates
delete from public.transactions_clean
where transaction_id in (
    select transaction_id from (
        select transaction_id,
            row_number() over (PARTITIon BY customer_id, transaction_type, amount, transaction_date order by transaction_id) as rn
        from public.transactions_clean
    ) as sub
    where rn > 1
)

-- Delete ghost records
delete from public.transactions_clean
where account_id is null
and amount is null
and transaction_date is null
and customer_id is null

-- Fix currency
update public.transactions_clean
set currency = upper(currency)

-- Flag missing currency
update public.transactions_clean
set notes = 'Missing currency'
where currency is null

-- Make all withdrawals negative
update public.transactions_clean
set amount = -abs(amount)
where transaction_type = 'Withdrawal'
and amount > 0

-- Fix negative amounts for deposits
update public.transactions_clean
set amount = abs(amount)
where transaction_type = 'Deposit'
and amount < 0

-- Flag overdraft
update public.transactions_clean
set notes = 'Account went into overdraft after withdrawal'
where balance_after < 0

-- Flag zero amount transactions
update public.transactions_clean
set notes = 'Invalid - Zero amount Transaction'
where amount = 0

-- Fix transaction_date
update public.transactions_clean
set transaction_date = REGEXP_replace(transaction_date, '[/.]', '-', 'g')
where transaction_date is not null and transaction_date != '';

update public.transactions_clean
set transaction_date = ConCAT(
    split_part(transaction_date, '-', 1), '-',
    split_part(transaction_date, '-', 3), '-',
    split_part(transaction_date, '-', 2)
)
where length(split_part(transaction_date, '-', 1)) = 4
and split_part(transaction_date, '-', 2)::inT > 12
and transaction_date is not null and transaction_date != ''

update public.transactions_clean
set transaction_date = to_date(transaction_date, 'DD-MM-YYYY')::VARCHAR
where length(split_part(transaction_date, '-', 1)) = 2
and split_part(transaction_date, '-', 1)::inT > 12
and transaction_date is not null and transaction_date != ''

select DisTinCT transaction_date
from public.transactions_clean
where transaction_date not like '____-__-__'
and transaction_date is not null and transaction_date != ''

-- Fix status (standardize casing)
update public.transactions_clean
set status = inITCAP(status);

-- Fix channel
update public.transactions_clean
set channel = case
    when channel ilike '%wire%' then 'Wire Transfer'
    when channel ilike '%bran%' then 'Branch'
    when channel ilike '%atm%' then 'ATM'
    when channel ilike '%on%' then 'Online'
    when channel ilike '%card%' then 'Card'
    else channel
end;

-- trim all text columns
update public.transactions_clean
set
    transaction_id = trim(transaction_id),
    account_id = trim(account_id),
    customer_id = trim(customer_id),
    branch_id = trim(branch_id),
    transaction_type = trim(transaction_type),
    currency = trim(currency),
    transaction_date = trim(transaction_date),
    description = trim(description),
    status = trim(status),
    employee_id = trim(employee_id),
    channel = trim(channel),
    notes = trim(notes)

-- ============================================================
-- LOANS CLEAN
-- ============================================================

-- Find and remove exact duplicates
delete from public.loans_clean
where loan_id in (
    select loan_id from (
        select loan_id,
            row_number() over (PARTITIon BY customer_id, loan_type, loan_amount, start_date order by loan_id) as rn
        from public.loans_clean
    ) as sub
    where rn > 1
)

-- Fix loan_amount (abs for negatives)
update public.loans_clean
set loan_amount = abs(loan_amount)

-- Fix interest_rate
update public.loans_clean
set interest_rate = abs(interest_rate)
where interest_rate < 0

-- Flag and null invalid high interest rates
update public.loans_clean
set notes = ConCAT('Invalid interest rate was ', interest_rate::VARCHAR, ' - review required')
where interest_rate > 27;

update public.loans_clean
set interest_rate = null
where interest_rate > 27

-- Fix start_date
update public.loans_clean
set start_date = REGEXP_replace(start_date, '[/.]', '-', 'g')
where start_date is not null and start_date != ''

update public.loans_clean
set start_date = ConCAT(
    split_part(start_date, '-', 1), '-',
    split_part(start_date, '-', 3), '-',
    split_part(start_date, '-', 2)
)
where length(split_part(start_date, '-', 1)) = 4
and split_part(start_date, '-', 2)::inT > 12
and start_date is not null and start_date != ''

update public.loans_clean
set start_date = to_date(start_date, 'DD-MM-YYYY')::VARCHAR
where length(split_part(start_date, '-', 1)) = 2
and split_part(start_date, '-', 1)::inT > 12
and start_date is not null and start_date != ''

select DisTinCT start_date
from public.loans_clean
where start_date not like '____-__-__'
and start_date is not null and start_date != ''

-- Fix end_date
update public.loans_clean
set end_date = REGEXP_replace(end_date, '[/.]', '-', 'g')
where end_date is not null and end_date != ''

update public.loans_clean
set end_date = ConCAT(
    split_part(end_date, '-', 1), '-',
    split_part(end_date, '-', 3), '-',
    split_part(end_date, '-', 2)
)
where length(split_part(end_date, '-', 1)) = 4
and split_part(end_date, '-', 2)::inT > 12
and end_date is not null and end_date != ''

update public.loans_clean
set end_date = to_date(end_date, 'DD-MM-YYYY')::VARCHAR
where length(split_part(end_date, '-', 1)) = 2
and split_part(end_date, '-', 1)::inT > 12
and end_date is not null and end_date != ''

select DisTinCT end_date
from public.loans_clean
where end_date not like '____-__-__'
and end_date is not null and end_date != ''

-- Fix currency
update public.loans_clean
set currency = upper(currency);

-- Fix is_active
update public.loans_clean
set is_active = case
    when is_active ilike 'y%' then 'Yes'
    when is_active ilike 'n%' then 'No'
    else 'Check Activity'
end

-- DATA IMPUTATIon - Fill missing interest rates
-- Step 1: Find average by loan type
select loan_type, round(avg(interest_rate), 2) as avg_rate
from public.loans_clean
where interest_rate is not null
group by loan_type
-- Personal: 8.92, Auto: 5.45, Business: 5.02, Mortgage: 3.50

-- Step 2: Impute missing rates
update public.loans_clean
set
    interest_rate = case
        when loan_type = 'Personal' then 8.92
        when loan_type = 'Auto' then 5.45
        when loan_type = 'Business' then 5.02
        when loan_type = 'Mortgage' then 3.50
        else interest_rate
    end,
    notes = ConCAT('Imputed rate ',
        case
            when loan_type = 'Personal' then '8.92'
            when loan_type = 'Auto' then '5.45'
            when loan_type = 'Business' then '5.02'
            when loan_type = 'Mortgage' then '3.50'
        end, '% - original was null')
where interest_rate is null;

-- Impute missing monthly payments using amortization formula
update public.loans_clean
set
    monthly_payment = round(
        loan_amount * (interest_rate/1200) /
        (1 - power(1 + interest_rate/1200, -term_months))
    , 2),
    notes = ConCAT(notes, ' | Monthly Payment Imputed')
where monthly_payment is null;

-- trim all text columns
update public.loans_clean
set
    loan_id = trim(loan_id),
    customer_id = trim(customer_id),
    branch_id = trim(branch_id),
    employee_id = trim(employee_id),
    loan_type = trim(loan_type),
    start_date = trim(start_date),
    end_date = trim(end_date),
    loan_status = trim(loan_status),
    currency = trim(currency),
    collateral = trim(collateral),
    is_active = trim(is_active),
    notes = trim(notes);


