#  FNCB International Banking Analysis

End-to-end data analytics project covering data cleaning, SQL analysis, and Power BI visualization on a simulated international banking dataset spanning 6 interconnected tables.



##  Project Overview

A multinational bank with 20 branches across the USA, UK, Canada, and Mexico. This project analyzes 356 customers, 169 loans, 271 transactions, and 148 employees to uncover branch performance gaps, loan risk, customer behavior, and workforce insights.

**Total Loans: $29.23M | Total Outstanding: $25.83M | Default Rate: 2.96 | Total Transactions: 271**



##  Tools Used

| Tool | Purpose |
|------|---------|
| Microsoft Excel | Initial data review |
| PostgreSQL | Data cleaning and analysis |
| Power BI | Dashboard and visualization |



##  Project Files

| File | Description |
|------|-------------|
| `FNCB_Complete_Database.sql` | Full database including raw data, cleaned tables, and all transformations |
| `banking_cleaning.sql` | Standalone data cleaning script across all 6 tables |
| `banking_analysis.sql` | All 75 SQL analysis queries with results |
| `FNCB_Dashboard.pbix` | Power BI dashboard (5 pages) |
| `fncb_presentation.html` | Client-facing project presentation |



##  Database Structure

6 tables cleaned and analyzed:

| Table | Description |
|-------|-------------|
| `branches_clean` | 20 branches across 4 countries with monthly targets |
| `employees_clean` | 148 employees with salary, department, hire date, and performance ratings |
| `customers_clean` | 356 customers across 15+ countries with credit scores and income data |
| `accounts_clean` | Account balances, types, currencies, and status |
| `transactions_clean` | 271 transactions across 5 channels with dates and amounts |
| `loans_clean` | 169 loans across 4 types with interest rates, terms, and payment status |



##  Data Cleaning

All cleaning is contained within `FNCB_Complete_Database.sql` and extracted separately in `banking_cleaning.sql`.

### Issues Found and Fixed Across All 6 Tables

| Problem | Fix |
|---------|-----|
| Exact duplicate records | Removed using `ROW_NUMBER()` window function partitioned by key fields |
| Ghost record (completely empty row) | Deleted customer C101 and employee E081 |
| Inconsistent name and country casing (usa, US, U.S.A) | Standardized using `INITCAP()` and `CASE WHEN` |
| 3 different date formats (MM/DD/YYYY, DD/MM/YYYY, YYYY-DD-MM) | Fixed using `TO_DATE()` with `REGEXP_REPLACE()` across 8 date columns |
| Inconsistent gender values (M, MALE, male, F) | Standardized using `ILIKE` and `CASE WHEN` |
| Messy international phone numbers | Standardized USA phones to XXX-XXX-XXXX using `REGEXP_REPLACE()` |
| Invalid email formats (missing @, double @@) | Flagged using `CASE WHEN` with pattern matching |
| Negative salary and loan amounts | Fixed using `ABS()` |
| Interest rates above 27% | Flagged as invalid and set to NULL |
| Missing monthly payments on loans | Imputed using the amortization formula: M = P[r(1+r)^n] / [(1+r)^n - 1] |
| Overdraft and zero-amount transactions | Flagged with a status column |
| Inconsistent transaction channels (online, ONLINE, Online) | Standardized using `INITCAP()` |
| Empty string dates stored as text | Replaced with NULL using targeted UPDATE statements |
| Whitespace in all text fields | Cleaned using `TRIM()` across every text column |



##  SQL Analysis | 75 Questions

###  Branch Analysis (Q1–Q8)
| # | Question | Answer |
|---|----------|--------|
| 1 | Which branch has the most customers? | **Manhattan Main** | 26 customers |
| 2 | Which branch generates the most loan revenue? | **Mexico City Centro** | $862,000 |
| 3 | Which branch has the highest average account balance? | **Houston Energy** | $28,105,752 |
| 4 | Which branch has the most employees? | **Chicago Loop** | 10 employees |
| 5 | Which branch has the most transactions? | **Manhattan Main** | 25 transactions |
| 6 | Which branch has the highest performing employees? | **London City** | avg rating 4.0 |
| 7 | Which branches are below their monthly target? | **17 of 20 branches** | London City gap $725,778 |
| 8 | Which country has the most branches? | **USA** | 17 branches |

###  Customer Analysis (Q9–Q20)
| # | Question | Answer |
|---|----------|--------|
| 9 | How many customers per country? | USA 161 · UK 20 · Canada 20 · Mexico 20 |
| 10 | Average credit score by country? | UAE 758.0 · Canada 755.0 · Germany 745.3 |
| 11 | Customers with more than one account? | Jack Rodriguez leads with 3 accounts |
| 12 | Customers with more than one loan? | Harry Bell and others with 2 loans |
| 13 | Customers with both multiple accounts and multiple loans? | 7 customers including James Wilson and Frank Nguyen |
| 14 | Average annual income by employment status? | Self-Employed $113,726 · Employed $77,698 · Unemployed $0 |
| 15 | Customers with highest total balance? | Sungho Choi $149M · Hyunwoo Shin $128M |
| 16 | Customers who have never made a transaction? | **166 customers** |
| 17 | Customers with unverified KYC? | **None** | all customers verified |
| 18 | Age distribution of customers? | Middle Aged 251 · Young Adult 105 |
| 19 | Nationality with highest average credit score? | **UAE** | 758 average |
| 20 | Male vs female customers? | Male 182 · Female 174 |

###  Account Analysis (Q21–Q28)
| # | Question | Answer |
|---|----------|--------|
| 21 | Total balance by account type? | Business $371.4M · Savings $327.7M · Checking $143.6M |
| 22 | Account type with highest average balance? | **Business** | $6,877,759 avg |
| 23 | How many dormant accounts? | **4 accounts** |
| 24 | Most common currency? | **USD** | 175 accounts |
| 25 | Accounts with negative balance? | **1 account** |
| 26 | Total balance by currency? | KRW $646M · JPY $108M · INR $52M |
| 27 | Branch with most dormant accounts? | Brooklyn Heights and Manhattan Main | 2 each |
| 28 | Accounts opened each year? | 2020: 45 · 2021: 67 · 2022: 83 · 2023: 106 · 2024: 57 |

###  Transaction Analysis (Q29–Q38)
| # | Question | Answer |
|---|----------|--------|
| 29 | Total deposits vs withdrawals? | Deposits $46,180,550 · Withdrawals $1,047,200 |
| 30 | Month with most transactions? | **January** | 138 transactions |
| 31 | Customer with highest total spending? | **Jack Rodriguez** | $503,000 |
| 32 | Average transaction amount by channel? | Wire Transfer $369,766 · Online $104,943 · Branch $5,361 |
| 33 | How many failed transactions? | **1 transaction** |
| 34 | Account with most transactions? | **ACC001** | 5 transactions |
| 35 | Total transaction amount by year? | 2024: $44,441,350 · 2023: $633,200 |
| 36 | Branch with most transaction volume? | **London City** | $34,695,900 |
| 37 | Suspicious transactions above $500,000? | **13 transactions** |
| 38 | Busiest day of the week? | **Thursday** | 94 transactions |

###  Loan Analysis (Q39–Q48)
| # | Question | Answer |
|---|----------|--------|
| 39 | Total loan amount by type? | Business $24.8M · Mortgage $21.6M · Personal $1.5M · Auto $591K |
| 40 | Loan type with highest default rate? | **Personal** | 11.1% · Auto 5.0% · Business 0.0% · Mortgage 0.0% |
| 41 | Average interest rate by loan type? | Personal 9.1% · Auto 5.4% · Business 5.0% · Mortgage 4.0% |
| 42 | Customers with defaulted loans? | 5 customers including Julia Davis and Charles Lewis |
| 43 | Total outstanding balance? | **$44,223,251** (raw multi-currency) · **$25.83M** (USD normalized) |
| 44 | Branch with most defaulted loans? | **Denver Mile High** | 2 defaults |
| 45 | How many loans were restructured? | **4 loans** |
| 46 | Average loan term by type? | Mortgage 326 months · Business 103 · Auto 58.8 · Personal 41 |
| 47 | Currency with highest total loan amount? | **USD** | $25,433,500 |
| 48 | Customers with both mortgage and business loan? | **4 customers** |

###  Employee Analysis (Q49–Q55)
| # | Question | Answer |
|---|----------|--------|
| 49 | Average salary by department? | Management $90,850 · Analytics $74,750 · Advisory $71,875 |
| 50 | Department with highest performing employees? | **Management** | avg rating 4.5 |
| 51 | Branch with highest average employee salary? | **London City** | $97,000 |
| 52 | Employees hired each year? | Spread across 2005 to 2024 |
| 53 | Longest serving employees? | Robert Johnson 21 years · Patricia Harris 19 years |
| 54 | Salary range by job title? | Branch Manager $81K to $120K · Senior Analyst $69K to $96K |
| 55 | Manager with most direct reports? | David Wilson and Jennifer Brown | 9 reports each |

###  Cross-Table and Advanced Analysis (Q56–Q75)
| # | Question | Answer |
|---|----------|--------|
| 56 | Customer financial profile? | Full profile by accounts, loans, and transactions per customer |
| 57 | Customers with loans but no active accounts? | 14 customers including Betty Allen and Kevin Bell |
| 58 | Employee who processed most loan applications? | **Oliver James** | 32 loans |
| 59 | Branches where loan amount exceeds account balance? | 13 branches | Mexico City Centro leads at $5.4M gap |
| 60 | Top 10 customers by net worth? | Sungho Choi $148.8M · Hyunwoo Shin $128M |
| 61 | Total loan amount by year with YoY growth? | 2022 peak at $18.7M · 2024 dropped 80.7% |
| 62 | Total deposits year over year? | 2024: $45.4M · 2023: $633K · YoY growth 7,075% |
| 63 | Branch with most transaction growth YoY? | Varies by year | large swings across branches |
| 64 | Monthly transaction volume for 2024? | January $29.7M · February $14.7M |
| 65 | Month with highest loan approvals? | **October** | 19 · January 16 |
| 66 | Month over month change in account balances? | Large swings | Feb up $117M · Dec down $103M |
| 67 | Customer segmentation by balance? | High 158 · Medium 112 · Low 32 · Unknown 1 |
| 68 | Customers with bank the longest? | Rachel Foster and Maria Garcia | 6 years |
| 69 | Customers who joined in 2020 with active accounts? | 43 records returned |
| 70 | Customer segment with highest default rate? | **Low balance segment** | 12.5% default rate |
| 71 | Running total of deposits by month? | Cumulative total reaches $46.2M by month 11 |
| 72 | 3 month moving average of transaction amounts? | Rolling avg computed per transaction date |
| 73 | Cumulative loan amount by branch? | BR001 reaches $2.65M cumulative by month 10 |
| 74 | Rank branches by total revenue using DENSE_RANK? | Mexico City Centro rank 1 · Los Angeles Downtown rank 2 |
| 75 | Rank countries by average credit score? | UAE rank 1 · Canada rank 2 · Germany rank 3 |



##  Power BI Dashboard

**5-page interactive dashboard with Branch, Year, Country, Loan Status, and Transaction Type slicers:**

1. **Executive Overview** | KPI cards, top 10 revenue by branch, transaction type split, average account balance by account type
2. **Branch Performance** | avg account balance by branch, employees by branch, transactions by branch, top 10 loans by branch, customers by branch
3. **Customer Analysis** | customer segments, top 10 customers by balance, customers by occupation, credit score distribution, new customers by year, customers by country
4. **Loan Analysis** | loan status donut, loans by type, loans issued over time by month
5. **Transaction Analysis** | avg transaction value by channel, transactions by branch count, transaction value by branch



##  Key Business Insights

- **17 of 20 branches are missing their monthly revenue target** | London City has the largest gap at $725,778 despite leading in transaction volume
- **166 customers have never made a single transaction** | nearly half the customer base is dormant and represents an untapped engagement opportunity
- **Personal loans carry an 11.1% default rate** | Business and Mortgage loans show zero defaults, pointing to a credit risk gap in personal loan underwriting
- **Los Angeles Downtown leads all branches in collected loan revenue** at $454K, with Mexico City Centro leading in total loan amount issued
- **89.35% of all loans are currently active** | strong portfolio health overall, with only 2.96% in default across all loan types
- **Deposit activity surged 7,075% in 2024** | from $633K to $45.4M, driven primarily by large wire transfer transactions
- **Low balance customers default at 12.5%** | significantly higher than medium and high balance segments, which show 0% defaults



##  Recommendation

The bank is positioned for international growth but the domestic foundation needs strengthening first. Activating dormant customers, closing the revenue gap across underperforming branches, and tightening personal loan underwriting are the three priorities before scaling internationally. The goal is to identify the strongest performing branch and use it as the blueprint to build the international network around.




##  Author

**Mahil Joarder**
Data Analyst | SQL · Excel · Power BI
**GitHub:** github.com/mahiljoarder
