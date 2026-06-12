-- ============================================================
-- FNCB BANKING — COMPLETE DATABASE
-- Mahil Joarder
-- ============================================================
-- HOW TO USE:
-- 1. Open pgAdmin and connect to your database
-- 2. Run this entire file
-- 3. Done — all tables created, cleaned, and ready for Power BI
-- ============================================================

-- Drop everything and start clean
drop table if exists public.loans_clean;
drop table if exists public.transactions_clean;
drop table if exists public.accounts_clean;
drop table if exists public.customers_clean;
drop table if exists public.employees_clean;
drop table if exists public.branches_clean;
drop table if exists public.loans;
drop table if exists public.transactions;
drop table if exists public.accounts;
drop table if exists public.customers;
drop table if exists public.employees;
drop table if exists public.branches;

CREATE TABLE branches (
    branch_id       VARCHAR(10),
    branch_name     VARCHAR(100),
    address         VARCHAR(200),
    city            VARCHAR(50),
    state           VARCHAR(10),
    zip_code        VARCHAR(15),
    country         VARCHAR(50),
    phone           VARCHAR(30),
    manager_name    VARCHAR(100),
    open_date       VARCHAR(20),
    is_active       VARCHAR(10),
    total_employees INT,
    monthly_target  NUMERIC(15,2),
    notes           TEXT
);


INSERT INTO branches VALUES
('BR001', 'Manhattan Main', '100 Wall Street', 'New York', 'NY', '10005', 'USA', '212-555-0001', 'Robert Johnson', '2005-01-15', 'Yes', 25, 500000.00, 'Flagship branch'),
('BR002', 'Brooklyn Heights', '200 Atlantic Ave', 'Brooklyn', 'NY', '11201', 'USA', '718-555-0002', 'Sarah Williams', '2008-03-20', 'Yes', 18, 350000.00, 'High traffic branch'),
('BR003', 'Los Angeles Downtown', '300 S Grand Ave', 'Los Angeles', 'CA', '90071', 'USA', '213-555-0003', 'Michael Davis', '2010-06-10', 'Yes', 20, 400000.00, 'West coast hub'),
('BR004', 'Chicago Loop', '400 N Michigan Ave', 'Chicago', 'IL', '60611', 'USA', '312-555-0004', 'Jennifer Brown', '2007-09-15', 'Yes', 22, 450000.00, 'Midwest headquarters'),
('BR005', 'Houston Energy', '500 Main St', 'Houston', 'TX', '77002', 'USA', '713-555-0005', 'David Wilson', '2012-02-28', 'Yes', 15, 300000.00, 'Energy sector focus'),
('BR006', 'Phoenix Desert', '600 N Central Ave', 'Phoenix', 'AZ', '85004', 'USA', '602-555-0006', 'Lisa Martinez', '2015-07-01', 'Yes', 12, 250000.00, 'Growing market'),
('BR007', 'Philadelphia Liberty', '700 Market St', 'Philadelphia', 'PA', '19106', 'USA', '215-555-0007', 'James Anderson', '2009-11-20', 'Yes', 16, 320000.00, 'Historic district'),
('BR008', 'San Antonio Riverwalk', '800 Commerce St', 'San Antonio', 'TX', '78205', 'USA', '210-555-0008', 'Maria Garcia', '2013-04-15', 'Yes', 14, 280000.00, 'Tourist area'),
('BR009', 'San Diego Bay', '900 Harbor Dr', 'San Diego', 'CA', '92101', 'USA', '619-555-0009', 'Thomas Lee', '2011-08-30', 'Yes', 13, 260000.00, 'Naval base proximity'),
('BR010', 'Dallas Uptown', '1000 McKinney Ave', 'Dallas', 'TX', '75204', 'USA', '214-555-0010', 'Amanda White', '2014-01-10', 'Yes', 17, 340000.00, 'Upscale clientele'),
('BR011', 'Miami Beach', '1100 Collins Ave', 'Miami Beach', 'FL', '33139', 'USA', '305-555-0011', 'Carlos Rodriguez', '2016-05-20', 'Yes', 11, 220000.00, 'International clients'),
('BR012', 'Seattle Pike', '1200 Pike St', 'Seattle', 'WA', '98101', 'USA', '206-555-0012', 'Rachel Kim', '2010-12-01', 'Yes', 19, 380000.00, 'Tech sector focus'),
('BR013', 'Denver Mile High', '1300 16th St', 'Denver', 'CO', '80202', 'USA', '720-555-0013', 'Kevin Thompson', '2017-03-15', 'Yes', 10, 200000.00, 'Mountain west'),
('BR014', 'Boston Faneuil', '1400 State St', 'Boston', 'MA', '02109', 'USA', '617-555-0014', 'Patricia Harris', '2006-07-04', 'Yes', 21, 420000.00, 'Financial district'),
('BR015', 'Atlanta Peachtree', '1500 Peachtree St', 'Atlanta', 'GA', '30309', 'USA', '404-555-0015', 'Steven Clark', '2013-09-01', 'Yes', 16, 320000.00, 'Southeast hub'),
('BR016', 'Minneapolis Twin', '1600 Nicollet Mall', 'Minneapolis', 'MN', '55402', 'USA', '612-555-0016', 'Nancy Lewis', '2018-01-15', 'Yes', 9, 180000.00, 'New branch'),
('BR017', 'Portland Rose', '1700 SW Broadway', 'Portland', 'OR', '97201', 'USA', '503-555-0017', 'Daniel Walker', '2019-06-01', 'Yes', 8, 160000.00, 'Newest branch'),
('BR018', 'London City', '18 Bishopsgate', 'London', 'ENG', 'EC2N 4AI', 'United Kingdom', '44-20-555-0018', 'Elizabeth Scott', '2008-01-20', 'Yes', 30, 750000.00, 'International HQ'),
('BR019', 'Toronto Finance', '19 Bay Street', 'Toronto', 'ON', 'M5J 2T3', 'Canada', '416-555-0019', 'William Young', '2012-05-15', 'Yes', 20, 500000.00, 'Canadian operations'),
('BR020', 'Mexico City Centro', '20 Paseo de la Reforma', 'Mexico City', 'CDMX', '06600', 'Mexico', '52-55-555-0020', 'Isabella Hernandez', '2015-11-01', 'N', 15, 300000.00, 'Latin America hub');

-- ============================================================
-- TABLE 2: EMPLOYEES
-- ============================================================
CREATE TABLE employees (
    employee_id     VARCHAR(10),
    branch_id       VARCHAR(10),
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    full_name       VARCHAR(100),
    gender          VARCHAR(20),
    date_of_birth   VARCHAR(20),
    hire_date       VARCHAR(20),
    job_title       VARCHAR(50),
    department      VARCHAR(50),
    salary          NUMERIC(10,2),
    phone           VARCHAR(30),
    email           VARCHAR(100),
    manager_id      VARCHAR(10),
    is_active       VARCHAR(10),
    performance_rating INT,
    years_experience INT,
    education_level VARCHAR(50),
    notes           TEXT
);

INSERT INTO employees VALUES
-- Manhattan Main BR001
('E001', 'BR001', 'Robert', 'Johnson', 'Robert Johnson', 'Male', '1975-05-15', '2005-01-15', 'Branch Manager', 'Management', 95000.00, '212-555-1001', 'robert.johnson@bank.com', NULL, 'Yes', 5, 20, 'MBA', 'Branch Manager'),
('E002', 'BR001', 'Emily', 'Chen', 'Emily Chen', 'Female', '1988-03-22', '2015-06-01', 'Senior Analyst', 'Analytics', 78000.00, '212-555-1002', 'emily.chen@bank.com', 'E001', 'Yes', 4, 8, 'Bachelor', 'Good performer'),
('E003', 'BR001', 'MARCUS', 'THOMPSON', 'MARCUS THOMPSON', 'M', '1990-11-30', '2018-03-15', 'Loan Officer', 'Loans', 65000.00, '(212)555-1003', 'marcus.thompson@bank.com', 'E001', 'Yes', 3, 5, 'Bachelor', 'Messy name'),
('E004', 'BR001', 'sophia', 'rodriguez', 'sophia rodriguez', 'f', '1985/15/07', '2012-09-01', 'Financial Advisor', 'Advisory', 72000.00, '2125551004', 'sophia.rodriguez@bank.com', 'E001', 'Y', 4, 12, 'Master', 'Messy name and date'),
('E005', 'BR001', 'James', 'Wilson', 'James Wilson', 'Male', '1992-08-18', '2020-01-15', 'Teller', 'Operations', 45000.00, '212-555-1005', 'james.wilson@bank.com', 'E001', 'Yes', 3, 3, 'Associate', 'COVID hire'),
-- Brooklyn BR002
('E006', 'BR002', 'Sarah', 'Williams', 'Sarah Williams', 'Female', '1980-02-14', '2008-03-20', 'Branch Manager', 'Management', 88000.00, '718-555-1006', 'sarah.williams@bank.com', NULL, 'Yes', 5, 15, 'MBA', 'Branch Manager'),
('E007', 'BR002', 'Kevin', 'Brown', 'Kevin Brown', 'Male', '1987-09-05', '2016-07-01', 'Senior Teller', 'Operations', 52000.00, '718-555-1007', 'kevin.brown@bank.com', 'E006', 'Yes', 4, 7, 'Bachelor', NULL),
('E008', 'BR002', 'LINDA', 'davis', 'LINDA davis', 'FEMALE', '1993/25/04', '2019-11-15', 'Loan Officer', 'Loans', 63000.00, '(718)555-1008', 'linda.davis@bank.com', 'E006', 'Y', 2, 4, 'Bachelor', 'Messy data'),
('E009', 'BR002', 'Anthony', 'Miller', 'Anthony Miller', 'Male', '1983-06-30', '2010-05-20', 'Financial Advisor', 'Advisory', 70000.00, '7185551009', 'anthony.miller@bank.com', 'E006', 'Yes', 3, 13, 'Master', NULL),
('E010', 'BR002', 'jessica', 'MOORE', 'jessica MOORE', 'F', '1995/10/12', '2021-03-01', 'Teller', 'Operations', 43000.00, '718-555-1010', 'jessica.moore@bank.com', 'E006', 'YES', 3, 2, 'Associate', 'Messy name'),
-- Los Angeles BR003
('E011', 'BR003', 'Michael', 'Davis', 'Michael Davis', 'Male', '1978-07-22', '2010-06-10', 'Branch Manager', 'Management', 92000.00, '213-555-1011', 'michael.davis@bank.com', NULL, 'Yes', 5, 18, 'MBA', 'Branch Manager'),
('E012', 'BR003', 'Ashley', 'Taylor', 'Ashley Taylor', 'Female', '1991-04-17', '2017-08-15', 'Senior Analyst', 'Analytics', 75000.00, '213-555-1012', 'ashley.taylor@bank.com', 'E011', 'Yes', 4, 6, 'Master', NULL),
('E013', 'BR003', 'CHRISTOPHER', 'anderson', 'CHRISTOPHER anderson', 'M', '1986/20/09', '2013-02-28', 'Loan Officer', 'Loans', 67000.00, '(213)555-1013', 'christopher.anderson@bank.com', 'E011', 'Y', 3, 10, 'Bachelor', 'Messy data'),
('E014', 'BR003', 'megan', 'Jackson', 'megan Jackson', 'female', '1994-03-08', '2020-07-01', 'Teller', 'Operations', 44000.00, '2135551014', 'megan.jackson@bank.com', 'E011', 'Yes', 3, 3, 'Associate', 'Messy name'),
('E015', 'BR003', 'Daniel', 'White', 'Daniel White', 'Male', '1989-12-25', '2016-11-01', 'Financial Advisor', 'Advisory', 71000.00, '213-555-1015', 'daniel.white@bank.com', 'E011', 'Yes', 4, 7, 'Master', NULL),
-- Chicago BR004
('E016', 'BR004', 'Jennifer', 'Brown', 'Jennifer Brown', 'Female', '1977-08-14', '2007-09-15', 'Branch Manager', 'Management', 91000.00, '312-555-1016', 'jennifer.brown@bank.com', NULL, 'Yes', 5, 19, 'MBA', 'Branch Manager'),
('E017', 'BR004', 'RYAN', 'HARRIS', 'RYAN HARRIS', 'M', '1990/05/18', '2018-04-01', 'Senior Analyst', 'Analytics', 76000.00, '(312)555-1017', 'ryan.harris@bank.com', 'E016', 'Y', 4, 5, 'Master', 'Messy data'),
('E018', 'BR004', 'amanda', 'martin', 'amanda martin', 'f', '1985-11-30', '2012-06-15', 'Loan Officer', 'Loans', 66000.00, '3125551018', 'amanda.martin@bank.com', 'E016', 'YES', 3, 11, 'Bachelor', 'Messy name'),
('E019', 'BR004', 'Joshua', 'Garcia', 'Joshua Garcia', 'Male', '1993-02-22', '2019-09-01', 'Teller', 'Operations', 44500.00, '312-555-1019', 'joshua.garcia@bank.com', 'E016', 'Yes', 3, 4, 'Associate', NULL),
('E020', 'BR004', 'Stephanie', 'Martinez', 'Stephanie Martinez', 'Female', '1988-07-11', '2015-03-20', 'Financial Advisor', 'Advisory', 73000.00, '312-555-1020', 'stephanie.martinez@bank.com', 'E016', 'Yes', 4, 8, 'Master', NULL),
-- Houston BR005
('E021', 'BR005', 'David', 'Wilson', 'David Wilson', 'Male', '1976-09-03', '2012-02-28', 'Branch Manager', 'Management', 87000.00, '713-555-1021', 'david.wilson@bank.com', NULL, 'Yes', 4, 17, 'MBA', 'Branch Manager'),
('E022', 'BR005', 'NICOLE', 'moore', 'NICOLE moore', 'FEMALE', '1992/15/06', '2019-05-01', 'Senior Analyst', 'Analytics', 74000.00, '(713)555-1022', 'nicole.moore@bank.com', 'E021', 'Y', 3, 4, 'Master', 'Messy data'),
('E023', 'BR005', 'brandon', 'TAYLOR', 'brandon TAYLOR', 'M', '1987-04-28', '2014-08-15', 'Loan Officer', 'Loans', 64000.00, '7135551023', 'brandon.taylor@bank.com', 'E021', 'Yes', 3, 9, 'Bachelor', 'Messy name'),
('E024', 'BR005', 'Samantha', 'Jackson', 'Samantha Jackson', 'Female', '1994-10-17', '2021-01-15', 'Teller', 'Operations', 43500.00, '713-555-1024', 'samantha.jackson@bank.com', 'E021', 'Yes', 3, 2, 'Associate', NULL),
('E025', 'BR005', 'Tyler', 'White', 'Tyler White', 'Male', '1991-01-09', '2017-06-01', 'Financial Advisor', 'Advisory', 69000.00, '713-555-1025', 'tyler.white@bank.com', 'E021', 'Yes', 3, 6, 'Bachelor', NULL),
-- More branches condensed
('E026', 'BR006', 'Lisa', 'Martinez', 'Lisa Martinez', 'Female', '1982-03-15', '2015-07-01', 'Branch Manager', 'Management', 85000.00, '602-555-1026', 'lisa.martinez@bank.com', NULL, 'Yes', 4, 16, 'MBA', 'Branch Manager'),
('E027', 'BR006', 'DEREK', 'robinson', 'DEREK robinson', 'M', '1993/20/08', '2020-02-15', 'Loan Officer', 'Loans', 62000.00, '(602)555-1027', 'derek.robinson@bank.com', 'E026', 'Y', 3, 3, 'Bachelor', 'Messy data'),
('E028', 'BR006', 'crystal', 'LEWIS', 'crystal LEWIS', 'f', '1990-06-25', '2018-09-01', 'Senior Analyst', 'Analytics', 73000.00, '6025551028', 'crystal.lewis@bank.com', 'E026', 'YES', 4, 5, 'Master', 'Messy name'),
('E029', 'BR006', 'Aaron', 'Walker', 'Aaron Walker', 'Male', '1996-11-14', '2022-03-01', 'Teller', 'Operations', 42000.00, '602-555-1029', 'aaron.walker@bank.com', 'E026', 'Yes', 2, 1, 'Associate', NULL),
('E030', 'BR007', 'James', 'Anderson', 'James Anderson', 'Male', '1979-04-20', '2009-11-20', 'Branch Manager', 'Management', 89000.00, '215-555-1030', 'james.anderson@bank.com', NULL, 'Yes', 5, 18, 'MBA', 'Branch Manager'),
('E031', 'BR007', 'BRITTANY', 'hall', 'BRITTANY hall', 'FEMALE', '1991/10/03', '2019-07-15', 'Loan Officer', 'Loans', 63500.00, '(215)555-1031', 'brittany.hall@bank.com', 'E030', 'Y', 3, 4, 'Bachelor', 'Messy data'),
('E032', 'BR007', 'marcus', 'ALLEN', 'marcus ALLEN', 'M', '1988-09-17', '2016-04-01', 'Senior Analyst', 'Analytics', 74500.00, '2155551032', 'marcus.allen@bank.com', 'E030', 'Yes', 4, 7, 'Master', 'Messy name'),
('E033', 'BR008', 'Maria', 'Garcia', 'Maria Garcia', 'Female', '1981-07-08', '2013-04-15', 'Branch Manager', 'Management', 86000.00, '210-555-1033', 'maria.garcia@bank.com', NULL, 'Yes', 4, 16, 'MBA', 'Branch Manager'),
('E034', 'BR008', 'JOSEPH', 'young', 'JOSEPH young', 'M', '1994/25/11', '2021-06-01', 'Loan Officer', 'Loans', 61000.00, '(210)555-1034', 'joseph.young@bank.com', 'E033', 'Y', 2, 2, 'Bachelor', 'Messy data'),
('E035', 'BR008', 'diana', 'HERNANDEZ', 'diana HERNANDEZ', 'f', '1989-02-14', '2017-01-15', 'Senior Analyst', 'Analytics', 72000.00, '2105551035', 'diana.hernandez@bank.com', 'E033', 'YES', 3, 6, 'Master', 'Messy name'),
('E036', 'BR009', 'Thomas', 'Lee', 'Thomas Lee', 'Male', '1983-10-12', '2011-08-30', 'Branch Manager', 'Management', 87500.00, '619-555-1036', 'thomas.lee@bank.com', NULL, 'Yes', 4, 17, 'MBA', 'Branch Manager'),
('E037', 'BR009', 'VICTORIA', 'king', 'VICTORIA king', 'FEMALE', '1992/08/06', '2020-04-15', 'Loan Officer', 'Loans', 62500.00, '(619)555-1037', 'victoria.king@bank.com', 'E036', 'Y', 3, 3, 'Bachelor', 'Messy data'),
('E038', 'BR009', 'austin', 'WRIGHT', 'austin WRIGHT', 'M', '1990-05-19', '2018-10-01', 'Senior Analyst', 'Analytics', 73500.00, '6195551038', 'austin.wright@bank.com', 'E036', 'Yes', 3, 5, 'Master', 'Messy name'),
('E039', 'BR010', 'Amanda', 'White', 'Amanda White', 'Female', '1980-12-03', '2014-01-10', 'Branch Manager', 'Management', 90000.00, '214-555-1039', 'amanda.white@bank.com', NULL, 'Yes', 5, 17, 'MBA', 'Branch Manager'),
('E040', 'BR010', 'NATHAN', 'scott', 'NATHAN scott', 'M', '1993/15/09', '2021-08-01', 'Loan Officer', 'Loans', 63000.00, '(214)555-1040', 'nathan.scott@bank.com', 'E039', 'Y', 3, 2, 'Bachelor', 'Messy data'),
('E041', 'BR010', 'kayla', 'TORRES', 'kayla TORRES', 'f', '1988-08-27', '2015-05-15', 'Senior Analyst', 'Analytics', 74000.00, '2145551041', 'kayla.torres@bank.com', 'E039', 'YES', 4, 8, 'Master', 'Messy name'),
('E042', 'BR011', 'Carlos', 'Rodriguez', 'Carlos Rodriguez', 'Male', '1984-01-16', '2016-05-20', 'Branch Manager', 'Management', 84000.00, '305-555-1042', 'carlos.rodriguez@bank.com', NULL, 'Yes', 4, 15, 'MBA', 'Branch Manager'),
('E043', 'BR011', 'MONICA', 'perez', 'MONICA perez', 'FEMALE', '1991/20/04', '2019-10-01', 'Loan Officer', 'Loans', 61500.00, '(305)555-1043', 'monica.perez@bank.com', 'E042', 'Y', 2, 4, 'Bachelor', 'Messy data'),
('E044', 'BR011', 'alejandro', 'FLORES', 'alejandro FLORES', 'M', '1987-03-11', '2014-07-15', 'Senior Analyst', 'Analytics', 71500.00, '3055551044', 'alejandro.flores@bank.com', 'E042', 'Yes', 3, 9, 'Master', 'Messy name'),
('E045', 'BR012', 'Rachel', 'Kim', 'Rachel Kim', 'Female', '1982-06-24', '2010-12-01', 'Branch Manager', 'Management', 93000.00, '206-555-1045', 'rachel.kim@bank.com', NULL, 'Yes', 5, 18, 'MBA', 'Branch Manager'),
('E046', 'BR012', 'ZACHARY', 'nguyen', 'ZACHARY nguyen', 'M', '1990/12/07', '2018-02-15', 'Loan Officer', 'Loans', 64500.00, '(206)555-1046', 'zachary.nguyen@bank.com', 'E045', 'Y', 3, 5, 'Bachelor', 'Messy data'),
('E047', 'BR012', 'madison', 'CHEN', 'madison CHEN', 'f', '1993-09-08', '2020-11-01', 'Senior Analyst', 'Analytics', 72500.00, '2065551047', 'madison.chen@bank.com', 'E045', 'YES', 3, 3, 'Master', 'Messy name'),
('E048', 'BR013', 'Kevin', 'Thompson', 'Kevin Thompson', 'Male', '1986-04-17', '2017-03-15', 'Branch Manager', 'Management', 83000.00, '720-555-1048', 'kevin.thompson@bank.com', NULL, 'Yes', 4, 14, 'MBA', 'Branch Manager'),
('E049', 'BR013', 'ASHLEY', 'reed', 'ASHLEY reed', 'FEMALE', '1994/18/02', '2022-01-15', 'Loan Officer', 'Loans', 60000.00, '(720)555-1049', 'ashley.reed@bank.com', 'E048', 'Y', 2, 1, 'Bachelor', 'Messy data'),
('E050', 'BR013', 'christopher', 'COOK', 'christopher COOK', 'M', '1991-07-23', '2019-06-01', 'Senior Analyst', 'Analytics', 71000.00, '7205551050', 'christopher.cook@bank.com', 'E048', 'Yes', 3, 4, 'Master', 'Messy name'),
('E051', 'BR014', 'Patricia', 'Harris', 'Patricia Harris', 'Female', '1974-11-09', '2006-07-04', 'Branch Manager', 'Management', 94000.00, '617-555-1051', 'patricia.harris@bank.com', NULL, 'Yes', 5, 22, 'MBA', 'Branch Manager'),
('E052', 'BR014', 'JORDAN', 'bailey', 'JORDAN bailey', 'M', '1989/05/10', '2016-09-15', 'Loan Officer', 'Loans', 65000.00, '(617)555-1052', 'jordan.bailey@bank.com', 'E051', 'Y', 3, 7, 'Bachelor', 'Messy data'),
('E053', 'BR014', 'brittany', 'COOPER', 'brittany COOPER', 'f', '1992-01-28', '2020-05-01', 'Senior Analyst', 'Analytics', 73000.00, '6175551053', 'brittany.cooper@bank.com', 'E051', 'YES', 3, 3, 'Master', 'Messy name'),
('E054', 'BR015', 'Steven', 'Clark', 'Steven Clark', 'Male', '1985-08-06', '2013-09-01', 'Branch Manager', 'Management', 86500.00, '404-555-1054', 'steven.clark@bank.com', NULL, 'Yes', 4, 16, 'MBA', 'Branch Manager'),
('E055', 'BR015', 'TIFFANY', 'richardson', 'TIFFANY richardson', 'FEMALE', '1993/22/06', '2021-04-15', 'Loan Officer', 'Loans', 61000.00, '(404)555-1055', 'tiffany.richardson@bank.com', 'E054', 'Y', 2, 2, 'Bachelor', 'Messy data'),
('E056', 'BR015', 'matthew', 'COX', 'matthew COX', 'M', '1988-10-14', '2015-12-01', 'Senior Analyst', 'Analytics', 72000.00, '4045551056', 'matthew.cox@bank.com', 'E054', 'Yes', 3, 8, 'Master', 'Messy name'),
('E057', 'BR016', 'Nancy', 'Lewis', 'Nancy Lewis', 'Female', '1983-05-21', '2018-01-15', 'Branch Manager', 'Management', 82000.00, '612-555-1057', 'nancy.lewis@bank.com', NULL, 'Yes', 4, 15, 'MBA', 'Branch Manager'),
('E058', 'BR016', 'AUSTIN', 'howard', 'AUSTIN howard', 'M', '1995/15/03', '2022-06-01', 'Loan Officer', 'Loans', 59000.00, '(612)555-1058', 'austin.howard@bank.com', 'E057', 'Y', 2, 1, 'Bachelor', 'Messy data'),
('E059', 'BR016', 'jasmine', 'WARD', 'jasmine WARD', 'f', '1992-12-07', '2020-08-15', 'Senior Analyst', 'Analytics', 70000.00, '6125551059', 'jasmine.ward@bank.com', 'E057', 'YES', 3, 3, 'Master', 'Messy name'),
('E060', 'BR017', 'Daniel', 'Walker', 'Daniel Walker', 'Male', '1987-09-18', '2019-06-01', 'Branch Manager', 'Management', 81000.00, '503-555-1060', 'daniel.walker@bank.com', NULL, 'Yes', 3, 14, 'MBA', 'Branch Manager'),
('E061', 'BR017', 'GABRIELLE', 'brooks', 'GABRIELLE brooks', 'FEMALE', '1994/08/11', '2022-09-01', 'Loan Officer', 'Loans', 58000.00, '(503)555-1061', 'gabrielle.brooks@bank.com', 'E060', 'Y', 2, 1, 'Bachelor', 'Messy data'),
('E062', 'BR017', 'hunter', 'KELLY', 'hunter KELLY', 'M', '1993-04-25', '2021-02-15', 'Senior Analyst', 'Analytics', 69000.00, '5035551062', 'hunter.kelly@bank.com', 'E060', 'Yes', 3, 2, 'Bachelor', 'Messy name'),
-- International branches
('E063', 'BR018', 'Elizabeth', 'Scott', 'Elizabeth Scott', 'Female', '1973-02-28', '2008-01-20', 'Branch Manager', 'Management', 120000.00, '44-20-555-1063', 'elizabeth.scott@bank.com', NULL, 'Yes', 5, 25, 'MBA', 'International Manager'),
('E064', 'BR018', 'OLIVER', 'james', 'OLIVER james', 'M', '1985/20/09', '2012-05-15', 'Senior Analyst', 'Analytics', 95000.00, '44-20-555-1064', 'oliver.james@bank.com', 'E063', 'Y', 4, 15, 'Master', 'Messy data'),
('E065', 'BR018', 'charlotte', 'WILLIAMS', 'charlotte WILLIAMS', 'f', '1991-06-14', '2018-08-01', 'Loan Officer', 'Loans', 85000.00, '44-20-555-1065', 'charlotte.williams@bank.com', 'E063', 'Yes', 3, 6, 'Bachelor', 'Messy name'),
('E066', 'BR019', 'William', 'Young', 'William Young', 'Male', '1978-11-07', '2012-05-15', 'Branch Manager', 'Management', 105000.00, '416-555-1066', 'william.young@bank.com', NULL, 'Yes', 5, 20, 'MBA', 'Canadian Manager'),
('E067', 'BR019', 'EMMA', 'wilson', 'EMMA wilson', 'FEMALE', '1990/15/04', '2017-10-01', 'Senior Analyst', 'Analytics', 88000.00, '416-555-1067', 'emma.wilson@bank.com', 'E066', 'Y', 4, 6, 'Master', 'Messy data'),
('E068', 'BR019', 'liam', 'JOHNSON', 'liam JOHNSON', 'M', '1993-08-22', '2020-03-15', 'Loan Officer', 'Loans', 78000.00, '416-555-1068', 'liam.johnson@bank.com', 'E066', 'Yes', 3, 3, 'Bachelor', 'Messy name'),
('E069', 'BR020', 'Isabella', 'Hernandez', 'Isabella Hernandez', 'Female', '1981-03-19', '2015-11-01', 'Branch Manager', 'Management', 98000.00, '52-55-555-1069', 'isabella.hernandez@bank.com', NULL, 'Yes', 4, 18, 'MBA', 'Mexico Manager'),
('E070', 'BR020', 'SANTIAGO', 'garcia', 'SANTIAGO garcia', 'M', '1988/25/07', '2016-04-15', 'Senior Analyst', 'Analytics', 82000.00, '52-55-555-1070', 'santiago.garcia@bank.com', 'E069', 'Y', 3, 8, 'Master', 'Messy data'),
-- Additional employees with various issues
('E071', 'BR001', 'Trevor', 'Price', 'Trevor Price', 'Male', '1989-05-30', '2017-02-01', 'Credit Analyst', 'Analytics', 68000.00, '212-555-1071', 'trevor.price@bank.com', 'E001', 'Yes', 3, 6, 'Bachelor', NULL),
('E072', 'BR002', 'VANESSA', 'butler', 'VANESSA butler', 'f', '1992/12/09', '2020-06-15', 'Credit Analyst', 'Analytics', 66000.00, '(718)555-1072', 'vanessa.butler@bank.com', 'E006', 'Y', 3, 3, 'Bachelor', 'Messy data'),
('E073', 'BR003', 'ethan', 'SANDERS', 'ethan SANDERS', 'M', '1987-01-17', '2014-11-01', 'Credit Analyst', 'Analytics', 67000.00, '2135551073', 'ethan.sanders@bank.com', 'E011', 'YES', 3, 9, 'Bachelor', 'Messy name'),
('E074', 'BR004', 'Alexis', 'Patterson', 'Alexis Patterson', 'Female', '1994-07-04', '2021-09-15', 'Teller', 'Operations', 42500.00, '312-555-1074', 'alexis.patterson@bank.com', 'E016', 'Yes', 2, 2, 'Associate', NULL),
('E075', 'BR005', 'CAMERON', 'hughes', 'CAMERON hughes', 'M', '1991/28/02', '2019-03-01', 'Teller', 'Operations', 43000.00, '(713)555-1075', 'cameron.hughes@bank.com', 'E021', 'Y', 2, 4, 'Associate', 'Messy data'),
('E076', 'BR006', 'sierra', 'FOSTER', 'sierra FOSTER', 'f', '1996-10-21', '2022-07-15', 'Teller', 'Operations', 41000.00, '6025551076', 'sierra.foster@bank.com', 'E026', 'Yes', 2, 1, 'Associate', 'Messy name'),
('E077', 'BR007', 'Dominic', 'Gonzalez', 'Dominic Gonzalez', 'Male', '1990-03-08', '2018-01-15', 'Teller', 'Operations', 43500.00, '215-555-1077', 'dominic.gonzalez@bank.com', 'E030', 'Yes', 2, 5, 'Associate', NULL),
('E078', 'BR008', 'PAIGE', 'diaz', 'PAIGE diaz', 'FEMALE', '1993/16/05', '2020-10-01', 'Teller', 'Operations', 42000.00, '(210)555-1078', 'paige.diaz@bank.com', 'E033', 'Y', 2, 3, 'Associate', 'Messy data'),
('E079', 'BR009', 'cole', 'RYAN', 'cole RYAN', 'M', '1995-08-12', '2022-04-15', 'Teller', 'Operations', 41500.00, '6195551079', 'cole.ryan@bank.com', 'E036', 'YES', 2, 1, 'Associate', 'Messy name'),
('E080', 'BR010', 'Hailey', 'Stewart', 'Hailey Stewart', 'Female', '1994-01-25', '2021-11-01', 'Teller', 'Operations', 42500.00, '214-555-1080', 'hailey.stewart@bank.com', 'E039', 'Yes', 2, 2, 'Associate', NULL),
-- Employees with missing data
('E081', 'BR011', '', '', '', '', '', '', 'Teller', 'Operations', NULL, '', '', 'E042', '', NULL, NULL, '', 'Ghost record'),
('E082', 'BR012', 'Logan', 'Murphy', 'Logan Murphy', 'Male', '1992-06-19', '2019-08-15', 'Credit Analyst', 'Analytics', 67500.00, '206-555-1082', 'logan.murphy@bank.com', 'E045', 'Yes', 3, 4, 'Bachelor', NULL),
('E083', 'BR013', 'HANNAH', 'rivera', 'HANNAH rivera', 'f', '1995/22/03', '2022-11-01', 'Teller', 'Operations', 41000.00, '(720)555-1083', 'hannah.rivera@bank.com', 'E048', 'Y', 2, 1, 'Associate', 'Messy data'),
('E084', 'BR014', 'dylan', 'HAYES', 'dylan HAYES', 'M', '1991-09-07', '2018-06-15', 'Credit Analyst', 'Analytics', 68500.00, '6175551084', 'dylan.hayes@bank.com', 'E051', 'YES', 3, 5, 'Bachelor', 'Messy name'),
('E085', 'BR015', 'Mackenzie', 'Russell', 'Mackenzie Russell', 'Female', '1993-12-14', '2020-09-01', 'Teller', 'Operations', 42000.00, '404-555-1085', 'mackenzie.russell@bank.com', 'E054', 'Yes', 2, 3, 'Associate', NULL),
('E086', 'BR016', 'BLAKE', 'jenkins', 'BLAKE jenkins', 'M', '1994/10/08', '2022-02-15', 'Teller', 'Operations', 41500.00, '(612)555-1086', 'blake.jenkins@bank.com', 'E057', 'Y', 2, 1, 'Associate', 'Messy data'),
('E087', 'BR017', 'avery', 'PERRY', 'avery PERRY', 'f', '1996-05-29', '2022-12-01', 'Teller', 'Operations', 40500.00, '5035551087', 'avery.perry@bank.com', 'E060', 'Yes', 2, 1, 'Associate', 'Messy name'),
('E088', 'BR018', 'Harry', 'Brown', 'Harry Brown', 'Male', '1987-07-16', '2015-03-01', 'Credit Analyst', 'Analytics', 92000.00, '44-20-555-1088', 'harry.brown@bank.com', 'E063', 'Yes', 4, 10, 'Master', NULL),
('E089', 'BR019', 'SOPHIE', 'martin', 'SOPHIE martin', 'FEMALE', '1992/18/11', '2019-07-15', 'Credit Analyst', 'Analytics', 85000.00, '416-555-1089', 'sophie.martin@bank.com', 'E066', 'Y', 3, 4, 'Master', 'Messy data'),
('E090', 'BR020', 'diego', 'LOPEZ', 'diego LOPEZ', 'M', '1990-02-03', '2017-09-01', 'Credit Analyst', 'Analytics', 79000.00, '52-55-555-1090', 'diego.lopez@bank.com', 'E069', 'Yes', 3, 6, 'Bachelor', 'Messy name'),
-- Duplicate employees
('E091', 'BR001', 'Robert', 'Johnson', 'Robert Johnson', 'Male', '1975-05-15', '2005-01-15', 'Branch Manager', 'Management', 95000.00, '212-555-1001', 'robert.johnson@bank.com', NULL, 'Yes', 5, 20, 'MBA', 'Duplicate of E001'),
('E092', 'BR003', 'Michael', 'Davis', 'Michael Davis', 'Male', '1978-07-22', '2010-06-10', 'Branch Manager', 'Management', 92000.00, '213-555-1011', 'michael.davis@bank.com', NULL, 'Yes', 5, 18, 'MBA', 'Duplicate of E011'),
-- Employees with wrong salary (negative)
('E093', 'BR004', 'Patrick', 'Foster', 'Patrick Foster', 'Male', '1988-04-11', '2016-08-15', 'Loan Officer', 'Loans', -65000.00, '312-555-1093', 'patrick.foster@bank.com', 'E016', 'Yes', 3, 7, 'Bachelor', 'Negative salary error'),
('E094', 'BR005', 'TANYA', 'coleman', 'TANYA coleman', 'f', '1991/05/12', '2019-01-15', 'Teller', 'Operations', 43000.00, '(713)555-1094', 'tanya.coleman@bank.com', 'E021', 'Y', 3, 4, 'Associate', 'Messy data'),
('E095', 'BR006', 'garrett', 'SIMMONS', 'garrett SIMMONS', 'M', '1993-03-28', '2021-05-01', 'Teller', 'Operations', 41500.00, '6025551095', 'garrett.simmons@bank.com', 'E026', 'YES', 2, 2, 'Associate', 'Messy name'),
('E096', 'BR007', 'Destiny', 'Alexander', 'Destiny Alexander', 'Female', '1994-08-15', '2022-01-15', 'Teller', 'Operations', 41000.00, '215-555-1096', 'destiny.alexander@bank.com', 'E030', 'Yes', 2, 1, 'Associate', NULL),
('E097', 'BR008', 'TREVOR', 'graham', 'TREVOR graham', 'M', '1990/20/06', '2018-11-01', 'Credit Analyst', 'Analytics', 66500.00, '(210)555-1097', 'trevor.graham@bank.com', 'E033', 'Y', 3, 5, 'Bachelor', 'Messy data'),
('E098', 'BR009', 'miranda', 'SHAW', 'miranda SHAW', 'f', '1992-11-03', '2020-07-15', 'Credit Analyst', 'Analytics', 67000.00, '6195551098', 'miranda.shaw@bank.com', 'E036', 'Yes', 3, 3, 'Bachelor', 'Messy name'),
('E099', 'BR010', 'Garrett', 'Warren', 'Garrett Warren', 'Male', '1989-07-09', '2017-04-01', 'Financial Advisor', 'Advisory', 71500.00, '214-555-1099', 'garrett.warren@bank.com', 'E039', 'Yes', 3, 6, 'Master', NULL),
('E100', 'BR011', 'PRIYA', 'patel', 'PRIYA patel', 'FEMALE', '1991/28/08', '2019-12-15', 'Financial Advisor', 'Advisory', 70000.00, '(305)555-1100', 'priya.patel@bank.com', 'E042', 'Y', 3, 4, 'Master', 'Messy data');

-- ============================================================
-- TABLE 3: CUSTOMERS
-- ============================================================
CREATE TABLE customers (
    customer_id         VARCHAR(10),
    first_name          VARCHAR(50),
    last_name           VARCHAR(50),
    full_name           VARCHAR(100),
    gender              VARCHAR(20),
    date_of_birth       VARCHAR(20),
    phone               VARCHAR(30),
    email               VARCHAR(100),
    address             VARCHAR(200),
    city                VARCHAR(50),
    state               VARCHAR(10),
    zip_code            VARCHAR(15),
    country             VARCHAR(50),
    employment_status   VARCHAR(30),
    annual_income       NUMERIC(12,2),
    credit_score        INT,
    marital_status      VARCHAR(20),
    nationality         VARCHAR(50),
    is_active           VARCHAR(10),
    kyc_verified        VARCHAR(10),
    branch_id           VARCHAR(10),
    join_date           VARCHAR(20),
    notes               TEXT
);

INSERT INTO customers VALUES
-- Clean records
('C001', 'James', 'Wilson', 'James Wilson', 'Male', '1985-03-15', '212-555-2001', 'james.wilson@gmail.com', '123 Main St', 'New York', 'NY', '10001', 'USA', 'Employed', 85000.00, 720, 'Married', 'American', 'Yes', 'Yes', 'BR001', '2020-01-15', 'Premium customer'),
('C002', 'Maria', 'Garcia', 'Maria Garcia', 'Female', '1990-07-22', '718-555-2002', 'maria.garcia@gmail.com', '456 Oak Ave', 'Brooklyn', 'NY', '11201', 'USA', 'Employed', 65000.00, 680, 'Single', 'American', 'Yes', 'Yes', 'BR002', '2020-03-20', 'Good standing'),
-- Messy name casing
('C003', 'JOHN', 'SMITH', 'JOHN SMITH', 'M', '1978-11-08', '(213)555-2003', 'john.smith@gmail.com', '789 Pine Rd', 'Los Angeles', 'CA', '90001', 'USA', 'Self-Employed', 95000.00, 750, 'Married', 'American', 'Y', 'Yes', 'BR003', '2020-05-10', 'Messy name'),
('C004', 'sarah', 'johnson', 'sarah johnson', 'f', '1992/15/04', '3125552004', 'sarah.johnson@gmail.com', '101 Elm St', 'Chicago', 'IL', '60601', 'USA', 'Employed', 55000.00, 640, 'Single', 'American', 'Yes', 'Y', 'BR004', '2020-07-15', 'Messy name and date'),
-- Special characters in names
('C005', 'M!chael', 'D@vis', 'M!chael D@vis', 'Male', '1983-06-30', '713-555-2005', 'michael.davis@gmail.com', '202 Maple Ln', 'Houston', 'TX', '77001', 'USA', 'Employed', 75000.00, 700, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2020-09-01', 'Special chars in name'),
('C006', 'J@net', 'Wil$on', 'J@net Wil$on', 'Female', '1988-02-14', '602-555-2006', 'janet.wilson@gmail.com', '303 Birch Blvd', 'Phoenix', 'AZ', '85001', 'USA', 'Employed', 60000.00, 660, 'Single', 'American', 'Y', 'Yes', 'BR006', '2020-11-20', 'Special chars in name'),
-- Messy dates
('C007', 'Robert', 'Martinez', 'Robert Martinez', 'Male', '1975/20/09', '215-555-2007', 'robert.martinez@gmail.com', '404 Cedar Ct', 'Philadelphia', 'PA', '19101', 'USA', 'Employed', 80000.00, 710, 'Married', 'American', 'Yes', 'Yes', 'BR007', '2021-01-10', 'Messy DOB'),
('C008', 'Lisa', 'Anderson', 'Lisa Anderson', 'Female', '15/08/1986', '210-555-2008', 'lisa.anderson@gmail.com', '505 Walnut Way', 'San Antonio', 'TX', '78201', 'USA', 'Employed', 58000.00, 650, 'Single', 'American', 'Yes', 'Y', 'BR008', '2021-03-25', 'European DOB format'),
-- Messy phone
('C009', 'William', 'Thomas', 'William Thomas', 'Male', '1980-12-25', '6195552009', 'william.thomas@gmail.com', '606 Spruce St', 'San Diego', 'CA', '92101', 'USA', 'Employed', 90000.00, 730, 'Married', 'American', 'Yes', 'Yes', 'BR009', '2021-05-15', 'Messy phone'),
('C010', 'Patricia', 'Jackson', 'Patricia Jackson', 'Female', '1993-04-18', '(214)555-2010', 'patricia.jackson@gmail.com', '707 Willow Dr', 'Dallas', 'TX', '75201', 'USA', 'Employed', 62000.00, 670, 'Single', 'American', 'Y', 'Yes', 'BR010', '2021-07-01', 'Messy phone'),
-- Bad email
('C011', 'Richard', 'White', 'Richard White', 'Male', '1977-08-07', '305-555-2011', 'richard@@gmail.com', '808 Ash Ave', 'Miami', 'FL', '33101', 'USA', 'Self-Employed', 110000.00, 760, 'Married', 'American', 'Yes', 'Yes', 'BR011', '2021-09-20', 'Bad email'),
('C012', 'Barbara', 'Harris', 'Barbara Harris', 'Female', '1989-01-30', '206-555-2012', 'barbaragmail.com', '909 Poplar Pl', 'Seattle', 'WA', '98101', 'USA', 'Employed', 68000.00, 690, 'Married', 'American', 'Yes', 'Y', 'BR012', '2021-11-10', 'Missing @ in email'),
-- Missing values
('C013', 'Charles', 'Lewis', 'Charles Lewis', 'Male', '1982-05-12', '', '', '1010 Hickory Hill', 'Denver', 'CO', '80201', 'USA', 'Unemployed', 0.00, 580, 'Single', 'American', 'Yes', 'Yes', 'BR013', '2022-01-15', 'Missing phone and email'),
('C014', 'Susan', 'Robinson', 'Susan Robinson', 'Female', '1995-09-24', '617-555-2014', 'susan.robinson@gmail.com', '1111 Magnolia Blvd', 'Boston', 'MA', '02101', 'USA', 'Employed', NULL, 620, 'Single', 'American', 'Y', 'Yes', 'BR014', '2022-03-20', 'Missing income'),
-- Inconsistent country
('C015', 'Joseph', 'Walker', 'Joseph Walker', 'Male', '1973-11-16', '404-555-2015', 'joseph.walker@gmail.com', '1212 Dogwood Dr', 'Atlanta', 'GA', '30301', 'USA', 'Employed', 88000.00, 725, 'Married', 'American', 'Yes', 'Yes', 'BR015', '2022-05-10', 'Clean record'),
('C016', 'THOMAS', 'HALL', 'THOMAS HALL', 'M', '1986/08/03', '6125552016', 'thomas.hall@gmail.com', '1313 Sycamore St', 'Minneapolis', 'MN', '55401', 'USA', 'Employed', 72000.00, 695, 'Married', 'American', 'Y', 'Y', 'BR016', '2022-07-15', 'Messy name and date'),
-- International customers
('C017', 'Emma', 'Thompson', 'Emma Thompson', 'Female', '1991-03-22', '44-20-555-2017', 'emma.thompson@gmail.com', '18 Oxford Street', 'London', 'ENG', 'W1D 1BS', 'United Kingdom', 'Employed', 95000.00, 740, 'Single', 'British', 'Yes', 'Yes', 'BR018', '2022-09-01', 'UK customer'),
('C018', 'Luca', 'Ferrari', 'Luca Ferrari', 'Male', '1984-07-14', '39-02-555-2018', 'luca.ferrari@gmail.com', '20 Via Roma', 'Milan', 'MI', '20100', 'Italy', 'Self-Employed', 120000.00, 755, 'Married', 'Italian', 'Yes', 'Yes', 'BR018', '2022-11-15', 'Italian customer'),
('C019', 'Sophie', 'Martin', 'Sophie Martin', 'Female', '1988-12-08', '33-1-555-2019', 'sophie.martin@gmail.com', '22 Rue de Rivoli', 'Paris', 'IDF', '75001', 'france', 'Employed', 88000.00, 715, 'Single', 'French', 'Yes', 'Yes', 'BR018', '2023-01-20', 'Messy country'),
('C020', 'Carlos', 'Mendez', 'Carlos Mendez', 'Male', '1979-05-19', '52-55-555-2020', 'carlos.mendez@gmail.com', '24 Reforma', 'Mexico City', 'CDMX', '06600', 'mexico', 'Employed', 75000.00, 680, 'Married', 'Mexican', 'Yes', 'Yes', 'BR020', '2023-03-10', 'Messy country'),
-- Duplicate customers
('C021', 'James', 'Wilson', 'James Wilson', 'Male', '1985-03-15', '212-555-2001', 'james.wilson@gmail.com', '123 Main St', 'New York', 'NY', '10001', 'USA', 'Employed', 85000.00, 720, 'Married', 'American', 'Yes', 'Yes', 'BR001', '2020-01-15', 'Duplicate of C001'),
('C022', 'Maria', 'Garcia', 'Maria Garcia', 'Female', '1990-07-22', '718-555-2002', 'maria.garcia@gmail.com', '456 Oak Ave', 'Brooklyn', 'NY', '11201', 'USA', 'Employed', 65000.00, 680, 'Single', 'American', 'Yes', 'Yes', 'BR002', '2020-03-20', 'Duplicate of C002'),
-- Same person different ID
('C023', 'James', 'Wilson', 'James Wilson', 'Male', '1985-03-15', '212-555-2001', 'james.wilson.new@gmail.com', '123 Main St', 'New York', 'NY', '10001', 'USA', 'Employed', 85000.00, 720, 'Married', 'American', 'Yes', 'Yes', 'BR001', '2021-06-01', 'Same person new ID'),
-- More customers
('C024', 'Ashley', 'Turner', 'Ashley Turner', 'Female', '1994-02-28', '212-555-2024', 'ashley.turner@gmail.com', '125 Broadway', 'New York', 'NY', '10006', 'USA', 'Employed', 58000.00, 645, 'Single', 'American', 'Yes', 'Yes', 'BR001', '2020-02-20', NULL),
('C025', 'Brandon', 'Phillips', 'Brandon Phillips', 'Male', '1981-08-17', '718-555-2025', 'brandon.phillips@gmail.com', '458 Atlantic Ave', 'Brooklyn', 'NY', '11202', 'USA', 'Self-Employed', 92000.00, 735, 'Married', 'American', 'Yes', 'Yes', 'BR002', '2020-04-15', NULL),
('C026', 'CYNTHIA', 'campbell', 'CYNTHIA campbell', 'f', '1987/10/06', '(213)555-2026', 'cynthia.campbell@gmail.com', '791 Sunset Blvd', 'Los Angeles', 'CA', '90028', 'USA', 'Employed', 71000.00, 688, 'Single', 'American', 'Y', 'Yes', 'BR003', '2020-06-01', 'Messy data'),
('C027', 'derek', 'MORGAN', 'derek MORGAN', 'M', '1979-04-23', '3125552027', 'derek.morgan@gmail.com', '103 Michigan Ave', 'Chicago', 'IL', '60602', 'USA', 'Employed', 83000.00, 712, 'Married', 'American', 'Yes', 'Y', 'BR004', '2020-08-10', 'Messy name'),
('C028', 'ELENA', 'RUSSO', 'ELENA RUSSO', 'Female', '1993/22/08', '713-555-2028', 'elena.russo@gmail.com', '204 Westheimer', 'Houston', 'TX', '77002', 'USA', 'Employed', 61000.00, 655, 'Single', 'American', 'Yes', 'Yes', 'BR005', '2020-10-15', 'Messy name and date'),
('C029', 'frank', 'NGUYEN', 'frank NGUYEN', 'Male', '1984-01-11', '602-555-2029', 'frank.nguyen@gmail.com', '305 Indian School', 'Phoenix', 'AZ', '85016', 'USA', 'Self-Employed', 99000.00, 745, 'Married', 'Vietnamese-American', 'Y', 'Yes', 'BR006', '2020-12-01', 'Messy name'),
('C030', 'GRACE', 'kim', 'GRACE kim', 'f', '1990-10-07', '(215)555-2030', 'grace.kim@gmail.com', '406 Chestnut St', 'Philadelphia', 'PA', '19102', 'USA', 'Employed', 67000.00, 678, 'Single', 'Korean-American', 'Yes', 'Y', 'BR007', '2021-02-15', 'Messy name'),
('C031', 'Henry', 'Patel', 'Henry Patel', 'Male', '1977-06-25', '210-555-2031', 'henry.patel@gmail.com', '507 Commerce St', 'San Antonio', 'TX', '78202', 'USA', 'Employed', 77000.00, 705, 'Married', 'Indian-American', 'Yes', 'Yes', 'BR008', '2021-04-20', NULL),
('C032', 'ISABELLA', 'chen', 'ISABELLA chen', 'Female', '1996/15/11', '6195552032', 'isabella.chen@gmail.com', '608 Harbor Dr', 'San Diego', 'CA', '92102', 'USA', 'Employed', 54000.00, 635, 'Single', 'Chinese-American', 'Y', 'Yes', 'BR009', '2021-06-10', 'Messy data'),
('C033', 'jack', 'RODRIGUEZ', 'jack RODRIGUEZ', 'M', '1982-09-14', '(214)555-2033', 'jack.rodriguez@gmail.com', '708 McKinney Ave', 'Dallas', 'TX', '75202', 'USA', 'Self-Employed', 105000.00, 758, 'Married', 'Hispanic-American', 'Yes', 'Y', 'BR010', '2021-08-25', 'Messy name'),
('C034', 'KAREN', 'SMITH', 'KAREN SMITH', 'f', '1988-04-03', '305-555-2034', 'karen@@gmail.com', '809 Collins Ave', 'Miami', 'FL', '33139', 'USA', 'Employed', 63000.00, 662, 'Single', 'American', 'Yes', 'Yes', 'BR011', '2021-10-15', 'Bad email'),
('C035', 'larry', 'JOHNSON', 'larry JOHNSON', 'Male', '1975/28/07', '206-555-2035', 'larrygmail.com', '910 Pike St', 'Seattle', 'WA', '98102', 'USA', 'Employed', 81000.00, 718, 'Married', 'American', 'Y', 'Yes', 'BR012', '2021-12-01', 'Messy name, date and email'),
('C036', 'MEGAN', 'davis', 'MEGAN davis', 'Female', '1991-02-19', '720-555-2036', 'megan.davis@gmail.com', '1011 16th St', 'Denver', 'CO', '80203', 'USA', 'Employed', 69000.00, 685, 'Single', 'American', 'Yes', 'Y', 'BR013', '2022-02-15', 'Messy name'),
('C037', 'nicholas', 'BROWN', 'nicholas BROWN', 'M', '1980/12/05', '617-555-2037', 'nicholas.brown@gmail.com', '1112 State St', 'Boston', 'MA', '02110', 'USA', 'Employed', 87000.00, 722, 'Married', 'American', 'Y', 'Yes', 'BR014', '2022-04-20', 'Messy name and date'),
('C038', 'OLIVIA', 'MARTINEZ', 'OLIVIA MARTINEZ', 'f', '1994-08-28', '(404)555-2038', 'olivia.martinez@gmail.com', '1213 Peachtree St', 'Atlanta', 'GA', '30310', 'USA', 'Employed', 56000.00, 638, 'Single', 'American', 'Yes', 'Y', 'BR015', '2022-06-10', 'Messy name'),
('C039', 'peter', 'WILSON', 'peter WILSON', 'Male', '1986-11-07', '6125552039', 'peter.wilson@gmail.com', '1314 Nicollet Mall', 'Minneapolis', 'MN', '55403', 'USA', 'Self-Employed', 93000.00, 738, 'Married', 'American', 'Y', 'Yes', 'BR016', '2022-08-25', 'Messy name'),
('C040', 'QUINN', 'taylor', 'QUINN taylor', 'Female', '1992-06-16', '(503)555-2040', 'quinn.taylor@gmail.com', '1415 Broadway', 'Portland', 'OR', '97202', 'USA', 'Employed', 64000.00, 668, 'Single', 'American', 'Yes', 'Y', 'BR017', '2022-10-15', 'Messy name'),
-- More international
('C041', 'Hiroshi', 'Tanaka', 'Hiroshi Tanaka', 'Male', '1983-04-05', '81-3-555-2041', 'hiroshi.tanaka@gmail.com', '2-1 Marunouchi', 'Tokyo', 'TKY', '100-0005', 'Japan', 'Employed', 98000.00, 742, 'Married', 'Japanese', 'Yes', 'Yes', 'BR018', '2023-05-01', 'Japanese customer'),
('C042', 'Aisha', 'Khan', 'Aisha Khan', 'Female', '1989-09-18', '971-4-555-2042', 'aisha.khan@gmail.com', '42 Sheikh Zayed Rd', 'Dubai', 'DXB', '00000', 'UAE', 'Employed', 115000.00, 748, 'Single', 'Pakistani', 'Yes', 'Yes', 'BR018', '2023-07-15', 'UAE customer'),
('C043', 'Pierre', 'Dubois', 'Pierre Dubois', 'Male', '1976-12-21', '33-1-555-2043', 'pierre.dubois@gmail.com', '44 Champs Elysees', 'Paris', 'IDF', '75008', 'France', 'Self-Employed', 132000.00, 762, 'Married', 'French', 'Yes', 'Yes', 'BR018', '2023-09-20', 'French customer'),
('C044', 'Ana', 'Silva', 'Ana Silva', 'Female', '1991-07-10', '55-11-555-2044', 'ana.silva@gmail.com', '46 Paulista Ave', 'Sao Paulo', 'SP', '01310-100', 'Brazil', 'Employed', 72000.00, 675, 'Single', 'Brazilian', 'Yes', 'Y', 'BR020', '2023-11-10', 'Brazilian customer'),
('C045', 'Wei', 'Zhang', 'Wei Zhang', 'Male', '1987-02-28', '86-10-555-2045', 'wei.zhang@gmail.com', '48 Wangfujing', 'Beijing', 'BJ', '100006', 'china', 'Employed', 89000.00, 708, 'Married', 'Chinese', 'Yes', 'Yes', 'BR018', '2024-01-15', 'Messy country'),
-- More US customers with various issues
('C046', 'rachel', 'FOSTER', 'rachel FOSTER', 'f', '1993/25/03', '212-555-2046', 'rachel.foster@gmail.com', '127 5th Ave', 'New York', 'NY', '10010', 'USA', 'Employed', 59000.00, 642, 'Single', 'American', 'Y', 'Yes', 'BR001', '2020-03-01', 'Messy data'),
('C047', 'SAMUEL', 'REED', 'SAMUEL REED', 'Male', '1978-10-14', '(718)555-2047', 'samuel.reed@gmail.com', '460 Flatbush Ave', 'Brooklyn', 'NY', '11225', 'USA', 'Self-Employed', 98000.00, 743, 'Married', 'American', 'Yes', 'Y', 'BR002', '2020-05-15', 'Messy name'),
('C048', 'tina', 'BROOKS', 'tina BROOKS', 'Female', '1984-06-09', '2135552048', 'tina.brooks@gmail.com', '793 Hollywood Blvd', 'Los Angeles', 'CA', '90028', 'USA', 'Employed', 74000.00, 698, 'Single', 'American', 'Yes', 'Yes', 'BR003', '2020-07-20', 'Messy name'),
('C049', 'ULYSSES', 'HAYES', 'ULYSSES HAYES', 'M', '1990/18/09', '(312)555-2049', 'ulysses.hayes@gmail.com', '105 Wacker Dr', 'Chicago', 'IL', '60606', 'USA', 'Employed', 66000.00, 672, 'Single', 'American', 'Y', 'Y', 'BR004', '2020-09-25', 'Messy data'),
('C050', 'virginia', 'PRICE', 'virginia PRICE', 'f', '1981-03-27', '713-555-2050', 'virginia.price@gmail.com', '206 Main St', 'Houston', 'TX', '77003', 'USA', 'Employed', 78000.00, 707, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2020-11-10', 'Messy name'),
('C051', 'Walter', 'Sanders', 'Walter Sanders', 'Male', '1976-07-04', '602-555-2051', 'walter.sanders@gmail.com', '307 Camelback Rd', 'Phoenix', 'AZ', '85013', 'USA', 'Employed', 82000.00, 716, 'Married', 'American', 'Yes', 'Yes', 'BR006', '2021-01-20', NULL),
('C052', 'XENA', 'COLEMAN', 'XENA COLEMAN', 'Female', '1995/05/12', '(215)555-2052', 'xena.coleman@gmail.com', '408 Walnut St', 'Philadelphia', 'PA', '19106', 'USA', 'Employed', 52000.00, 628, 'Single', 'American', 'Y', 'Yes', 'BR007', '2021-03-15', 'Messy data'),
('C053', 'yale', 'JENKINS', 'yale JENKINS', 'M', '1988-08-23', '2105552053', 'yale.jenkins@gmail.com', '509 Alamo Plaza', 'San Antonio', 'TX', '78205', 'USA', 'Employed', 71000.00, 689, 'Single', 'American', 'Yes', 'Y', 'BR008', '2021-05-20', 'Messy name'),
('C054', 'ZARA', 'MORGAN', 'ZARA MORGAN', 'f', '1992-01-31', '619-555-2054', 'zara.morgan@gmail.com', '610 Harbor Island', 'San Diego', 'CA', '92101', 'USA', 'Employed', 63000.00, 661, 'Single', 'American', 'Yes', 'Yes', 'BR009', '2021-07-25', 'Messy name'),
('C055', 'adam', 'FLORES', 'adam FLORES', 'Male', '1983-05-16', '(214)555-2055', 'adam.flores@gmail.com', '710 Greenville Ave', 'Dallas', 'TX', '75206', 'USA', 'Self-Employed', 108000.00, 755, 'Married', 'American', 'Y', 'Yes', 'BR010', '2021-09-10', 'Messy name'),
('C056', 'BRIANNA', 'WASHINGTON', 'BRIANNA WASHINGTON', 'Female', '1997-10-08', '305-555-2056', 'brianna.washington@gmail.com', '811 Brickell Ave', 'Miami', 'FL', '33131', 'USA', 'Employed', 57000.00, 636, 'Single', 'American', 'Yes', 'Y', 'BR011', '2021-11-25', 'Messy name'),
('C057', 'carlos', 'NGUYEN', 'carlos NGUYEN', 'M', '1979-02-20', '206-555-2057', 'carlos.nguyen@gmail.com', '912 Pike Place', 'Seattle', 'WA', '98101', 'USA', 'Employed', 86000.00, 721, 'Married', 'American', 'Y', 'Yes', 'BR012', '2022-01-15', 'Messy name'),
('C058', 'DIANA', 'RICHARDSON', 'DIANA RICHARDSON', 'f', '1994/28/04', '720-555-2058', 'diana.richardson@gmail.com', '1013 Colfax Ave', 'Denver', 'CO', '80204', 'USA', 'Employed', 61000.00, 653, 'Single', 'American', 'Yes', 'Y', 'BR013', '2022-03-20', 'Messy data'),
('C059', 'evan', 'CLARK', 'evan CLARK', 'Male', '1985-11-11', '(617)555-2059', 'evan.clark@gmail.com', '1113 Tremont St', 'Boston', 'MA', '02111', 'USA', 'Employed', 84000.00, 719, 'Married', 'American', 'Yes', 'Yes', 'BR014', '2022-05-10', 'Messy name'),
('C060', 'FAITH', 'CAMPBELL', 'FAITH CAMPBELL', 'Female', '1991-07-27', '(404)555-2060', 'faith.campbell@gmail.com', '1214 Peachtree Rd', 'Atlanta', 'GA', '30309', 'USA', 'Employed', 68000.00, 682, 'Single', 'American', 'Y', 'Yes', 'BR015', '2022-07-25', 'Messy name'),
('C061', 'george', 'BAKER', 'george BAKER', 'M', '1980-04-05', '612-555-2061', 'george.baker@gmail.com', '1315 Marquette Ave', 'Minneapolis', 'MN', '55402', 'USA', 'Employed', 79000.00, 709, 'Married', 'American', 'Yes', 'Y', 'BR016', '2022-09-15', 'Messy name'),
('C062', 'HELEN', 'TURNER', 'HELEN TURNER', 'f', '1993/15/10', '(503)555-2062', 'helen.turner@gmail.com', '1416 Burnside St', 'Portland', 'OR', '97209', 'USA', 'Employed', 65000.00, 671, 'Single', 'American', 'Yes', 'Yes', 'BR017', '2022-11-20', 'Messy data'),
('C063', 'Ivan', 'Petrov', 'Ivan Petrov', 'Male', '1981-08-19', '7-495-555-2063', 'ivan.petrov@gmail.com', '63 Arbat St', 'Moscow', 'MOW', '119002', 'Russia', 'Employed', 78000.00, 698, 'Married', 'Russian', 'Yes', 'Yes', 'BR018', '2023-01-10', 'Russian customer'),
('C064', 'Jun', 'Lee', 'Jun Lee', 'Female', '1990-03-14', '82-2-555-2064', 'jun.lee@gmail.com', '64 Gangnam-daero', 'Seoul', 'SEL', '06000', 'South Korea', 'Employed', 82000.00, 714, 'Single', 'Korean', 'Yes', 'Yes', 'BR018', '2023-03-25', 'Korean customer'),
('C065', 'Kevin', 'Mueller', 'Kevin Mueller', 'Male', '1978-06-30', '49-89-555-2065', 'kevin.mueller@gmail.com', '65 Maximilianstrasse', 'Munich', 'BAY', '80539', 'Germany', 'Self-Employed', 125000.00, 758, 'Married', 'German', 'Yes', 'Yes', 'BR018', '2023-05-15', 'German customer'),
('C066', 'Laura', 'Rossi', 'Laura Rossi', 'Female', '1987-11-25', '39-02-555-2066', 'laura.rossi@gmail.com', '66 Via Montenapoleone', 'Milan', 'MI', '20121', 'Italy', 'Employed', 91000.00, 728, 'Single', 'Italian', 'Yes', 'Y', 'BR018', '2023-07-20', 'Italian customer'),
('C067', 'Marco', 'Santos', 'Marco Santos', 'Male', '1982-09-08', '55-11-555-2067', 'marco.santos@gmail.com', '67 Brigadeiro Ave', 'Sao Paulo', 'SP', '01310-200', 'brazil', 'Employed', 68000.00, 677, 'Married', 'Brazilian', 'Y', 'Yes', 'BR020', '2023-09-25', 'Messy country'),
('C068', 'Nina', 'Kowalski', 'Nina Kowalski', 'Female', '1994-01-17', '48-22-555-2068', 'nina.kowalski@gmail.com', '68 Nowy Swiat', 'Warsaw', 'MZ', '00-001', 'Poland', 'Employed', 65000.00, 663, 'Single', 'Polish', 'Yes', 'Yes', 'BR018', '2023-11-15', 'Polish customer'),
('C069', 'Omar', 'Hassan', 'Omar Hassan', 'Male', '1979-04-23', '20-2-555-2069', 'omar.hassan@gmail.com', '69 Tahrir Square', 'Cairo', 'CAI', '11511', 'Egypt', 'Self-Employed', 55000.00, 642, 'Married', 'Egyptian', 'Yes', 'Y', 'BR018', '2024-01-20', 'Egyptian customer'),
('C070', 'Priya', 'Sharma', 'Priya Sharma', 'Female', '1991-06-12', '91-22-555-2070', 'priya.sharma@gmail.com', '70 Marine Drive', 'Mumbai', 'MH', '400020', 'India', 'Employed', 77000.00, 699, 'Single', 'Indian', 'Yes', 'Yes', 'BR018', '2024-03-10', 'Indian customer'),
-- More US customers
('C071', 'ian', 'WOOD', 'ian WOOD', 'M', '1986/20/02', '212-555-2071', 'ian.wood@gmail.com', '129 Park Ave', 'New York', 'ny', '10017', 'USA', 'Employed', 91000.00, 733, 'Married', 'American', 'Y', 'Yes', 'BR001', '2020-04-10', 'Messy data'),
('C072', 'JESSICA', 'PRICE', 'JESSICA PRICE', 'f', '1995-07-31', '(718)555-2072', 'jessica.price@gmail.com', '462 Bedford Ave', 'Brooklyn', 'NY', '11211', 'USA', 'Employed', 55000.00, 632, 'Single', 'American', 'Yes', 'Y', 'BR002', '2020-06-25', 'Messy name'),
('C073', 'kevin', 'BELL', 'kevin BELL', 'Male', '1983-12-03', '2135552073', 'kevin.bell@gmail.com', '795 Melrose Ave', 'Los Angeles', 'CA', '90046', 'USA', 'Self-Employed', 102000.00, 750, 'Married', 'American', 'Yes', 'Yes', 'BR003', '2020-08-15', 'Messy name'),
('C074', 'LISA', 'HENDERSON', 'LISA HENDERSON', 'Female', '1990/08/10', '(312)555-2074', 'lisa.henderson@gmail.com', '107 Michigan Ave', 'Chicago', 'il', '60603', 'USA', 'Employed', 68000.00, 681, 'Single', 'American', 'Y', 'Y', 'BR004', '2020-10-20', 'Messy data'),
('C075', 'mark', 'WATSON', 'mark WATSON', 'M', '1977-09-15', '713-555-2075', 'mark.watson@gmail.com', '208 Richmond Ave', 'Houston', 'TX', '77006', 'USA', 'Employed', 84000.00, 720, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2020-12-10', 'Messy name'),
('C076', 'NANCY', 'BROOKS', 'NANCY BROOKS', 'f', '1988-05-22', '602-555-2076', 'nancy.brooks@gmail.com', '309 Scottsdale Rd', 'Scottsdale', 'AZ', '85251', 'USA', 'Employed', 73000.00, 696, 'Single', 'American', 'Yes', 'Y', 'BR006', '2021-02-25', 'Messy name'),
('C077', 'oliver', 'KELLY', 'oliver KELLY', 'Male', '1982-11-29', '(215)555-2077', 'oliver.kelly@gmail.com', '410 South St', 'Philadelphia', 'PA', '19147', 'USA', 'Self-Employed', 97000.00, 741, 'Married', 'American', 'Y', 'Yes', 'BR007', '2021-04-15', 'Messy name'),
('C078', 'PATRICIA', 'ROSS', 'PATRICIA ROSS', 'Female', '1994/12/07', '2105552078', 'patricia.ross@gmail.com', '511 River Walk', 'San Antonio', 'TX', '78205', 'USA', 'Employed', 59000.00, 641, 'Single', 'American', 'Yes', 'Yes', 'BR008', '2021-06-20', 'Messy data'),
('C079', 'quinn', 'JAMES', 'quinn JAMES', 'M', '1985-04-16', '619-555-2079', 'quinn.james@gmail.com', '612 Harbor Blvd', 'San Diego', 'CA', '92101', 'USA', 'Employed', 76000.00, 703, 'Married', 'American', 'Yes', 'Y', 'BR009', '2021-08-25', 'Messy name'),
('C080', 'REBECCA', 'PRICE', 'REBECCA PRICE', 'f', '1991-01-20', '(214)555-2080', 'rebecca.price@gmail.com', '712 Lakewood Blvd', 'Dallas', 'TX', '75214', 'USA', 'Employed', 62000.00, 659, 'Single', 'American', 'Y', 'Yes', 'BR010', '2021-10-10', 'Messy name'),
('C081', 'steven', 'GONZALEZ', 'steven GONZALEZ', 'Male', '1980-08-07', '305-555-2081', 'steven.gonzalez@gmail.com', '813 South Beach Dr', 'Miami', 'fl', '33139', 'USA', 'Self-Employed', 112000.00, 756, 'Married', 'American', 'Yes', 'Yes', 'BR011', '2021-12-15', 'Messy name and state'),
('C082', 'TARA', 'WRIGHT', 'TARA WRIGHT', 'Female', '1993/22/09', '206-555-2082', 'tara.wright@gmail.com', '914 Queen Anne Ave', 'Seattle', 'WA', '98109', 'USA', 'Employed', 66000.00, 674, 'Single', 'American', 'Yes', 'Y', 'BR012', '2022-02-20', 'Messy data'),
('C083', 'uma', 'FORD', 'uma FORD', 'f', '1987-06-14', '720-555-2083', 'uma.ford@gmail.com', '1015 Pearl St', 'Boulder', 'CO', '80302', 'USA', 'Employed', 71000.00, 690, 'Single', 'American', 'Y', 'Yes', 'BR013', '2022-04-10', 'Messy name'),
('C084', 'VICTOR', 'MORGAN', 'VICTOR MORGAN', 'M', '1978-03-28', '(617)555-2084', 'victor.morgan@gmail.com', '1114 Newbury St', 'Boston', 'mA', '02116', 'USA', 'Employed', 89000.00, 724, 'Married', 'American', 'Yes', 'Yes', 'BR014', '2022-06-25', 'Messy state'),
('C085', 'wendy', 'HILL', 'wendy HILL', 'Female', '1992-10-09', '404-555-2085', 'wendy.hill@gmail.com', '1215 Midtown Dr', 'Atlanta', 'GA', '30308', 'USA', 'Employed', 61000.00, 654, 'Single', 'American', 'Yes', 'Y', 'BR015', '2022-08-15', 'Messy name'),
('C086', 'XAVIER', 'WARD', 'XAVIER WARD', 'M', '1984-01-13', '612-555-2086', 'xavier.ward@gmail.com', '1316 Hennepin Ave', 'Minneapolis', 'MN', '55403', 'USA', 'Self-Employed', 94000.00, 737, 'Married', 'American', 'Y', 'Yes', 'BR016', '2022-10-20', 'Messy name'),
('C087', 'yolanda', 'BROOKS', 'yolanda BROOKS', 'f', '1993/08/12', '(503)555-2087', 'yolanda.brooks@gmail.com', '1417 NW 23rd Ave', 'Portland', 'OR', '97210', 'USA', 'Employed', 64000.00, 669, 'Single', 'American', 'Yes', 'Yes', 'BR017', '2022-12-10', 'Messy data'),
('C088', 'ZACHARY', 'SCOTT', 'ZACHARY SCOTT', 'Male', '1981-07-17', '44-20-555-2088', 'zachary.scott@gmail.com', '88 Kensington High St', 'London', 'ENG', 'W8 4SJ', 'uk', 'Employed', 105000.00, 748, 'Married', 'British', 'Yes', 'Y', 'BR018', '2023-02-15', 'Messy country'),
('C089', 'Amy', 'Chen', 'Amy Chen', 'Female', '1989-04-24', '86-21-555-2089', 'amy.chen@gmail.com', '89 Nanjing Rd', 'Shanghai', 'SH', '200001', 'China', 'Employed', 87000.00, 717, 'Single', 'Chinese', 'Yes', 'Yes', 'BR018', '2023-04-20', 'Chinese customer'),
('C090', 'Ben', 'Taylor', 'Ben Taylor', 'Male', '1986-09-30', '416-555-2090', 'ben.taylor@gmail.com', '90 Yonge St', 'Toronto', 'ON', 'M5C 1W4', 'Canada', 'Self-Employed', 118000.00, 754, 'Married', 'Canadian', 'Yes', 'Yes', 'BR019', '2023-06-15', 'Canadian customer'),
-- Customers with credit score issues
('C091', 'aaron', 'PRICE', 'aaron PRICE', 'M', '1990/15/06', '212-555-2091', 'aaron.price@gmail.com', '131 Madison Ave', 'New York', 'NY', '10016', 'USA', 'Unemployed', 0.00, 520, 'Single', 'American', 'Y', 'Yes', 'BR001', '2020-05-15', 'Low credit score'),
('C092', 'BETTY', 'ALLEN', 'BETTY ALLEN', 'f', '1984-11-06', '(718)555-2092', 'betty.allen@gmail.com', '464 Nostrand Ave', 'Brooklyn', 'NY', '11216', 'USA', 'Employed', 48000.00, 595, 'Single', 'American', 'Yes', 'Y', 'BR002', '2020-07-20', 'Below average credit'),
('C093', 'carl', 'RIVERA', 'carl RIVERA', 'Male', '1977-03-25', '2135552093', 'carl.rivera@gmail.com', '797 Figueroa St', 'Los Angeles', 'CA', '90017', 'USA', 'Employed', 76000.00, 715, 'Married', 'American', 'Yes', 'Yes', 'BR003', '2020-09-10', 'Messy name'),
('C094', 'DONNA', 'HILL', 'DONNA HILL', 'Female', '1988/25/08', '(312)555-2094', 'donna.hill@gmail.com', '109 Clark St', 'Chicago', 'IL', '60610', 'USA', 'Employed', 67000.00, 679, 'Single', 'American', 'Y', 'Y', 'BR004', '2020-11-15', 'Messy data'),
('C095', 'eric', 'WATSON', 'eric WATSON', 'M', '1982-07-19', '713-555-2095', 'eric.watson@gmail.com', '210 Westheimer Rd', 'Houston', 'TX', '77006', 'USA', 'Self-Employed', 101000.00, 749, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2021-01-10', 'Messy name'),
('C096', 'FRANCES', 'KELLY', 'FRANCES KELLY', 'f', '1995-04-13', '602-555-2096', 'frances.kelly@gmail.com', '311 Thomas Rd', 'Phoenix', 'AZ', '85013', 'USA', 'Employed', 51000.00, 625, 'Single', 'American', 'Yes', 'Y', 'BR006', '2021-03-25', 'Messy name'),
('C097', 'gary', 'HILL', 'gary HILL', 'Male', '1979-12-09', '(215)555-2097', 'gary.hill@gmail.com', '412 Pine St', 'Philadelphia', 'PA', '19103', 'USA', 'Employed', 80000.00, 712, 'Married', 'American', 'Y', 'Yes', 'BR007', '2021-05-15', 'Messy name'),
('C098', 'HANNAH', 'TORRES', 'HANNAH TORRES', 'Female', '1992/10/11', '2105552098', 'hannah.torres@gmail.com', '513 Commerce St', 'San Antonio', 'TX', '78205', 'USA', 'Employed', 62000.00, 657, 'Single', 'American', 'Yes', 'Yes', 'BR008', '2021-07-20', 'Messy data'),
('C099', 'ian', 'PETERSON', 'ian PETERSON', 'M', '1986-05-28', '619-555-2099', 'ian.peterson@gmail.com', '614 Pacific Hwy', 'San Diego', 'CA', '92110', 'USA', 'Employed', 77000.00, 705, 'Single', 'American', 'Yes', 'Y', 'BR009', '2021-09-10', 'Messy name'),
('C100', 'JULIA', 'LONG', 'JULIA LONG', 'f', '1993-08-15', '(214)555-2100', 'julia.long@gmail.com', '714 Oak Lawn Ave', 'Dallas', 'TX', '75219', 'USA', 'Employed', 63000.00, 663, 'Single', 'American', 'Y', 'Yes', 'BR010', '2021-11-25', 'Messy name'),
-- Ghost record
('C101', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', 'Ghost record - completely empty');

-- ============================================================
-- TABLE 4: ACCOUNTS
-- ============================================================
CREATE TABLE accounts (
    account_id      VARCHAR(15),
    customer_id     VARCHAR(10),
    branch_id       VARCHAR(10),
    account_type    VARCHAR(30),
    account_status  VARCHAR(20),
    open_date       VARCHAR(20),
    close_date      VARCHAR(20),
    balance         NUMERIC(15,2),
    currency        VARCHAR(10),
    interest_rate   NUMERIC(5,2),
    overdraft_limit NUMERIC(10,2),
    last_transaction VARCHAR(20),
    is_active       VARCHAR(10),
    employee_id     VARCHAR(10),
    notes           TEXT
);

INSERT INTO accounts VALUES
-- Clean accounts
('ACC001', 'C001', 'BR001', 'Checking', 'Active', '2020-01-15', NULL, 15000.00, 'USD', 0.01, 500.00, '2024-03-15', 'Yes', 'E002', 'Primary account'),
('ACC002', 'C001', 'BR001', 'Savings', 'Active', '2020-01-15', NULL, 45000.00, 'USD', 2.50, 0.00, '2024-03-10', 'Yes', 'E002', 'Savings account'),
('ACC003', 'C002', 'BR002', 'Checking', 'Active', '2020-03-20', NULL, 8500.00, 'USD', 0.01, 300.00, '2024-03-14', 'Yes', 'E007', NULL),
('ACC004', 'C002', 'BR002', 'Savings', 'Active', '2020-03-20', NULL, 22000.00, 'USD', 2.25, 0.00, '2024-02-28', 'Yes', 'E007', NULL),
-- Messy currency formats
('ACC005', 'C003', 'BR003', 'Checking', 'Active', '2020-05-10', NULL, 12000.00, 'usd', 0.01, 500.00, '2024-03-12', 'Y', 'E012', 'Messy currency'),
('ACC006', 'C003', 'BR003', 'Savings', 'Active', '2020-05-10', NULL, 35000.00, 'Usd', 2.50, 0.00, '2024-03-01', 'Yes', 'E012', 'Messy currency'),
-- Messy dates
('ACC007', 'C004', 'BR004', 'Checking', 'Active', '20/07/2020', NULL, 6500.00, 'USD', 0.01, 200.00, '2024-03-13', 'Yes', 'E017', 'European date format'),
('ACC008', 'C004', 'BR004', 'Savings', 'Active', '2020/15/07', NULL, 18000.00, 'USD', 2.25, 0.00, '2024-02-25', 'Y', 'E017', 'Backwards date format'),
-- Negative balance (impossible)
('ACC009', 'C005', 'BR005', 'Checking', 'Active', '2020-09-01', NULL, -500.00, 'USD', 0.01, 500.00, '2024-03-11', 'Yes', 'E023', 'Negative balance error'),
('ACC010', 'C005', 'BR005', 'Savings', 'Active', '2020-09-01', NULL, 28000.00, 'USD', 2.50, 0.00, '2024-03-05', 'Yes', 'E023', NULL),
-- Closed accounts
('ACC011', 'C006', 'BR006', 'Checking', 'Closed', '2020-11-20', '2022-05-15', 0.00, 'USD', 0.01, 0.00, '2022-05-15', 'No', 'E027', 'Closed account'),
('ACC012', 'C006', 'BR006', 'Savings', 'Active', '2020-11-20', NULL, 15000.00, 'USD', 2.25, 0.00, '2024-03-08', 'Yes', 'E027', NULL),
-- Missing customer (orphan account)
('ACC013', 'C999', 'BR007', 'Checking', 'Active', '2021-01-10', NULL, 5000.00, 'USD', 0.01, 300.00, '2024-03-10', 'Yes', 'E031', 'Orphan account - no customer'),
-- International accounts
('ACC014', 'C017', 'BR018', 'Checking', 'Active', '2022-09-01', NULL, 25000.00, 'GBP', 0.01, 1000.00, '2024-03-15', 'Yes', 'E064', 'UK account'),
('ACC015', 'C018', 'BR018', 'Savings', 'Active', '2022-11-15', NULL, 85000.00, 'EUR', 1.50, 0.00, '2024-03-12', 'Yes', 'E064', 'Euro savings'),
('ACC016', 'C019', 'BR018', 'Checking', 'Active', '2023-01-20', NULL, 18000.00, 'EUR', 0.01, 500.00, '2024-03-14', 'Yes', 'E065', 'French account'),
('ACC017', 'C020', 'BR020', 'Checking', 'Active', '2023-03-10', NULL, 12000.00, 'MXN', 0.01, 1000.00, '2024-03-13', 'Yes', 'E070', 'Mexican account'),
-- Duplicate accounts
('ACC018', 'C001', 'BR001', 'Checking', 'Active', '2020-01-15', NULL, 15000.00, 'USD', 0.01, 500.00, '2024-03-15', 'Yes', 'E002', 'Duplicate of ACC001'),
('ACC019', 'C002', 'BR002', 'Savings', 'Active', '2020-03-20', NULL, 22000.00, 'USD', 2.25, 0.00, '2024-02-28', 'Yes', 'E007', 'Duplicate of ACC004'),
-- More accounts
('ACC020', 'C007', 'BR007', 'Checking', 'Active', '2021-01-10', NULL, 9500.00, 'USD', 0.01, 400.00, '2024-03-12', 'Yes', 'E031', NULL),
('ACC021', 'C007', 'BR007', 'Savings', 'Active', '2021-01-10', NULL, 32000.00, 'USD', 2.50, 0.00, '2024-03-01', 'Y', 'E031', NULL),
('ACC022', 'C008', 'BR008', 'Checking', 'Active', '2021-03-25', NULL, 7200.00, 'USD', 0.01, 300.00, '2024-03-13', 'Yes', 'E034', NULL),
('ACC023', 'C008', 'BR008', 'Savings', 'Active', '2021-03-25', NULL, 19500.00, 'USD', 2.25, 0.00, '2024-02-20', 'Yes', 'E034', NULL),
('ACC024', 'C009', 'BR009', 'Checking', 'Active', '2021-05-15', NULL, 11000.00, 'USD', 0.01, 500.00, '2024-03-14', 'Y', 'E037', NULL),
('ACC025', 'C009', 'BR009', 'Savings', 'Active', '2021-05-15', NULL, 38000.00, 'USD', 2.50, 0.00, '2024-03-05', 'Yes', 'E037', NULL),
('ACC026', 'C010', 'BR010', 'Checking', 'Active', '2021-07-01', NULL, 8800.00, 'USD', 0.01, 400.00, '2024-03-11', 'Yes', 'E040', NULL),
('ACC027', 'C010', 'BR010', 'Savings', 'Active', '2021-07-01', NULL, 24000.00, 'USD', 2.25, 0.00, '2024-02-28', 'Yes', 'E040', NULL),
('ACC028', 'C011', 'BR011', 'Checking', 'Active', '2021-09-20', NULL, 22000.00, 'USD', 0.01, 1000.00, '2024-03-15', 'Y', 'E043', NULL),
('ACC029', 'C011', 'BR011', 'Savings', 'Active', '2021-09-20', NULL, 75000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Yes', 'E043', NULL),
('ACC030', 'C012', 'BR012', 'Checking', 'Active', '2021-11-10', NULL, 9800.00, 'USD', 0.01, 400.00, '2024-03-12', 'Yes', 'E046', NULL),
('ACC031', 'C012', 'BR012', 'Savings', 'Active', '2021-11-10', NULL, 26000.00, 'USD', 2.25, 0.00, '2024-03-01', 'Yes', 'E046', NULL),
('ACC032', 'C013', 'BR013', 'Checking', 'Active', '2022-01-15', NULL, 3500.00, 'USD', 0.01, 200.00, '2024-03-08', 'Y', 'E049', 'Unemployed customer'),
('ACC033', 'C014', 'BR014', 'Checking', 'Active', '2022-03-20', NULL, 11500.00, 'USD', 0.01, 500.00, '2024-03-14', 'Yes', 'E052', NULL),
('ACC034', 'C014', 'BR014', 'Savings', 'Active', '2022-03-20', NULL, 28000.00, 'USD', 2.50, 0.00, '2024-03-05', 'Yes', 'E052', NULL),
('ACC035', 'C015', 'BR015', 'Checking', 'Active', '2022-05-10', NULL, 13500.00, 'USD', 0.01, 600.00, '2024-03-13', 'Y', 'E055', NULL),
('ACC036', 'C015', 'BR015', 'Savings', 'Active', '2022-05-10', NULL, 42000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E055', NULL),
('ACC037', 'C016', 'BR016', 'Checking', 'Active', '2022-07-15', NULL, 8200.00, 'USD', 0.01, 300.00, '2024-03-12', 'Yes', 'E058', NULL),
('ACC038', 'C016', 'BR016', 'Savings', 'Active', '2022-07-15', NULL, 21000.00, 'USD', 2.25, 0.00, '2024-02-25', 'Yes', 'E058', NULL),
-- Dormant accounts (no transaction in over 6 months)
('ACC039', 'C024', 'BR001', 'Savings', 'Dormant', '2020-02-20', NULL, 5500.00, 'USD', 1.50, 0.00, '2023-06-01', 'Yes', 'E002', 'No activity 9+ months'),
('ACC040', 'C025', 'BR002', 'Checking', 'Dormant', '2020-04-15', NULL, 2800.00, 'USD', 0.01, 200.00, '2023-05-15', 'Yes', 'E007', 'No activity 10+ months'),
-- Missing data accounts
('ACC041', 'C026', 'BR003', 'Checking', 'Active', '2020-06-01', NULL, NULL, 'USD', NULL, NULL, NULL, 'Yes', 'E012', 'Missing balance and rate'),
('ACC042', 'C027', 'BR004', 'Savings', 'Active', '2020-08-10', NULL, 16000.00, NULL, 2.25, 0.00, '2024-03-01', 'Y', 'E017', 'Missing currency'),
-- More accounts
('ACC043', 'C028', 'BR005', 'Checking', 'Active', '2020-10-15', NULL, 7800.00, 'USD', 0.01, 300.00, '2024-03-11', 'Yes', 'E023', NULL),
('ACC044', 'C029', 'BR006', 'Checking', 'Active', '2020-12-01', NULL, 18500.00, 'USD', 0.01, 800.00, '2024-03-14', 'Yes', 'E027', NULL),
('ACC045', 'C029', 'BR006', 'Savings', 'Active', '2020-12-01', NULL, 55000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E027', NULL),
('ACC046', 'C030', 'BR007', 'Checking', 'Active', '2021-02-15', NULL, 9200.00, 'USD', 0.01, 400.00, '2024-03-12', 'Yes', 'E031', NULL),
('ACC047', 'C031', 'BR008', 'Checking', 'Active', '2021-04-20', NULL, 14000.00, 'USD', 0.01, 600.00, '2024-03-15', 'Yes', 'E034', NULL),
('ACC048', 'C031', 'BR008', 'Savings', 'Active', '2021-04-20', NULL, 36000.00, 'USD', 2.50, 0.00, '2024-03-08', 'Y', 'E034', NULL),
('ACC049', 'C032', 'BR009', 'Checking', 'Active', '2021-06-10', NULL, 6800.00, 'USD', 0.01, 250.00, '2024-03-13', 'Yes', 'E037', NULL),
('ACC050', 'C033', 'BR010', 'Checking', 'Active', '2021-08-25', NULL, 21000.00, 'USD', 0.01, 1000.00, '2024-03-14', 'Yes', 'E040', NULL),
('ACC051', 'C033', 'BR010', 'Savings', 'Active', '2021-08-25', NULL, 68000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E040', NULL),
('ACC052', 'C034', 'BR011', 'Checking', 'Active', '2021-10-15', NULL, 10500.00, 'USD', 0.01, 500.00, '2024-03-11', 'Yes', 'E043', NULL),
('ACC053', 'C035', 'BR012', 'Checking', 'Active', '2021-12-01', NULL, 16000.00, 'USD', 0.01, 700.00, '2024-03-15', 'Yes', 'E046', NULL),
('ACC054', 'C035', 'BR012', 'Savings', 'Active', '2021-12-01', NULL, 48000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Y', 'E046', NULL),
('ACC055', 'C036', 'BR013', 'Checking', 'Active', '2022-02-15', NULL, 8500.00, 'USD', 0.01, 350.00, '2024-03-12', 'Yes', 'E049', NULL),
('ACC056', 'C037', 'BR014', 'Checking', 'Active', '2022-04-20', NULL, 17500.00, 'USD', 0.01, 800.00, '2024-03-14', 'Yes', 'E052', NULL),
('ACC057', 'C037', 'BR014', 'Savings', 'Active', '2022-04-20', NULL, 52000.00, 'USD', 2.75, 0.00, '2024-03-05', 'Y', 'E052', NULL),
('ACC058', 'C038', 'BR015', 'Checking', 'Active', '2022-06-10', NULL, 7200.00, 'USD', 0.01, 300.00, '2024-03-13', 'Yes', 'E055', NULL),
('ACC059', 'C039', 'BR016', 'Checking', 'Active', '2022-08-25', NULL, 19000.00, 'USD', 0.01, 900.00, '2024-03-15', 'Yes', 'E058', NULL),
('ACC060', 'C039', 'BR016', 'Savings', 'Active', '2022-08-25', NULL, 62000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E058', NULL),
('ACC061', 'C040', 'BR017', 'Checking', 'Active', '2022-10-15', NULL, 9800.00, 'USD', 0.01, 400.00, '2024-03-12', 'Yes', 'E061', NULL),
('ACC062', 'C041', 'BR018', 'Checking', 'Active', '2023-05-01', NULL, 15000.00, 'JPY', 0.01, 50000.00, '2024-03-15', 'Yes', 'E064', 'Japanese Yen account'),
('ACC063', 'C042', 'BR018', 'Savings', 'Active', '2023-07-15', NULL, 250000.00, 'AED', 1.75, 0.00, '2024-03-12', 'Yes', 'E064', 'UAE Dirham account'),
('ACC064', 'C043', 'BR018', 'Checking', 'Active', '2023-09-20', NULL, 45000.00, 'EUR', 0.01, 2000.00, '2024-03-14', 'Yes', 'E065', 'Euro checking'),
('ACC065', 'C044', 'BR020', 'Checking', 'Active', '2023-11-10', NULL, 85000.00, 'BRL', 0.01, 5000.00, '2024-03-13', 'Yes', 'E070', 'Brazilian Real'),
('ACC066', 'C045', 'BR018', 'Savings', 'Active', '2024-01-15', NULL, 180000.00, 'CNY', 2.25, 0.00, '2024-03-10', 'Yes', 'E064', 'Chinese Yuan'),
-- More US accounts
('ACC067', 'C046', 'BR001', 'Checking', 'Active', '2020-03-01', NULL, 7500.00, 'USD', 0.01, 300.00, '2024-03-11', 'Y', 'E002', NULL),
('ACC068', 'C047', 'BR002', 'Checking', 'Active', '2020-05-15', NULL, 14500.00, 'USD', 0.01, 600.00, '2024-03-14', 'Yes', 'E007', NULL),
('ACC069', 'C047', 'BR002', 'Savings', 'Active', '2020-05-15', NULL, 42000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E007', NULL),
('ACC070', 'C048', 'BR003', 'Checking', 'Active', '2020-07-20', NULL, 11000.00, 'USD', 0.01, 500.00, '2024-03-15', 'Y', 'E012', NULL),
('ACC071', 'C049', 'BR004', 'Checking', 'Active', '2020-09-25', NULL, 8200.00, 'USD', 0.01, 350.00, '2024-03-12', 'Yes', 'E017', NULL),
('ACC072', 'C050', 'BR005', 'Checking', 'Active', '2020-11-10', NULL, 13500.00, 'USD', 0.01, 600.00, '2024-03-13', 'Yes', 'E023', NULL),
('ACC073', 'C050', 'BR005', 'Savings', 'Active', '2020-11-10', NULL, 38000.00, 'USD', 2.50, 0.00, '2024-03-05', 'Y', 'E023', NULL),
('ACC074', 'C051', 'BR006', 'Checking', 'Active', '2021-01-20', NULL, 15000.00, 'USD', 0.01, 700.00, '2024-03-14', 'Yes', 'E027', NULL),
('ACC075', 'C051', 'BR006', 'Savings', 'Active', '2021-01-20', NULL, 45000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Yes', 'E027', NULL),
('ACC076', 'C052', 'BR007', 'Checking', 'Active', '2021-03-15', NULL, 6200.00, 'USD', 0.01, 250.00, '2024-03-11', 'Y', 'E031', NULL),
('ACC077', 'C053', 'BR008', 'Checking', 'Active', '2021-05-20', NULL, 12500.00, 'USD', 0.01, 550.00, '2024-03-15', 'Yes', 'E034', NULL),
('ACC078', 'C054', 'BR009', 'Checking', 'Active', '2021-07-25', NULL, 9500.00, 'USD', 0.01, 400.00, '2024-03-12', 'Yes', 'E037', NULL),
('ACC079', 'C055', 'BR010', 'Checking', 'Active', '2021-09-10', NULL, 20000.00, 'USD', 0.01, 1000.00, '2024-03-14', 'Y', 'E040', NULL),
('ACC080', 'C055', 'BR010', 'Savings', 'Active', '2021-09-10', NULL, 65000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E040', NULL),
-- Business accounts
('ACC081', 'C003', 'BR003', 'Business', 'Active', '2021-01-15', NULL, 125000.00, 'USD', 0.50, 5000.00, '2024-03-15', 'Yes', 'E012', 'Business checking'),
('ACC082', 'C029', 'BR006', 'Business', 'Active', '2021-06-01', NULL, 98000.00, 'USD', 0.50, 5000.00, '2024-03-14', 'Yes', 'E027', 'Business checking'),
('ACC083', 'C033', 'BR010', 'Business', 'Active', '2022-02-15', NULL, 215000.00, 'USD', 0.50, 10000.00, '2024-03-15', 'Yes', 'E040', 'Business checking'),
('ACC084', 'C043', 'BR018', 'Business', 'Active', '2023-09-20', NULL, 380000.00, 'EUR', 0.25, 20000.00, '2024-03-15', 'Yes', 'E064', 'European business'),
-- Accounts with out of range interest rates
('ACC085', 'C056', 'BR011', 'Savings', 'Active', '2021-11-25', NULL, 28000.00, 'USD', 15.50, 0.00, '2024-03-10', 'Yes', 'E043', 'Invalid interest rate'),
('ACC086', 'C057', 'BR012', 'Checking', 'Active', '2022-01-15', NULL, 16500.00, 'USD', -0.50, 600.00, '2024-03-13', 'Yes', 'E046', 'Negative interest rate'),
-- More accounts
('ACC087', 'C058', 'BR013', 'Checking', 'Active', '2022-03-20', NULL, 7800.00, 'USD', 0.01, 300.00, '2024-03-11', 'Y', 'E049', NULL),
('ACC088', 'C059', 'BR014', 'Checking', 'Active', '2022-05-10', NULL, 18500.00, 'USD', 0.01, 800.00, '2024-03-14', 'Yes', 'E052', NULL),
('ACC089', 'C059', 'BR014', 'Savings', 'Active', '2022-05-10', NULL, 54000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E052', NULL),
('ACC090', 'C060', 'BR015', 'Checking', 'Active', '2022-07-25', NULL, 9200.00, 'USD', 0.01, 400.00, '2024-03-12', 'Y', 'E055', NULL),
('ACC091', 'C061', 'BR016', 'Checking', 'Active', '2022-09-15', NULL, 14500.00, 'USD', 0.01, 650.00, '2024-03-15', 'Yes', 'E058', NULL),
('ACC092', 'C061', 'BR016', 'Savings', 'Active', '2022-09-15', NULL, 40000.00, 'USD', 2.50, 0.00, '2024-03-10', 'Yes', 'E058', NULL),
('ACC093', 'C062', 'BR017', 'Checking', 'Active', '2022-11-20', NULL, 10500.00, 'USD', 0.01, 450.00, '2024-03-13', 'Y', 'E061', NULL),
('ACC094', 'C063', 'BR018', 'Checking', 'Active', '2023-01-10', NULL, 22000.00, 'USD', 0.01, 1000.00, '2024-03-14', 'Yes', 'E064', 'Russian customer USD'),
('ACC095', 'C064', 'BR018', 'Savings', 'Active', '2023-03-25', NULL, 45000.00, 'KRW', 1.25, 0.00, '2024-03-10', 'Yes', 'E064', 'Korean Won'),
('ACC096', 'C065', 'BR018', 'Business', 'Active', '2023-05-15', NULL, 250000.00, 'EUR', 0.25, 10000.00, '2024-03-15', 'Yes', 'E065', 'German business'),
('ACC097', 'C066', 'BR018', 'Savings', 'Active', '2023-07-20', NULL, 68000.00, 'EUR', 1.75, 0.00, '2024-03-08', 'Y', 'E064', 'Italian savings'),
('ACC098', 'C067', 'BR020', 'Checking', 'Active', '2023-09-25', NULL, 95000.00, 'BRL', 0.01, 5000.00, '2024-03-13', 'Yes', 'E070', 'Brazilian checking'),
('ACC099', 'C068', 'BR018', 'Checking', 'Active', '2023-11-15', NULL, 28000.00, 'PLN', 0.01, 2000.00, '2024-03-11', 'Yes', 'E064', 'Polish Zloty'),
('ACC100', 'C069', 'BR018', 'Savings', 'Active', '2024-01-20', NULL, 35000.00, 'EGP', 5.00, 0.00, '2024-03-10', 'Yes', 'E065', 'Egyptian Pound');

-- ============================================================
-- TABLE 5: TRANSACTIONS
-- ============================================================
CREATE TABLE transactions (
    transaction_id      VARCHAR(15),
    account_id          VARCHAR(15),
    customer_id         VARCHAR(10),
    branch_id           VARCHAR(10),
    transaction_type    VARCHAR(20),
    amount              NUMERIC(15,2),
    currency            VARCHAR(10),
    transaction_date    VARCHAR(20),
    description         VARCHAR(200),
    balance_after       NUMERIC(15,2),
    status              VARCHAR(20),
    employee_id         VARCHAR(10),
    channel             VARCHAR(20),
    notes               TEXT
);

INSERT INTO transactions VALUES
-- Clean transactions
('TXN001', 'ACC001', 'C001', 'BR001', 'Deposit', 5000.00, 'USD', '2024-01-15', 'Payroll deposit', 20000.00, 'Completed', 'E002', 'Online', NULL),
('TXN002', 'ACC001', 'C001', 'BR001', 'Withdrawal', 1500.00, 'USD', '2024-01-20', 'Rent payment', 18500.00, 'Completed', 'E002', 'ATM', NULL),
('TXN003', 'ACC002', 'C001', 'BR001', 'Deposit', 2000.00, 'USD', '2024-01-25', 'Transfer from checking', 47000.00, 'Completed', 'E002', 'Online', NULL),
('TXN004', 'ACC003', 'C002', 'BR002', 'Deposit', 3500.00, 'USD', '2024-02-01', 'Payroll deposit', 12000.00, 'Completed', 'E007', 'Online', NULL),
('TXN005', 'ACC003', 'C002', 'BR002', 'Withdrawal', 800.00, 'USD', '2024-02-05', 'Grocery shopping', 11200.00, 'Completed', 'E007', 'Card', NULL),
-- Duplicate transactions
('TXN006', 'ACC001', 'C001', 'BR001', 'Deposit', 5000.00, 'USD', '2024-01-15', 'Payroll deposit', 20000.00, 'Completed', 'E002', 'Online', 'Duplicate of TXN001'),
('TXN007', 'ACC003', 'C002', 'BR002', 'Deposit', 3500.00, 'USD', '2024-02-01', 'Payroll deposit', 12000.00, 'Completed', 'E007', 'Online', 'Duplicate of TXN004'),
-- Negative amounts (withdrawals shown as negative - data entry error)
('TXN008', 'ACC005', 'C003', 'BR003', 'Withdrawal', -2000.00, 'USD', '2024-01-10', 'Bill payment', 10000.00, 'Completed', 'E012', 'Online', 'Negative amount error'),
('TXN009', 'ACC006', 'C003', 'BR003', 'Deposit', 4500.00, 'USD', '2024-01-18', 'Business income', 39500.00, 'Completed', 'E012', 'Branch', NULL),
-- Messy dates
('TXN010', 'ACC007', 'C004', 'BR004', 'Deposit', 2800.00, 'USD', '15/02/2024', 'Payroll deposit', 9300.00, 'Completed', 'E017', 'Online', 'European date format'),
('TXN011', 'ACC008', 'C004', 'BR004', 'Withdrawal', 500.00, 'USD', '2024/20/02', 'ATM withdrawal', 17500.00, 'Completed', 'E017', 'ATM', 'Backwards date'),
-- Suspicious large transactions
('TXN012', 'ACC029', 'C011', 'BR011', 'Deposit', 950000.00, 'USD', '2024-02-10', 'Wire transfer', 1025000.00, 'Pending', 'E043', 'Wire', 'Large transaction - review needed'),
('TXN013', 'ACC051', 'C033', 'BR010', 'Withdrawal', 500000.00, 'USD', '2024-02-15', 'Real estate purchase', 568000.00, 'Completed', 'E040', 'Wire', 'Large withdrawal'),
-- Missing data
('TXN014', 'ACC010', 'C005', 'BR005', 'Deposit', NULL, 'USD', '2024-01-22', 'Cash deposit', NULL, 'Completed', 'E023', 'Branch', 'Missing amount'),
('TXN015', 'ACC012', 'C006', 'BR006', 'Withdrawal', 1200.00, NULL, '2024-01-28', 'Online purchase', 13800.00, 'Completed', 'E027', 'Online', 'Missing currency'),
-- Failed transactions
('TXN016', 'ACC032', 'C013', 'BR013', 'Withdrawal', 5000.00, 'USD', '2024-02-20', 'Insufficient funds', 3500.00, 'Failed', 'E049', 'ATM', 'Insufficient funds'),
('TXN017', 'ACC009', 'C005', 'BR005', 'Withdrawal', 1000.00, 'USD', '2024-01-30', 'ATM withdrawal', -1500.00, 'Completed', 'E023', 'ATM', 'Account went negative'),
-- International transactions
('TXN018', 'ACC014', 'C017', 'BR018', 'Deposit', 5000.00, 'GBP', '2024-02-01', 'Salary', 30000.00, 'Completed', 'E064', 'Online', 'UK deposit'),
('TXN019', 'ACC015', 'C018', 'BR018', 'Withdrawal', 15000.00, 'EUR', '2024-02-05', 'Business expense', 70000.00, 'Completed', 'E064', 'Wire', 'Euro withdrawal'),
('TXN020', 'ACC017', 'C020', 'BR020', 'Deposit', 50000.00, 'MXN', '2024-02-10', 'Business income', 62000.00, 'Completed', 'E070', 'Branch', 'Mexico deposit'),
-- More transactions
('TXN021', 'ACC020', 'C007', 'BR007', 'Deposit', 3800.00, 'USD', '2024-01-15', 'Payroll', 13300.00, 'Completed', 'E031', 'Online', NULL),
('TXN022', 'ACC020', 'C007', 'BR007', 'Withdrawal', 1200.00, 'USD', '2024-01-20', 'Utilities', 12100.00, 'Completed', 'E031', 'Online', NULL),
('TXN023', 'ACC021', 'C007', 'BR007', 'Deposit', 1500.00, 'USD', '2024-01-25', 'Transfer', 33500.00, 'Completed', 'E031', 'Online', NULL),
('TXN024', 'ACC022', 'C008', 'BR008', 'Deposit', 2900.00, 'USD', '2024-02-01', 'Payroll', 10100.00, 'Completed', 'E034', 'Online', NULL),
('TXN025', 'ACC022', 'C008', 'BR008', 'Withdrawal', 600.00, 'USD', '2024-02-08', 'Shopping', 9500.00, 'Completed', 'E034', 'Card', NULL),
('TXN026', 'ACC024', 'C009', 'BR009', 'Deposit', 4500.00, 'USD', '2024-01-18', 'Payroll', 15500.00, 'Completed', 'E037', 'Online', NULL),
('TXN027', 'ACC025', 'C009', 'BR009', 'Deposit', 2000.00, 'USD', '2024-01-25', 'Transfer', 40000.00, 'Completed', 'E037', 'Online', NULL),
('TXN028', 'ACC026', 'C010', 'BR010', 'Deposit', 3100.00, 'USD', '2024-02-01', 'Payroll', 11900.00, 'Completed', 'E040', 'Online', NULL),
('TXN029', 'ACC026', 'C010', 'BR010', 'Withdrawal', 900.00, 'USD', '2024-02-10', 'Dining', 11000.00, 'Completed', 'E040', 'Card', NULL),
('TXN030', 'ACC028', 'C011', 'BR011', 'Deposit', 8500.00, 'USD', '2024-01-20', 'Business income', 30500.00, 'Completed', 'E043', 'Wire', NULL),
-- Messy currency in transactions
('TXN031', 'ACC030', 'C012', 'BR012', 'Deposit', 3400.00, 'usd', '2024-02-05', 'Payroll', 13200.00, 'Completed', 'E046', 'Online', 'Messy currency'),
('TXN032', 'ACC031', 'C012', 'BR012', 'Deposit', 1800.00, 'Usd', '2024-02-12', 'Transfer', 27800.00, 'Completed', 'E046', 'Online', 'Messy currency'),
('TXN033', 'ACC033', 'C014', 'BR014', 'Deposit', 4200.00, 'USD', '2024-01-16', 'Payroll', 15700.00, 'Completed', 'E052', 'Online', NULL),
('TXN034', 'ACC035', 'C015', 'BR015', 'Deposit', 4400.00, 'USD', '2024-01-22', 'Payroll', 17900.00, 'Completed', 'E055', 'Online', NULL),
('TXN035', 'ACC037', 'C016', 'BR016', 'Deposit', 3600.00, 'USD', '2024-02-01', 'Payroll', 11800.00, 'Completed', 'E058', 'Online', NULL),
-- Transactions with wrong status
('TXN036', 'ACC044', 'C029', 'BR006', 'Deposit', 7500.00, 'USD', '2024-01-25', 'Business income', 26000.00, 'COMPLETED', 'E027', 'Wire', 'Status case issue'),
('TXN037', 'ACC050', 'C033', 'BR010', 'Withdrawal', 3000.00, 'USD', '2024-02-08', 'Business expense', 18000.00, 'completed', 'E040', 'Wire', 'Status case issue'),
('TXN038', 'ACC045', 'C029', 'BR006', 'Deposit', 12000.00, 'USD', '2024-02-15', 'Business transfer', 67000.00, 'PENDING', 'E027', 'Wire', 'Status case issue'),
-- Zero amount transactions (invalid)
('TXN039', 'ACC043', 'C028', 'BR005', 'Deposit', 0.00, 'USD', '2024-02-20', 'Test transaction', 7800.00, 'Completed', 'E023', 'Online', 'Zero amount - invalid'),
('TXN040', 'ACC046', 'C030', 'BR007', 'Withdrawal', 0.00, 'USD', '2024-02-22', 'Test transaction', 9200.00, 'Completed', 'E031', 'ATM', 'Zero amount - invalid'),
-- More normal transactions
('TXN041', 'ACC047', 'C031', 'BR008', 'Deposit', 3900.00, 'USD', '2024-01-18', 'Payroll', 17900.00, 'Completed', 'E034', 'Online', NULL),
('TXN042', 'ACC048', 'C031', 'BR008', 'Deposit', 2200.00, 'USD', '2024-01-25', 'Transfer', 38200.00, 'Completed', 'E034', 'Online', NULL),
('TXN043', 'ACC049', 'C032', 'BR009', 'Deposit', 2700.00, 'USD', '2024-02-01', 'Payroll', 9500.00, 'Completed', 'E037', 'Online', NULL),
('TXN044', 'ACC052', 'C034', 'BR011', 'Deposit', 3200.00, 'USD', '2024-01-20', 'Payroll', 13700.00, 'Completed', 'E043', 'Online', NULL),
('TXN045', 'ACC053', 'C035', 'BR012', 'Deposit', 4100.00, 'USD', '2024-01-22', 'Payroll', 20100.00, 'Completed', 'E046', 'Online', NULL),
('TXN046', 'ACC054', 'C035', 'BR012', 'Deposit', 2500.00, 'USD', '2024-01-28', 'Transfer', 50500.00, 'Completed', 'E046', 'Online', NULL),
('TXN047', 'ACC055', 'C036', 'BR013', 'Deposit', 2900.00, 'USD', '2024-02-05', 'Payroll', 11400.00, 'Completed', 'E049', 'Online', NULL),
('TXN048', 'ACC056', 'C037', 'BR014', 'Deposit', 4300.00, 'USD', '2024-01-15', 'Payroll', 21800.00, 'Completed', 'E052', 'Online', NULL),
('TXN049', 'ACC058', 'C038', 'BR015', 'Deposit', 2800.00, 'USD', '2024-02-01', 'Payroll', 10000.00, 'Completed', 'E055', 'Online', NULL),
('TXN050', 'ACC059', 'C039', 'BR016', 'Deposit', 4700.00, 'USD', '2024-01-18', 'Payroll', 23700.00, 'Completed', 'E058', 'Online', NULL),
-- COVID period transactions (2020)
('TXN051', 'ACC001', 'C001', 'BR001', 'Deposit', 1200.00, 'USD', '2020-04-15', 'Stimulus check', 16200.00, 'Completed', 'E002', 'Online', 'COVID stimulus'),
('TXN052', 'ACC003', 'C002', 'BR002', 'Deposit', 1200.00, 'USD', '2020-04-15', 'Stimulus check', 9700.00, 'Completed', 'E007', 'Online', 'COVID stimulus'),
('TXN053', 'ACC005', 'C003', 'BR003', 'Withdrawal', 3000.00, 'USD', '2020-03-20', 'Emergency withdrawal', 9000.00, 'Completed', 'E012', 'Branch', 'COVID emergency'),
('TXN054', 'ACC010', 'C005', 'BR005', 'Deposit', 2400.00, 'USD', '2020-04-20', 'Stimulus check', 30400.00, 'Completed', 'E023', 'Online', 'COVID stimulus'),
('TXN055', 'ACC022', 'C008', 'BR008', 'Withdrawal', 5000.00, 'USD', '2020-03-15', 'Emergency cash', 2200.00, 'Completed', 'E034', 'Branch', 'COVID panic withdrawal'),
-- More 2021 transactions
('TXN056', 'ACC033', 'C014', 'BR014', 'Deposit', 1400.00, 'USD', '2021-03-15', 'Stimulus check', 13100.00, 'Completed', 'E052', 'Online', '2021 stimulus'),
('TXN057', 'ACC035', 'C015', 'BR015', 'Deposit', 1400.00, 'USD', '2021-03-18', 'Stimulus check', 15300.00, 'Completed', 'E055', 'Online', '2021 stimulus'),
('TXN058', 'ACC037', 'C016', 'BR016', 'Deposit', 3800.00, 'USD', '2021-01-15', 'Payroll', 12000.00, 'Completed', 'E058', 'Online', NULL),
('TXN059', 'ACC047', 'C031', 'BR008', 'Withdrawal', 15000.00, 'USD', '2021-06-10', 'Home improvement', 21000.00, 'Completed', 'E034', 'Wire', 'Large withdrawal'),
('TXN060', 'ACC051', 'C033', 'BR010', 'Deposit', 25000.00, 'USD', '2021-08-20', 'Business profit', 93000.00, 'Completed', 'E040', 'Wire', 'Large deposit'),
-- 2022 transactions
('TXN061', 'ACC001', 'C001', 'BR001', 'Deposit', 5500.00, 'USD', '2022-02-01', 'Payroll', 21500.00, 'Completed', 'E002', 'Online', NULL),
('TXN062', 'ACC002', 'C001', 'BR001', 'Deposit', 3000.00, 'USD', '2022-02-15', 'Transfer', 48000.00, 'Completed', 'E002', 'Online', NULL),
('TXN063', 'ACC029', 'C011', 'BR011', 'Withdrawal', 20000.00, 'USD', '2022-06-01', 'Investment', 55000.00, 'Completed', 'E043', 'Wire', 'Investment withdrawal'),
('TXN064', 'ACC044', 'C029', 'BR006', 'Deposit', 18500.00, 'USD', '2022-09-15', 'Business income', 37000.00, 'Completed', 'E027', 'Wire', NULL),
('TXN065', 'ACC060', 'C039', 'BR016', 'Deposit', 8000.00, 'USD', '2022-11-01', 'Business profit', 70000.00, 'Completed', 'E058', 'Wire', NULL),
-- 2023 transactions
('TXN066', 'ACC001', 'C001', 'BR001', 'Deposit', 6000.00, 'USD', '2023-01-15', 'Payroll raise', 26000.00, 'Completed', 'E002', 'Online', 'Salary increase'),
('TXN067', 'ACC014', 'C017', 'BR018', 'Deposit', 8000.00, 'GBP', '2023-03-01', 'Salary', 33000.00, 'Completed', 'E064', 'Online', NULL),
('TXN068', 'ACC015', 'C018', 'BR018', 'Deposit', 25000.00, 'EUR', '2023-05-15', 'Business income', 95000.00, 'Completed', 'E064', 'Wire', NULL),
('TXN069', 'ACC062', 'C041', 'BR018', 'Deposit', 500000.00, 'JPY', '2023-07-01', 'Salary', 1500000.00, 'Completed', 'E064', 'Online', 'Yen deposit'),
('TXN070', 'ACC063', 'C042', 'BR018', 'Deposit', 50000.00, 'AED', '2023-09-15', 'Business income', 300000.00, 'Completed', 'E064', 'Wire', 'AED deposit'),
-- Transactions with missing customer (orphan)
('TXN071', 'ACC013', 'C999', 'BR007', 'Deposit', 2000.00, 'USD', '2024-01-10', 'Unknown deposit', 7000.00, 'Completed', 'E031', 'Branch', 'Orphan transaction - no customer'),
('TXN072', 'ACC013', 'C999', 'BR007', 'Withdrawal', 500.00, 'USD', '2024-02-05', 'ATM', 6500.00, 'Completed', 'E031', 'ATM', 'Orphan transaction'),
-- Transactions with future dates (invalid)
('TXN073', 'ACC070', 'C048', 'BR003', 'Deposit', 3200.00, 'USD', '2025-06-15', 'Future deposit', 14200.00, 'Pending', 'E012', 'Online', 'Invalid future date'),
('TXN074', 'ACC071', 'C049', 'BR004', 'Withdrawal', 800.00, 'USD', '2025-03-20', 'Future withdrawal', 7400.00, 'Pending', 'E017', 'ATM', 'Invalid future date'),
-- More recent transactions
('TXN075', 'ACC067', 'C046', 'BR001', 'Deposit', 2950.00, 'USD', '2024-02-01', 'Payroll', 10450.00, 'Completed', 'E002', 'Online', NULL),
('TXN076', 'ACC068', 'C047', 'BR002', 'Deposit', 4900.00, 'USD', '2024-01-18', 'Payroll', 19400.00, 'Completed', 'E007', 'Online', NULL),
('TXN077', 'ACC069', 'C047', 'BR002', 'Deposit', 2800.00, 'USD', '2024-01-25', 'Transfer', 44800.00, 'Completed', 'E007', 'Online', NULL),
('TXN078', 'ACC070', 'C048', 'BR003', 'Deposit', 3700.00, 'USD', '2024-02-05', 'Payroll', 14700.00, 'Completed', 'E012', 'Online', NULL),
('TXN079', 'ACC071', 'C049', 'BR004', 'Deposit', 3300.00, 'USD', '2024-01-22', 'Payroll', 11500.00, 'Completed', 'E017', 'Online', NULL),
('TXN080', 'ACC072', 'C050', 'BR005', 'Deposit', 3900.00, 'USD', '2024-02-08', 'Payroll', 17400.00, 'Completed', 'E023', 'Online', NULL),
-- Channel inconsistencies
('TXN081', 'ACC073', 'C050', 'BR005', 'Deposit', 2100.00, 'USD', '2024-01-28', 'Transfer', 40100.00, 'Completed', 'E023', 'ONLINE', 'Channel case issue'),
('TXN082', 'ACC074', 'C051', 'BR006', 'Deposit', 4100.00, 'USD', '2024-02-12', 'Payroll', 19100.00, 'Completed', 'E027', 'branch', 'Channel case issue'),
('TXN083', 'ACC075', 'C051', 'BR006', 'Deposit', 3500.00, 'USD', '2024-01-20', 'Transfer', 48500.00, 'Completed', 'E027', 'Wire Transfer', 'Channel inconsistency'),
('TXN084', 'ACC076', 'C052', 'BR007', 'Deposit', 2600.00, 'USD', '2024-02-15', 'Payroll', 8800.00, 'Completed', 'E031', 'ATM Machine', 'Channel inconsistency'),
('TXN085', 'ACC077', 'C053', 'BR008', 'Deposit', 3550.00, 'USD', '2024-01-25', 'Payroll', 16050.00, 'Completed', 'E034', 'Online', NULL),
('TXN086', 'ACC078', 'C054', 'BR009', 'Deposit', 3800.00, 'USD', '2024-02-01', 'Payroll', 13300.00, 'Completed', 'E037', 'Online', NULL),
('TXN087', 'ACC079', 'C055', 'BR010', 'Deposit', 5400.00, 'USD', '2024-01-18', 'Payroll', 25400.00, 'Completed', 'E040', 'Online', NULL),
('TXN088', 'ACC080', 'C055', 'BR010', 'Deposit', 3200.00, 'USD', '2024-01-25', 'Transfer', 68200.00, 'Completed', 'E040', 'Online', NULL),
('TXN089', 'ACC081', 'C003', 'BR003', 'Deposit', 15000.00, 'USD', '2024-02-10', 'Business income', 140000.00, 'Completed', 'E012', 'Wire', 'Business deposit'),
('TXN090', 'ACC082', 'C029', 'BR006', 'Deposit', 22000.00, 'USD', '2024-01-22', 'Business income', 120000.00, 'Completed', 'E027', 'Wire', 'Business deposit'),
-- Transactions with leading/trailing spaces in description
('TXN091', 'ACC083', 'C033', 'BR010', 'Deposit', 45000.00, 'USD', '2024-02-08', '  Business income  ', 260000.00, 'Completed', 'E040', 'Wire', 'Spaces in description'),
('TXN092', 'ACC085', 'C056', 'BR011', 'Deposit', 2800.00, 'USD', '2024-01-30', '  Payroll  ', 30800.00, 'Completed', 'E043', 'Online', 'Spaces in description'),
('TXN093', 'ACC086', 'C057', 'BR012', 'Deposit', 4200.00, 'USD', '2024-02-05', '  Salary payment  ', 20700.00, 'Completed', 'E046', 'Online', 'Spaces in description'),
('TXN094', 'ACC087', 'C058', 'BR013', 'Deposit', 3050.00, 'USD', '2024-01-15', 'Payroll', 10850.00, 'Completed', 'E049', 'Online', NULL),
('TXN095', 'ACC088', 'C059', 'BR014', 'Deposit', 4200.00, 'USD', '2024-02-01', 'Payroll', 22700.00, 'Completed', 'E052', 'Online', NULL),
('TXN096', 'ACC089', 'C059', 'BR014', 'Deposit', 3100.00, 'USD', '2024-01-20', 'Transfer', 57100.00, 'Completed', 'E052', 'Online', NULL),
('TXN097', 'ACC090', 'C060', 'BR015', 'Deposit', 3400.00, 'USD', '2024-02-08', 'Payroll', 12600.00, 'Completed', 'E055', 'Online', NULL),
('TXN098', 'ACC091', 'C061', 'BR016', 'Deposit', 3950.00, 'USD', '2024-01-22', 'Payroll', 18450.00, 'Completed', 'E058', 'Online', NULL),
('TXN099', 'ACC092', 'C061', 'BR016', 'Deposit', 2700.00, 'USD', '2024-01-28', 'Transfer', 42700.00, 'Completed', 'E058', 'Online', NULL),
('TXN100', 'ACC093', 'C062', 'BR017', 'Deposit', 3250.00, 'USD', '2024-02-05', 'Payroll', 13750.00, 'Completed', 'E061', 'Online', NULL);

-- ============================================================
-- TABLE 6: LOANS
-- ============================================================
CREATE TABLE loans (
    loan_id         VARCHAR(15),
    customer_id     VARCHAR(10),
    branch_id       VARCHAR(10),
    employee_id     VARCHAR(10),
    loan_type       VARCHAR(30),
    loan_amount     NUMERIC(15,2),
    interest_rate   NUMERIC(5,2),
    term_months     INT,
    start_date      VARCHAR(20),
    end_date        VARCHAR(20),
    monthly_payment NUMERIC(10,2),
    amount_paid     NUMERIC(15,2),
    balance_due     NUMERIC(15,2),
    loan_status     VARCHAR(20),
    currency        VARCHAR(10),
    collateral      VARCHAR(100),
    missed_payments INT,
    is_active       VARCHAR(10),
    notes           TEXT
);

INSERT INTO loans VALUES
-- Clean loans
('LN001', 'C001', 'BR001', 'E002', 'Mortgage', 350000.00, 3.75, 360, '2020-02-01', '2050-02-01', 1621.00, 45000.00, 305000.00, 'Active', 'USD', 'Property', 0, 'Yes', 'Home loan'),
('LN002', 'C001', 'BR001', 'E002', 'Auto', 35000.00, 5.25, 60, '2022-03-15', '2027-03-15', 665.00, 12000.00, 23000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', 'Car loan'),
('LN003', 'C002', 'BR002', 'E007', 'Personal', 15000.00, 8.50, 48, '2021-05-01', '2025-05-01', 372.00, 18600.00, 0.00, 'Paid', 'USD', 'None', 0, 'No', 'Paid off'),
('LN004', 'C003', 'BR003', 'E012', 'Business', 150000.00, 6.25, 84, '2021-01-15', '2028-01-15', 2455.00, 55000.00, 95000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', 'Business expansion'),
('LN005', 'C004', 'BR004', 'E017', 'Personal', 10000.00, 9.00, 36, '2022-08-01', '2025-08-01', 318.00, 9540.00, 460.00, 'Active', 'USD', 'None', 1, 'Yes', 'One missed payment'),
-- Duplicate loans
('LN006', 'C001', 'BR001', 'E002', 'Mortgage', 350000.00, 3.75, 360, '2020-02-01', '2050-02-01', 1621.00, 45000.00, 305000.00, 'Active', 'USD', 'Property', 0, 'Yes', 'Duplicate of LN001'),
-- Messy dates
('LN007', 'C005', 'BR005', 'E023', 'Auto', 28000.00, 5.75, 60, '15/06/2021', '15/06/2026', 537.00, 19000.00, 9000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', 'European date format'),
('LN008', 'C006', 'BR006', 'E027', 'Personal', 20000.00, 8.75, 48, '2021/20/09', '2025/20/09', 497.00, 14900.00, 5100.00, 'Active', 'USD', 'None', 2, 'Yes', 'Backwards date - 2 missed payments'),
-- Defaulted loans
('LN009', 'C013', 'BR013', 'E049', 'Personal', 8000.00, 12.00, 24, '2022-03-01', '2024-03-01', 376.00, 2256.00, 5744.00, 'Default', 'USD', 'None', 8, 'Yes', 'High risk - unemployed customer'),
('LN010', 'C091', 'BR001', 'E002', 'Personal', 5000.00, 15.00, 24, '2022-06-15', '2024-06-15', 243.00, 972.00, 4028.00, 'Default', 'USD', 'None', 12, 'Yes', 'Multiple missed payments'),
-- International loans
('LN011', 'C017', 'BR018', 'E064', 'Mortgage', 450000.00, 2.50, 300, '2022-10-01', '2047-10-01', 2017.00, 35000.00, 415000.00, 'Active', 'GBP', 'Property', 0, 'Yes', 'UK mortgage'),
('LN012', 'C018', 'BR018', 'E064', 'Business', 500000.00, 4.00, 120, '2022-12-01', '2032-12-01', 5061.00, 80000.00, 420000.00, 'Active', 'EUR', 'Business assets', 0, 'Yes', 'European business loan'),
('LN013', 'C020', 'BR020', 'E070', 'Personal', 200000.00, 9.50, 36, '2023-04-01', '2026-04-01', 6411.00, 45000.00, 155000.00, 'Active', 'MXN', 'None', 1, 'Yes', 'Mexico personal loan'),
-- Negative loan amount (error)
('LN014', 'C007', 'BR007', 'E031', 'Personal', -12000.00, 8.50, 36, '2021-03-01', '2024-03-01', 378.00, 12000.00, 0.00, 'Paid', 'USD', 'None', 0, 'No', 'Negative amount error'),
-- Missing data
('LN015', 'C008', 'BR008', 'E034', 'Auto', 22000.00, NULL, 48, '2021-05-15', '2025-05-15', NULL, 8800.00, 13200.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', 'Missing interest rate'),
('LN016', 'C009', 'BR009', 'E037', 'Mortgage', 280000.00, 4.00, 360, '2021-07-01', '2051-07-01', NULL, 25000.00, 255000.00, 'Active', 'USD', 'Property', 0, 'Yes', 'Missing monthly payment'),
-- More loans
('LN017', 'C010', 'BR010', 'E040', 'Auto', 32000.00, 5.50, 60, '2021-09-15', '2026-09-15', 613.00, 18000.00, 14000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', NULL),
('LN018', 'C011', 'BR011', 'E043', 'Business', 250000.00, 5.75, 84, '2021-11-01', '2028-11-01', 3986.00, 95000.00, 155000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', 'Large business loan'),
('LN019', 'C012', 'BR012', 'E046', 'Mortgage', 320000.00, 3.50, 360, '2022-01-15', '2052-01-15', 1437.00, 28000.00, 292000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN020', 'C014', 'BR014', 'E052', 'Personal', 18000.00, 8.25, 48, '2022-05-01', '2026-05-01', 441.00, 15900.00, 2100.00, 'Active', 'USD', 'None', 0, 'Yes', NULL),
('LN021', 'C015', 'BR015', 'E055', 'Mortgage', 395000.00, 3.25, 360, '2022-07-01', '2052-07-01', 1720.00, 30000.00, 365000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN022', 'C016', 'BR016', 'E058', 'Auto', 25000.00, 6.00, 60, '2022-09-01', '2027-09-01', 483.00, 14500.00, 10500.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', NULL),
('LN023', 'C024', 'BR001', 'E002', 'Personal', 12000.00, 9.50, 36, '2020-04-01', '2023-04-01', 385.00, 13860.00, 0.00, 'Paid', 'USD', 'None', 0, 'No', 'Fully paid'),
('LN024', 'C025', 'BR002', 'E007', 'Business', 180000.00, 6.00, 84, '2020-06-01', '2027-06-01', 2661.00, 78000.00, 102000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
('LN025', 'C026', 'BR003', 'E012', 'Auto', 30000.00, 5.25, 60, '2020-08-15', '2025-08-15', 571.00, 21000.00, 9000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', NULL),
-- Multiple loans same customer (legitimate - different types)
('LN026', 'C029', 'BR006', 'E027', 'Mortgage', 420000.00, 3.50, 360, '2021-02-01', '2051-02-01', 1886.00, 38000.00, 382000.00, 'Active', 'USD', 'Property', 0, 'Yes', 'Business owner mortgage'),
('LN027', 'C029', 'BR006', 'E027', 'Business', 200000.00, 5.50, 84, '2021-06-15', '2028-06-15', 3176.00, 62000.00, 138000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', 'Business expansion loan'),
('LN028', 'C033', 'BR010', 'E040', 'Mortgage', 580000.00, 3.25, 360, '2022-03-01', '2052-03-01', 2527.00, 42000.00, 538000.00, 'Active', 'USD', 'Property', 0, 'Yes', 'High value mortgage'),
('LN029', 'C033', 'BR010', 'E040', 'Business', 350000.00, 5.25, 84, '2022-08-01', '2029-08-01', 5603.00, 78000.00, 272000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', 'Business loan'),
('LN030', 'C043', 'BR018', 'E064', 'Business', 750000.00, 3.75, 120, '2023-10-01', '2033-10-01', 7502.00, 30000.00, 720000.00, 'Active', 'EUR', 'Business assets', 0, 'Yes', 'Large European business loan'),
-- Restructured loans
('LN031', 'C092', 'BR002', 'E007', 'Personal', 8000.00, 11.00, 48, '2020-09-01', '2024-09-01', 207.00, 3726.00, 4274.00, 'Restructured', 'USD', 'None', 5, 'Yes', 'Restructured due to COVID'),
('LN032', 'C094', 'BR004', 'E017', 'Auto', 18000.00, 7.50, 60, '2020-11-15', '2025-11-15', 360.00, 7200.00, 10800.00, 'Restructured', 'USD', 'Vehicle', 3, 'Yes', 'Restructured due to hardship'),
-- Loans with future start dates (invalid)
('LN033', 'C036', 'BR013', 'E049', 'Personal', 15000.00, 8.75, 36, '2025-04-01', '2028-04-01', 478.00, 0.00, 15000.00, 'Pending', 'USD', 'None', 0, 'Yes', 'Invalid future date'),
-- More loans
('LN034', 'C037', 'BR014', 'E052', 'Mortgage', 445000.00, 3.50, 360, '2022-06-01', '2052-06-01', 1997.00, 35000.00, 410000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN035', 'C039', 'BR016', 'E058', 'Business', 220000.00, 5.75, 84, '2022-10-01', '2029-10-01', 3507.00, 48000.00, 172000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
('LN036', 'C041', 'BR018', 'E064', 'Personal', 5000000.00, 2.25, 60, '2023-06-01', '2028-06-01', 88200.00, 1500000.00, 3500000.00, 'Active', 'JPY', 'None', 0, 'Yes', 'Japanese Yen personal loan'),
('LN037', 'C042', 'BR018', 'E064', 'Business', 2000000.00, 3.50, 84, '2023-08-01', '2030-08-01', 25800.00, 350000.00, 1650000.00, 'Active', 'AED', 'Business assets', 0, 'Yes', 'UAE business loan'),
('LN038', 'C047', 'BR002', 'E007', 'Mortgage', 380000.00, 3.75, 360, '2020-07-01', '2050-07-01', 1760.00, 48000.00, 332000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN039', 'C051', 'BR006', 'E027', 'Auto', 40000.00, 4.75, 60, '2021-03-15', '2026-03-15', 750.00, 27000.00, 13000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', NULL),
('LN040', 'C055', 'BR010', 'E040', 'Business', 175000.00, 5.50, 84, '2021-11-01', '2028-11-01', 2789.00, 55000.00, 120000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
-- Loans with out of range interest rates
('LN041', 'C059', 'BR014', 'E052', 'Personal', 20000.00, 45.00, 36, '2022-07-01', '2025-07-01', 762.00, 18000.00, 2000.00, 'Active', 'USD', 'None', 2, 'Yes', 'Invalid high interest rate'),
('LN042', 'C060', 'BR015', 'E055', 'Auto', 28000.00, -2.50, 60, '2022-09-15', '2027-09-15', 503.00, 15000.00, 13000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', 'Negative interest rate error'),
-- More loans
('LN043', 'C061', 'BR016', 'E058', 'Mortgage', 310000.00, 4.00, 360, '2022-11-01', '2052-11-01', 1481.00, 18000.00, 292000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN044', 'C063', 'BR018', 'E064', 'Personal', 30000.00, 6.50, 48, '2023-02-01', '2027-02-01', 712.00, 10000.00, 20000.00, 'Active', 'USD', 'None', 0, 'Yes', 'Russian customer USD loan'),
('LN045', 'C065', 'BR018', 'E065', 'Business', 1000000.00, 3.25, 120, '2023-06-01', '2033-06-01', 9763.00, 80000.00, 920000.00, 'Active', 'EUR', 'Business assets', 0, 'Yes', 'German business loan'),
('LN046', 'C070', 'BR018', 'E064', 'Personal', 1500000.00, 8.00, 36, '2024-04-01', '2027-04-01', 47020.00, 0.00, 1500000.00, 'Active', 'INR', 'None', 0, 'Yes', 'Indian Rupee loan'),
-- Loans for data imputation practice
('LN047', 'C071', 'BR001', 'E002', 'Auto', 27000.00, NULL, 60, '2020-06-01', '2025-06-01', NULL, 16000.00, 11000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', 'Missing rate - can impute from similar loans'),
('LN048', 'C072', 'BR002', 'E007', 'Personal', 14000.00, NULL, 36, '2020-08-15', '2023-08-15', NULL, 14000.00, 0.00, 'Paid', 'USD', 'None', 0, 'No', 'Missing rate - can impute'),
('LN049', 'C073', 'BR003', 'E012', 'Mortgage', 265000.00, NULL, 360, '2020-10-01', '2050-10-01', NULL, 18000.00, 247000.00, 'Active', 'USD', 'Property', 0, 'Yes', 'Missing rate - can impute'),
('LN050', 'C074', 'BR004', 'E017', 'Business', 120000.00, NULL, 84, '2020-12-15', '2027-12-15', NULL, 35000.00, 85000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', 'Missing rate - can impute');









INSERT INTO employees VALUES
('E101', 'BR001', 'Nathan', 'Ford', 'Nathan Ford', 'Male', '1988-06-15', '2016-04-01', 'Credit Analyst', 'Analytics', 69000.00, '212-555-1101', 'nathan.ford@bank.com', 'E001', 'Yes', 4, 7, 'Bachelor', NULL),
('E102', 'BR002', 'OLIVIA', 'parks', 'OLIVIA parks', 'f', '1993/18/07', '2021-05-15', 'Teller', 'Operations', 42500.00, '(718)555-1102', 'olivia.parks@bank.com', 'E006', 'Y', 2, 2, 'Associate', 'Messy data'),
('E103', 'BR003', 'peter', 'SANTOS', 'peter SANTOS', 'M', '1987-02-28', '2015-08-01', 'Loan Officer', 'Loans', 64000.00, '2135551103', 'peter.santos@bank.com', 'E011', 'Yes', 3, 8, 'Bachelor', 'Messy name'),
('E104', 'BR004', 'QUINN', 'BARNES', 'QUINN BARNES', 'Female', '1991-10-14', '2019-02-15', 'Financial Advisor', 'Advisory', 70500.00, '312-555-1104', 'quinn.barnes@bank.com', 'E016', 'Yes', 3, 4, 'Master', 'Messy name'),
('E105', 'BR005', 'rachel', 'COLEMAN', 'rachel COLEMAN', 'f', '1994/22/03', '2022-04-01', 'Teller', 'Operations', 43000.00, '(713)555-1105', 'rachel.coleman@bank.com', 'E021', 'Y', 2, 1, 'Associate', 'Messy data'),
('E106', 'BR006', 'STEVEN', 'brooks', 'STEVEN brooks', 'M', '1986-08-19', '2014-11-15', 'Loan Officer', 'Loans', 63500.00, '6025551106', 'steven.brooks@bank.com', 'E026', 'YES', 3, 9, 'Bachelor', 'Messy name'),
('E107', 'BR007', 'tina', 'HAYES', 'tina HAYES', 'Female', '1992-05-07', '2020-08-01', 'Credit Analyst', 'Analytics', 67000.00, '215-555-1107', 'tina.hayes@bank.com', 'E030', 'Yes', 3, 3, 'Bachelor', 'Messy name'),
('E108', 'BR008', 'ULYSSES', 'price', 'ULYSSES price', 'M', '1989/10/11', '2017-03-15', 'Financial Advisor', 'Advisory', 71000.00, '(210)555-1108', 'ulysses.price@bank.com', 'E033', 'Y', 3, 6, 'Master', 'Messy data'),
('E109', 'BR009', 'vera', 'JENKINS', 'vera JENKINS', 'f', '1995-01-25', '2022-07-01', 'Teller', 'Operations', 41500.00, '6195551109', 'vera.jenkins@bank.com', 'E036', 'Yes', 2, 1, 'Associate', 'Messy name'),
('E110', 'BR010', 'WALTER', 'ross', 'WALTER ross', 'Male', '1983-09-03', '2013-06-15', 'Loan Officer', 'Loans', 65000.00, '214-555-1110', 'walter.ross@bank.com', 'E039', 'Yes', 4, 10, 'Bachelor', 'Messy name'),
('E111', 'BR011', 'xena', 'GRIFFIN', 'xena GRIFFIN', 'FEMALE', '1990/28/06', '2018-10-01', 'Senior Analyst', 'Analytics', 74000.00, '(305)555-1111', 'xena.griffin@bank.com', 'E042', 'Y', 4, 5, 'Master', 'Messy data'),
('E112', 'BR012', 'YALE', 'diaz', 'YALE diaz', 'M', '1988-04-16', '2016-01-15', 'Financial Advisor', 'Advisory', 72000.00, '2065551112', 'yale.diaz@bank.com', 'E045', 'YES', 3, 7, 'Master', 'Messy name'),
('E113', 'BR013', 'zoe', 'PATTERSON', 'zoe PATTERSON', 'f', '1994-12-09', '2022-08-15', 'Teller', 'Operations', 41000.00, '720-555-1113', 'zoe.patterson@bank.com', 'E048', 'Yes', 2, 1, 'Associate', 'Messy name'),
('E114', 'BR014', 'AARON', 'warren', 'AARON warren', 'Male', '1985-07-22', '2014-03-01', 'Credit Analyst', 'Analytics', 68000.00, '(617)555-1114', 'aaron.warren@bank.com', 'E051', 'Y', 3, 9, 'Bachelor', 'Messy data'),
('E115', 'BR015', 'bella', 'PERRY', 'bella PERRY', 'Female', '1993-03-18', '2021-06-15', 'Teller', 'Operations', 42000.00, '4045551115', 'bella.perry@bank.com', 'E054', 'Yes', 2, 2, 'Associate', 'Messy name'),
('E116', 'BR016', 'CARTER', 'james', 'CARTER james', 'M', '1991/15/08', '2019-11-01', 'Loan Officer', 'Loans', 62500.00, '612-555-1116', 'carter.james@bank.com', 'E057', 'YES', 3, 4, 'Bachelor', 'Messy data'),
('E117', 'BR017', 'diana', 'MORGAN', 'diana MORGAN', 'f', '1996-02-14', '2023-01-15', 'Teller', 'Operations', 40500.00, '(503)555-1117', 'diana.morgan@bank.com', 'E060', 'Y', 1, 1, 'Associate', 'Messy name'),
('E118', 'BR018', 'EDWARD', 'stone', 'EDWARD stone', 'Male', '1982-11-30', '2010-09-01', 'Senior Analyst', 'Analytics', 96000.00, '44-20-555-1118', 'edward.stone@bank.com', 'E063', 'Yes', 4, 13, 'Master', 'Messy name'),
('E119', 'BR019', 'fiona', 'WALSH', 'fiona WALSH', 'FEMALE', '1989/05/04', '2016-12-15', 'Loan Officer', 'Loans', 80000.00, '416-555-1119', 'fiona.walsh@bank.com', 'E066', 'Y', 3, 7, 'Bachelor', 'Messy data'),
('E120', 'BR020', 'GABRIEL', 'ramirez', 'GABRIEL ramirez', 'M', '1987-07-21', '2017-05-01', 'Senior Analyst', 'Analytics', 83000.00, '52-55-555-1120', 'gabriel.ramirez@bank.com', 'E069', 'Yes', 3, 7, 'Master', 'Messy name'),
-- More employees with performance issues
('E121', 'BR001', 'Hannah', 'Cruz', 'Hannah Cruz', 'Female', '1990-04-12', '2018-07-15', 'Financial Advisor', 'Advisory', 71500.00, '212-555-1121', 'hannah.cruz@bank.com', 'E001', 'Yes', 2, 5, 'Master', 'Low performer'),
('E122', 'BR002', 'IAN', 'butler', 'IAN butler', 'M', '1993/20/09', '2021-10-01', 'Teller', 'Operations', 43000.00, '(718)555-1122', 'ian.butler@bank.com', 'E006', 'Y', 1, 2, 'Associate', 'Messy data'),
('E123', 'BR003', 'julia', 'PRICE', 'julia PRICE', 'f', '1988-01-17', '2015-04-15', 'Loan Officer', 'Loans', 64500.00, '2135551123', 'julia.price@bank.com', 'E011', 'YES', 3, 8, 'Bachelor', 'Messy name'),
('E124', 'BR004', 'KEVIN', 'REED', 'KEVIN REED', 'Male', '1985-06-08', '2013-09-01', 'Senior Analyst', 'Analytics', 75000.00, '312-555-1124', 'kevin.reed@bank.com', 'E016', 'Yes', 4, 10, 'Master', 'Messy name'),
('E125', 'BR005', 'laura', 'SIMMONS', 'laura SIMMONS', 'Female', '1994-11-25', '2022-01-15', 'Teller', 'Operations', 42500.00, '713-555-1125', 'laura.simmons@bank.com', 'E021', 'Yes', 2, 1, 'Associate', 'Messy name'),
('E126', 'BR006', 'MARCUS', 'foster', 'MARCUS foster', 'M', '1987/15/02', '2015-06-01', 'Financial Advisor', 'Advisory', 70000.00, '(602)555-1126', 'marcus.foster@bank.com', 'E026', 'Y', 3, 8, 'Master', 'Messy data'),
('E127', 'BR007', 'nina', 'BELL', 'nina BELL', 'f', '1992-08-04', '2020-03-15', 'Credit Analyst', 'Analytics', 67500.00, '2155551127', 'nina.bell@bank.com', 'E030', 'Yes', 3, 3, 'Bachelor', 'Messy name'),
('E128', 'BR008', 'OSCAR', 'henderson', 'OSCAR henderson', 'Male', '1989-03-22', '2017-08-01', 'Loan Officer', 'Loans', 63000.00, '210-555-1128', 'oscar.henderson@bank.com', 'E033', 'Yes', 3, 6, 'Bachelor', 'Messy name'),
('E129', 'BR009', 'paige', 'POWELL', 'paige POWELL', 'FEMALE', '1995/10/06', '2022-11-01', 'Teller', 'Operations', 41000.00, '(619)555-1129', 'paige.powell@bank.com', 'E036', 'Y', 2, 1, 'Associate', 'Messy data'),
('E130', 'BR010', 'QUINN', 'long', 'QUINN long', 'M', '1983-12-19', '2013-03-15', 'Senior Analyst', 'Analytics', 75500.00, '2145551130', 'quinn.long@bank.com', 'E039', 'YES', 4, 10, 'Master', 'Messy name'),
-- Negative salary employees
('E131', 'BR011', 'Rita', 'Evans', 'Rita Evans', 'Female', '1991-07-31', '2019-05-01', 'Financial Advisor', 'Advisory', -70000.00, '305-555-1131', 'rita.evans@bank.com', 'E042', 'Yes', 3, 4, 'Master', 'Negative salary error'),
('E132', 'BR012', 'SEAN', 'cox', 'SEAN cox', 'M', '1988/25/08', '2016-10-15', 'Loan Officer', 'Loans', 64000.00, '(206)555-1132', 'sean.cox@bank.com', 'E045', 'Y', 3, 7, 'Bachelor', 'Messy data'),
('E133', 'BR013', 'tara', 'FOSTER', 'tara FOSTER', 'f', '1994-04-13', '2022-05-01', 'Teller', 'Operations', 41500.00, '7205551133', 'tara.foster@bank.com', 'E048', 'Yes', 2, 1, 'Associate', 'Messy name'),
('E134', 'BR014', 'URIAH', 'sanders', 'URIAH sanders', 'Male', '1986-09-07', '2014-12-15', 'Credit Analyst', 'Analytics', 68500.00, '617-555-1134', 'uriah.sanders@bank.com', 'E051', 'Yes', 3, 9, 'Bachelor', 'Messy name'),
('E135', 'BR015', 'victoria', 'HAYES', 'victoria HAYES', 'FEMALE', '1993/18/01', '2021-08-01', 'Teller', 'Operations', 42000.00, '(404)555-1135', 'victoria.hayes@bank.com', 'E054', 'Y', 2, 2, 'Associate', 'Messy data'),
('E136', 'BR016', 'WILLIAM', 'gray', 'WILLIAM gray', 'M', '1990-06-26', '2018-03-15', 'Loan Officer', 'Loans', 63000.00, '6125551136', 'william.gray@bank.com', 'E057', 'YES', 3, 5, 'Bachelor', 'Messy name'),
('E137', 'BR017', 'xena', 'MURPHY', 'xena MURPHY', 'f', '1996-11-14', '2023-03-01', 'Teller', 'Operations', 40000.00, '503-555-1137', 'xena.murphy@bank.com', 'E060', 'Yes', 1, 1, 'Associate', 'Messy name'),
('E138', 'BR018', 'YASMIN', 'ali', 'YASMIN ali', 'Female', '1985-02-28', '2013-04-15', 'Senior Analyst', 'Analytics', 94000.00, '44-20-555-1138', 'yasmin.ali@bank.com', 'E063', 'Y', 4, 10, 'Master', 'Messy data'),
('E139', 'BR019', 'zachary', 'CHEN', 'zachary CHEN', 'M', '1991/22/07', '2019-09-01', 'Financial Advisor', 'Advisory', 87000.00, '416-555-1139', 'zachary.chen@bank.com', 'E066', 'Yes', 3, 4, 'Master', 'Messy data'),
('E140', 'BR020', 'AMELIA', 'torres', 'AMELIA torres', 'f', '1989-05-11', '2018-01-15', 'Loan Officer', 'Loans', 77000.00, '52-55-555-1140', 'amelia.torres@bank.com', 'E069', 'YES', 3, 6, 'Bachelor', 'Messy name'),
('E141', 'BR001', 'Blake', 'Mason', 'Blake Mason', 'Male', '1992-03-17', '2020-09-01', 'Teller', 'Operations', 43500.00, '212-555-1141', 'blake.mason@bank.com', 'E001', 'Yes', 3, 3, 'Associate', NULL),
('E142', 'BR002', 'CLAIRE', 'hunt', 'CLAIRE hunt', 'FEMALE', '1994/05/10', '2022-02-15', 'Teller', 'Operations', 42000.00, '(718)555-1142', 'claire.hunt@bank.com', 'E006', 'Y', 2, 1, 'Associate', 'Messy data'),
('E143', 'BR003', 'drew', 'WARD', 'drew WARD', 'M', '1986-08-23', '2014-07-01', 'Financial Advisor', 'Advisory', 71000.00, '2135551143', 'drew.ward@bank.com', 'E011', 'Yes', 3, 9, 'Master', 'Messy name'),
('E144', 'BR004', 'ELENA', 'cox', 'ELENA cox', 'f', '1993-01-29', '2021-04-15', 'Credit Analyst', 'Analytics', 67000.00, '312-555-1144', 'elena.cox@bank.com', 'E016', 'YES', 3, 2, 'Bachelor', 'Messy name'),
('E145', 'BR005', 'finn', 'BROOKS', 'finn BROOKS', 'Male', '1989-07-06', '2017-10-01', 'Loan Officer', 'Loans', 64000.00, '713-555-1145', 'finn.brooks@bank.com', 'E021', 'Yes', 3, 6, 'Bachelor', 'Messy name'),
('E146', 'BR006', 'GRACE', 'james', 'GRACE james', 'Female', '1995/28/04', '2022-09-15', 'Teller', 'Operations', 41500.00, '(602)555-1146', 'grace.james@bank.com', 'E026', 'Y', 2, 1, 'Associate', 'Messy data'),
('E147', 'BR007', 'henry', 'KELLY', 'henry KELLY', 'M', '1990-12-15', '2018-05-01', 'Senior Analyst', 'Analytics', 74500.00, '2155551147', 'henry.kelly@bank.com', 'E030', 'Yes', 4, 5, 'Master', 'Messy name'),
('E148', 'BR008', 'IRIS', 'watson', 'IRIS watson', 'f', '1987-04-02', '2015-11-15', 'Financial Advisor', 'Advisory', 70500.00, '210-555-1148', 'iris.watson@bank.com', 'E033', 'YES', 3, 8, 'Master', 'Messy name'),
('E149', 'BR009', 'jake', 'MORRIS', 'jake MORRIS', 'Male', '1993-09-18', '2021-01-15', 'Teller', 'Operations', 42000.00, '(619)555-1149', 'jake.morris@bank.com', 'E036', 'Y', 2, 2, 'Associate', 'Messy name'),
('E150', 'BR010', 'KATE', 'russell', 'KATE russell', 'FEMALE', '1991/15/11', '2019-06-01', 'Loan Officer', 'Loans', 63500.00, '2145551150', 'kate.russell@bank.com', 'E039', 'Yes', 3, 4, 'Bachelor', 'Messy data');
 
-- ============================================================
-- ADDITIONAL CUSTOMERS (bringing total to ~500)
-- ============================================================
INSERT INTO customers VALUES
('C102', 'kenneth', 'PRICE', 'kenneth PRICE', 'M', '1980-05-14', '212-555-2102', 'kenneth.price@gmail.com', '133 Park Ave S', 'New York', 'NY', '10010', 'USA', 'Employed', 88000.00, 726, 'Married', 'American', 'Yes', 'Yes', 'BR001', '2020-06-15', 'Messy name'),
('C103', 'LINDA', 'watson', 'LINDA watson', 'f', '1993/08/09', '(718)555-2103', 'linda.watson@gmail.com', '466 DeKalb Ave', 'Brooklyn', 'NY', '11205', 'USA', 'Employed', 56000.00, 638, 'Single', 'American', 'Y', 'Yes', 'BR002', '2020-08-20', 'Messy data'),
('C104', 'mario', 'SANTOS', 'mario SANTOS', 'Male', '1984-02-19', '2135552104', 'mario.santos@gmail.com', '799 Melrose Ave', 'Los Angeles', 'CA', '90046', 'USA', 'Self-Employed', 105000.00, 752, 'Married', 'American', 'Yes', 'Yes', 'BR003', '2020-10-10', 'Messy name'),
('C105', 'NANCY', 'FORD', 'NANCY FORD', 'Female', '1991/22/11', '(312)555-2105', 'nancy.ford@gmail.com', '111 Wacker Dr', 'Chicago', 'IL', '60606', 'USA', 'Employed', 69000.00, 683, 'Single', 'American', 'Y', 'Y', 'BR004', '2020-12-15', 'Messy data'),
('C106', 'oliver', 'BROOKS', 'oliver BROOKS', 'M', '1979-08-27', '713-555-2106', 'oliver.brooks@gmail.com', '212 Westheimer', 'Houston', 'TX', '77006', 'USA', 'Employed', 81000.00, 715, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2021-02-20', 'Messy name'),
('C107', 'PATRICIA', 'james', 'PATRICIA james', 'f', '1988-06-04', '602-555-2107', 'patricia.james@gmail.com', '313 Scottsdale Rd', 'Scottsdale', 'AZ', '85251', 'USA', 'Employed', 74000.00, 697, 'Single', 'American', 'Yes', 'Y', 'BR006', '2021-04-15', 'Messy name'),
('C108', 'quinn', 'HENDERSON', 'quinn HENDERSON', 'Male', '1982-03-11', '(215)555-2108', 'quinn.henderson@gmail.com', '414 South St', 'Philadelphia', 'PA', '19147', 'USA', 'Self-Employed', 98000.00, 742, 'Married', 'American', 'Y', 'Yes', 'BR007', '2021-06-20', 'Messy name'),
('C109', 'RACHEL', 'SIMMONS', 'RACHEL SIMMONS', 'Female', '1994/28/07', '2105552109', 'rachel.simmons@gmail.com', '515 River Walk', 'San Antonio', 'TX', '78205', 'USA', 'Employed', 60000.00, 647, 'Single', 'American', 'Yes', 'Yes', 'BR008', '2021-08-25', 'Messy data'),
('C110', 'steven', 'JAMES', 'steven JAMES', 'M', '1985-11-28', '619-555-2110', 'steven.james@gmail.com', '616 Harbor Blvd', 'San Diego', 'CA', '92101', 'USA', 'Employed', 77000.00, 704, 'Married', 'American', 'Yes', 'Y', 'BR009', '2021-10-10', 'Messy name'),
('C111', 'TINA', 'LONG', 'TINA LONG', 'f', '1991-04-15', '(214)555-2111', 'tina.long@gmail.com', '716 Lakewood Blvd', 'Dallas', 'TX', '75214', 'USA', 'Employed', 63000.00, 660, 'Single', 'American', 'Y', 'Yes', 'BR010', '2021-12-15', 'Messy name'),
('C112', 'ursula', 'GONZALEZ', 'ursula GONZALEZ', 'Female', '1980-09-03', '305-555-2112', 'ursula.gonzalez@gmail.com', '815 South Beach Dr', 'Miami', 'fl', '33139', 'USA', 'Self-Employed', 113000.00, 757, 'Married', 'American', 'Yes', 'Yes', 'BR011', '2022-02-20', 'Messy name and state'),
('C113', 'VICTOR', 'WRIGHT', 'VICTOR WRIGHT', 'M', '1993/08/10', '206-555-2113', 'victor.wright@gmail.com', '916 Queen Anne', 'Seattle', 'WA', '98109', 'USA', 'Employed', 67000.00, 676, 'Single', 'American', 'Yes', 'Y', 'BR012', '2022-04-15', 'Messy data'),
('C114', 'wendy', 'FORD', 'wendy FORD', 'f', '1987-07-20', '720-555-2114', 'wendy.ford@gmail.com', '1017 Pearl St', 'Boulder', 'CO', '80302', 'USA', 'Employed', 72000.00, 691, 'Single', 'American', 'Y', 'Yes', 'BR013', '2022-06-10', 'Messy name'),
('C115', 'XAVIER', 'MORGAN', 'XAVIER MORGAN', 'Male', '1978-04-09', '(617)555-2115', 'xavier.morgan@gmail.com', '1116 Newbury St', 'Boston', 'mA', '02116', 'USA', 'Employed', 90000.00, 725, 'Married', 'American', 'Yes', 'Yes', 'BR014', '2022-08-25', 'Messy state'),
('C116', 'yolanda', 'HILL', 'yolanda HILL', 'Female', '1992-12-05', '404-555-2116', 'yolanda.hill@gmail.com', '1217 Midtown Dr', 'Atlanta', 'GA', '30308', 'USA', 'Employed', 62000.00, 655, 'Single', 'American', 'Yes', 'Y', 'BR015', '2022-10-15', 'Messy name'),
('C117', 'ZACHARY', 'WARD', 'ZACHARY WARD', 'M', '1984-01-28', '612-555-2117', 'zachary.ward@gmail.com', '1318 Hennepin', 'Minneapolis', 'MN', '55403', 'USA', 'Self-Employed', 95000.00, 738, 'Married', 'American', 'Y', 'Yes', 'BR016', '2022-12-20', 'Messy name'),
('C118', 'amber', 'BROOKS', 'amber BROOKS', 'f', '1993/15/03', '(503)555-2118', 'amber.brooks@gmail.com', '1419 NW 23rd', 'Portland', 'OR', '97210', 'USA', 'Employed', 65000.00, 670, 'Single', 'American', 'Yes', 'Yes', 'BR017', '2023-02-10', 'Messy data'),
('C119', 'BRETT', 'SCOTT', 'BRETT SCOTT', 'Male', '1981-08-22', '44-20-555-2119', 'brett.scott@gmail.com', '119 King St', 'London', 'ENG', 'WC2N 5EA', 'united kingdom', 'Employed', 108000.00, 749, 'Married', 'British', 'Yes', 'Y', 'BR018', '2023-04-15', 'Messy country'),
('C120', 'carla', 'CHEN', 'carla CHEN', 'Female', '1989-05-30', '86-21-555-2120', 'carla.chen@gmail.com', '120 Nanjing Rd', 'Shanghai', 'SH', '200001', 'China', 'Employed', 89000.00, 718, 'Single', 'Chinese', 'Yes', 'Yes', 'BR018', '2023-06-20', 'Chinese customer'),
('C121', 'DAVID', 'taylor', 'DAVID taylor', 'M', '1986-11-17', '416-555-2121', 'david.taylor@gmail.com', '121 Bay St', 'Toronto', 'ON', 'M5J 2T3', 'canada', 'Self-Employed', 120000.00, 755, 'Married', 'Canadian', 'Yes', 'Yes', 'BR019', '2023-08-10', 'Messy country'),
('C122', 'elena', 'GARCIA', 'elena GARCIA', 'f', '1991/20/07', '52-55-555-2122', 'elena.garcia@gmail.com', '122 Reforma', 'Mexico City', 'CDMX', '06600', 'MEXICO', 'Employed', 76000.00, 681, 'Single', 'Mexican', 'Y', 'Yes', 'BR020', '2023-10-15', 'Messy data and country'),
('C123', 'FRANK', 'MILLER', 'FRANK MILLER', 'Male', '1977-03-14', '212-555-2123', 'frank.miller@gmail.com', '135 W 50th St', 'New York', 'NY', '10020', 'USA', 'Employed', 92000.00, 734, 'Married', 'American', 'Yes', 'Yes', 'BR001', '2020-07-20', 'Messy name'),
('C124', 'georgia', 'PRICE', 'georgia PRICE', 'Female', '1994-10-08', '(718)555-2124', 'georgia.price@gmail.com', '468 Nassau Ave', 'Brooklyn', 'NY', '11222', 'USA', 'Employed', 57000.00, 637, 'Single', 'American', 'Y', 'Y', 'BR002', '2020-09-15', 'Messy name'),
('C125', 'HARRY', 'BELL', 'HARRY BELL', 'M', '1983-06-25', '2135552125', 'harry.bell@gmail.com', '801 Sunset Blvd', 'Los Angeles', 'CA', '90046', 'USA', 'Self-Employed', 103000.00, 751, 'Married', 'American', 'Yes', 'Yes', 'BR003', '2020-11-10', 'Messy name'),
('C126', 'iris', 'HENDERSON', 'iris HENDERSON', 'f', '1990/12/04', '(312)555-2126', 'iris.henderson@gmail.com', '113 Clark St', 'Chicago', 'IL', '60610', 'USA', 'Employed', 69000.00, 682, 'Single', 'American', 'Y', 'Y', 'BR004', '2021-01-20', 'Messy data'),
('C127', 'JACK', 'WATSON', 'JACK WATSON', 'Male', '1978-01-19', '713-555-2127', 'jack.watson@gmail.com', '214 Richmond Ave', 'Houston', 'TX', '77006', 'USA', 'Employed', 85000.00, 721, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2021-03-15', 'Messy name'),
('C128', 'karen', 'BROOKS', 'karen BROOKS', 'Female', '1988-08-14', '602-555-2128', 'karen.brooks@gmail.com', '315 Thomas Rd', 'Phoenix', 'AZ', '85013', 'USA', 'Employed', 74000.00, 697, 'Single', 'American', 'Yes', 'Y', 'BR006', '2021-05-20', 'Messy name'),
('C129', 'LIAM', 'KELLY', 'LIAM KELLY', 'M', '1982-04-21', '(215)555-2129', 'liam.kelly@gmail.com', '416 Pine St', 'Philadelphia', 'PA', '19103', 'USA', 'Employed', 81000.00, 713, 'Married', 'American', 'Y', 'Yes', 'BR007', '2021-07-25', 'Messy name'),
('C130', 'maya', 'TORRES', 'maya TORRES', 'f', '1994/18/11', '2105552130', 'maya.torres@gmail.com', '517 Commerce St', 'San Antonio', 'TX', '78205', 'USA', 'Employed', 63000.00, 658, 'Single', 'American', 'Yes', 'Yes', 'BR008', '2021-09-10', 'Messy data'),
('C131', 'NOAH', 'PETERSON', 'NOAH PETERSON', 'Male', '1986-07-09', '619-555-2131', 'noah.peterson@gmail.com', '618 Pacific Hwy', 'San Diego', 'CA', '92110', 'USA', 'Employed', 78000.00, 706, 'Single', 'American', 'Yes', 'Y', 'BR009', '2021-11-25', 'Messy name'),
('C132', 'olivia', 'LONG', 'olivia LONG', 'Female', '1993-02-26', '(214)555-2132', 'olivia.long@gmail.com', '718 Oak Lawn', 'Dallas', 'TX', '75219', 'USA', 'Employed', 64000.00, 664, 'Single', 'American', 'Y', 'Yes', 'BR010', '2022-01-15', 'Messy name'),
('C133', 'PETER', 'GONZALEZ', 'PETER GONZALEZ', 'M', '1980-10-13', '305-555-2133', 'peter.gonzalez@gmail.com', '817 South Beach', 'Miami', 'FL', '33139', 'USA', 'Self-Employed', 114000.00, 758, 'Married', 'American', 'Yes', 'Yes', 'BR011', '2022-03-20', 'Messy name'),
('C134', 'quinn', 'WRIGHT', 'quinn WRIGHT', 'f', '1993/25/09', '206-555-2134', 'quinn.wright@gmail.com', '918 Queen Anne', 'Seattle', 'WA', '98109', 'USA', 'Employed', 67000.00, 675, 'Single', 'American', 'Yes', 'Y', 'BR012', '2022-05-10', 'Messy data'),
('C135', 'RYAN', 'FORD', 'RYAN FORD', 'Male', '1987-04-30', '720-555-2135', 'ryan.ford@gmail.com', '1019 Pearl St', 'Boulder', 'CO', '80302', 'USA', 'Employed', 72000.00, 691, 'Single', 'American', 'Y', 'Yes', 'BR013', '2022-07-15', 'Messy name'),
('C136', 'sara', 'MORGAN', 'sara MORGAN', 'Female', '1978-11-16', '(617)555-2136', 'sara.morgan@gmail.com', '1118 Newbury St', 'Boston', 'mA', '02116', 'USA', 'Employed', 91000.00, 726, 'Married', 'American', 'Yes', 'Yes', 'BR014', '2022-09-20', 'Messy state'),
('C137', 'THOMAS', 'HILL', 'THOMAS HILL', 'M', '1992-08-23', '404-555-2137', 'thomas.hill@gmail.com', '1219 Midtown Dr', 'Atlanta', 'GA', '30308', 'USA', 'Employed', 63000.00, 656, 'Single', 'American', 'Yes', 'Y', 'BR015', '2022-11-10', 'Messy name'),
('C138', 'uma', 'WARD', 'uma WARD', 'f', '1984-03-07', '612-555-2138', 'uma.ward@gmail.com', '1320 Hennepin', 'Minneapolis', 'MN', '55403', 'USA', 'Self-Employed', 96000.00, 739, 'Married', 'American', 'Y', 'Yes', 'BR016', '2023-01-15', 'Messy name'),
('C139', 'VERA', 'BROOKS', 'VERA BROOKS', 'Female', '1993/05/01', '(503)555-2139', 'vera.brooks@gmail.com', '1421 NW 23rd', 'Portland', 'OR', '97210', 'USA', 'Employed', 66000.00, 671, 'Single', 'American', 'Yes', 'Yes', 'BR017', '2023-03-20', 'Messy data'),
('C140', 'walter', 'SCOTT', 'walter SCOTT', 'M', '1981-09-18', '44-20-555-2140', 'walter.scott@gmail.com', '140 Kensington', 'London', 'ENG', 'W8 4SJ', 'UK', 'Employed', 106000.00, 749, 'Married', 'British', 'Yes', 'Y', 'BR018', '2023-05-10', 'UK customer'),
('C141', 'XENA', 'CHEN', 'XENA CHEN', 'Female', '1989-06-25', '86-10-555-2141', 'xena.chen@gmail.com', '141 Wangfujing', 'Beijing', 'BJ', '100006', 'china', 'Employed', 90000.00, 719, 'Single', 'Chinese', 'Yes', 'Yes', 'BR018', '2023-07-15', 'Messy country'),
('C142', 'yale', 'TAYLOR', 'yale TAYLOR', 'M', '1986-12-03', '416-555-2142', 'yale.taylor@gmail.com', '142 Yonge St', 'Toronto', 'ON', 'M5C 1W4', 'Canada', 'Self-Employed', 119000.00, 755, 'Married', 'Canadian', 'Y', 'Yes', 'BR019', '2023-09-20', 'Messy name'),
('C143', 'ZARA', 'GARCIA', 'ZARA GARCIA', 'f', '1991/28/08', '52-55-555-2143', 'zara.garcia@gmail.com', '143 Reforma', 'Mexico City', 'CDMX', '06600', 'mexico', 'Employed', 77000.00, 682, 'Single', 'Mexican', 'Yes', 'Yes', 'BR020', '2023-11-10', 'Messy data and country'),
-- More customers with credit issues
('C144', 'adam', 'PRICE', 'adam PRICE', 'Male', '1990/18/06', '212-555-2144', 'adam.price@gmail.com', '137 Madison Ave', 'New York', 'NY', '10016', 'USA', 'Unemployed', 0.00, 515, 'Single', 'American', 'Y', 'Yes', 'BR001', '2020-08-15', 'Low credit score'),
('C145', 'BETTY', 'ALLEN', 'BETTY ALLEN', 'f', '1984-12-06', '(718)555-2145', 'betty.allen2@gmail.com', '470 Nostrand Ave', 'Brooklyn', 'NY', '11216', 'USA', 'Employed', 49000.00, 592, 'Single', 'American', 'Yes', 'Y', 'BR002', '2020-10-20', 'Below average credit'),
('C146', 'carl', 'RIVERA', 'carl RIVERA', 'M', '1977-04-25', '2135552146', 'carl.rivera2@gmail.com', '803 Figueroa St', 'Los Angeles', 'CA', '90017', 'USA', 'Employed', 77000.00, 716, 'Married', 'American', 'Yes', 'Yes', 'BR003', '2020-12-10', 'Messy name'),
('C147', 'DONNA', 'HILL', 'DONNA HILL', 'Female', '1988/22/08', '(312)555-2147', 'donna.hill2@gmail.com', '115 Clark St', 'Chicago', 'IL', '60610', 'USA', 'Employed', 68000.00, 680, 'Single', 'American', 'Y', 'Y', 'BR004', '2021-02-15', 'Messy data'),
('C148', 'eric', 'WATSON', 'eric WATSON', 'M', '1982-08-19', '713-555-2148', 'eric.watson2@gmail.com', '216 Westheimer', 'Houston', 'TX', '77006', 'USA', 'Self-Employed', 102000.00, 750, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2021-04-20', 'Messy name'),
('C149', 'FRANCES', 'KELLY', 'FRANCES KELLY', 'f', '1995-05-13', '602-555-2149', 'frances.kelly2@gmail.com', '317 Thomas Rd', 'Phoenix', 'AZ', '85013', 'USA', 'Employed', 52000.00, 626, 'Single', 'American', 'Yes', 'Y', 'BR006', '2021-06-25', 'Messy name'),
('C150', 'gary', 'HILL', 'gary HILL', 'Male', '1979-01-09', '(215)555-2150', 'gary.hill2@gmail.com', '418 Pine St', 'Philadelphia', 'PA', '19103', 'USA', 'Employed', 81000.00, 713, 'Married', 'American', 'Y', 'Yes', 'BR007', '2021-08-15', 'Messy name'),
-- Special characters in names (new challenge)
('C151', 'J@mes', 'W!lson', 'J@mes W!lson', 'Male', '1985-04-15', '212-555-2151', 'james.w2@gmail.com', '139 5th Ave', 'New York', 'NY', '10010', 'USA', 'Employed', 88000.00, 727, 'Married', 'American', 'Yes', 'Yes', 'BR001', '2020-09-01', 'Special chars in name'),
('C152', 'M@ria', 'G#rcia', 'M@ria G#rcia', 'Female', '1990-08-22', '718-555-2152', 'maria.g2@gmail.com', '470 Atlantic Ave', 'Brooklyn', 'NY', '11201', 'USA', 'Employed', 66000.00, 681, 'Single', 'American', 'Y', 'Yes', 'BR002', '2020-11-15', 'Special chars in name'),
('C153', 'R0bert', 'M@rtinez', 'R0bert M@rtinez', 'Male', '1975/22/09', '213-555-2153', 'robert.m2@gmail.com', '407 Cedar Ct', 'Philadelphia', 'PA', '19101', 'USA', 'Employed', 81000.00, 711, 'Married', 'American', 'Yes', 'Yes', 'BR007', '2021-02-10', 'Special chars in name'),
('C154', 'P@tricia', 'J@ckson', 'P@tricia J@ckson', 'Female', '1993-05-18', '210-555-2154', 'patricia.j2@gmail.com', '510 Commerce St', 'San Antonio', 'TX', '78205', 'USA', 'Employed', 63000.00, 668, 'Single', 'American', 'Yes', 'Y', 'BR008', '2021-06-10', 'Special chars in name'),
('C155', 'W!lliam', 'Th0mas', 'W!lliam Th0mas', 'Male', '1980-01-25', '619-555-2155', 'william.t2@gmail.com', '609 Harbor Dr', 'San Diego', 'CA', '92101', 'USA', 'Employed', 91000.00, 731, 'Married', 'American', 'Y', 'Yes', 'BR009', '2021-08-15', 'Special chars in name'),
-- Customers with invalid zip codes
('C156', 'hannah', 'BROWN', 'hannah BROWN', 'f', '1988-07-07', '305-555-2156', 'hannah.brown@gmail.com', '820 Collins Ave', 'Miami Beach', 'FL', '3313', 'USA', 'Employed', 64000.00, 663, 'Single', 'American', 'Yes', 'Yes', 'BR011', '2022-01-10', 'Invalid zip - too short'),
('C157', 'IAN', 'FOSTER', 'IAN FOSTER', 'Male', '1982-12-14', '206-555-2157', 'ian.foster@gmail.com', '922 Pike Place', 'Seattle', 'WA', '981011', 'USA', 'Employed', 87000.00, 722, 'Married', 'American', 'Y', 'Yes', 'BR012', '2022-03-15', 'Invalid zip - too long'),
('C158', 'julia', 'DAVIS', 'julia DAVIS', 'Female', '1994-04-29', '720-555-2158', 'julia.davis@gmail.com', '1021 Colfax Ave', 'Denver', 'CO', 'AB123', 'USA', 'Employed', 62000.00, 654, 'Single', 'American', 'Yes', 'Y', 'BR013', '2022-05-20', 'Invalid zip - has letters'),
-- More customers to reach 500
('C159', 'KEVIN', 'CLARK', 'KEVIN CLARK', 'M', '1985-09-12', '(617)555-2159', 'kevin.clark@gmail.com', '1120 Tremont St', 'Boston', 'mA', '02111', 'USA', 'Employed', 85000.00, 720, 'Married', 'American', 'Yes', 'Yes', 'BR014', '2022-07-10', 'Messy state'),
('C160', 'laura', 'CAMPBELL', 'laura CAMPBELL', 'f', '1991-10-27', '(404)555-2160', 'laura.campbell@gmail.com', '1221 Peachtree Rd', 'Atlanta', 'GA', '30309', 'USA', 'Employed', 69000.00, 683, 'Single', 'American', 'Y', 'Yes', 'BR015', '2022-09-15', 'Messy name'),
('C161', 'MARK', 'BAKER', 'MARK BAKER', 'Male', '1980-05-05', '612-555-2161', 'mark.baker@gmail.com', '1322 Marquette', 'Minneapolis', 'MN', '55402', 'USA', 'Employed', 80000.00, 710, 'Married', 'American', 'Yes', 'Y', 'BR016', '2022-11-20', 'Messy name'),
('C162', 'nina', 'TURNER', 'nina TURNER', 'Female', '1993/22/10', '(503)555-2162', 'nina.turner@gmail.com', '1423 Burnside St', 'Portland', 'OR', '97209', 'USA', 'Employed', 66000.00, 672, 'Single', 'American', 'Yes', 'Yes', 'BR017', '2023-01-10', 'Messy data'),
('C163', 'OMAR', 'PETROV', 'OMAR PETROV', 'Male', '1981-07-19', '7-495-555-2163', 'omar.petrov@gmail.com', '163 Arbat St', 'Moscow', 'MOW', '119002', 'Russia', 'Employed', 79000.00, 699, 'Married', 'Russian', 'Yes', 'Yes', 'BR018', '2023-03-15', 'Russian customer'),
('C164', 'priya', 'LEE', 'priya LEE', 'Female', '1990-02-14', '82-2-555-2164', 'priya.lee@gmail.com', '164 Gangnam-daero', 'Seoul', 'SEL', '06000', 'South Korea', 'Employed', 83000.00, 715, 'Single', 'Korean', 'Y', 'Yes', 'BR018', '2023-05-20', 'Korean customer'),
('C165', 'QUINCY', 'MUELLER', 'QUINCY MUELLER', 'M', '1978-11-30', '49-89-555-2165', 'quincy.mueller@gmail.com', '165 Maximilianstr', 'Munich', 'BAY', '80539', 'Germany', 'Self-Employed', 126000.00, 759, 'Married', 'German', 'Yes', 'Yes', 'BR018', '2023-07-10', 'German customer'),
('C166', 'rosa', 'ROSSI', 'rosa ROSSI', 'f', '1987-03-25', '39-02-555-2166', 'rosa.rossi@gmail.com', '166 Via Monte', 'Milan', 'MI', '20121', 'Italy', 'Employed', 92000.00, 729, 'Single', 'Italian', 'Yes', 'Y', 'BR018', '2023-09-25', 'Italian customer'),
('C167', 'STEFAN', 'SANTOS', 'STEFAN SANTOS', 'Male', '1982-10-08', '55-11-555-2167', 'stefan.santos@gmail.com', '167 Brigadeiro', 'Sao Paulo', 'SP', '01310-200', 'brazil', 'Employed', 69000.00, 678, 'Married', 'Brazilian', 'Y', 'Yes', 'BR020', '2023-11-15', 'Messy country'),
('C168', 'tanya', 'KOWALSKI', 'tanya KOWALSKI', 'Female', '1994-02-17', '48-22-555-2168', 'tanya.kowalski@gmail.com', '168 Nowy Swiat', 'Warsaw', 'MZ', '00-001', 'Poland', 'Employed', 66000.00, 664, 'Single', 'Polish', 'Yes', 'Yes', 'BR018', '2024-01-10', 'Polish customer'),
('C169', 'UGO', 'HASSAN', 'UGO HASSAN', 'M', '1979-05-23', '20-2-555-2169', 'ugo.hassan@gmail.com', '169 Tahrir Sq', 'Cairo', 'CAI', '11511', 'Egypt', 'Self-Employed', 56000.00, 643, 'Married', 'Egyptian', 'Y', 'Yes', 'BR018', '2024-03-05', 'Egyptian customer'),
('C170', 'vera', 'SHARMA', 'vera SHARMA', 'Female', '1991-08-12', '91-22-555-2170', 'vera.sharma@gmail.com', '170 Marine Drive', 'Mumbai', 'MH', '400020', 'India', 'Employed', 78000.00, 700, 'Single', 'Indian', 'Yes', 'Yes', 'BR018', '2024-04-20', 'Indian customer'),
-- More US customers
('C171', 'WALTER', 'WOOD', 'WALTER WOOD', 'Male', '1986/22/02', '212-555-2171', 'walter.wood@gmail.com', '141 Park Ave', 'New York', 'NY', '10017', 'USA', 'Employed', 92000.00, 734, 'Married', 'American', 'Y', 'Yes', 'BR001', '2020-10-10', 'Messy data'),
('C172', 'xena', 'PRICE', 'xena PRICE', 'f', '1995-09-31', '(718)555-2172', 'xena.price@gmail.com', '472 Bedford Ave', 'Brooklyn', 'NY', '11211', 'USA', 'Employed', 56000.00, 633, 'Single', 'American', 'Yes', 'Y', 'BR002', '2020-12-25', 'Messy name'),
('C173', 'YALE', 'BELL', 'YALE BELL', 'M', '1983-01-03', '2135552173', 'yale.bell@gmail.com', '803 Melrose Ave', 'Los Angeles', 'CA', '90046', 'USA', 'Self-Employed', 104000.00, 752, 'Married', 'American', 'Yes', 'Yes', 'BR003', '2021-02-15', 'Messy name'),
('C174', 'zara', 'HENDERSON', 'zara HENDERSON', 'Female', '1990/15/10', '(312)555-2174', 'zara.henderson@gmail.com', '117 Michigan Ave', 'Chicago', 'il', '60603', 'USA', 'Employed', 70000.00, 683, 'Single', 'American', 'Y', 'Y', 'BR004', '2021-04-20', 'Messy data and state'),
('C175', 'AARON', 'WATSON', 'AARON WATSON', 'Male', '1977-10-15', '713-555-2175', 'aaron.watson@gmail.com', '218 Richmond', 'Houston', 'TX', '77006', 'USA', 'Employed', 85000.00, 721, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2021-06-10', 'Messy name'),
('C176', 'bella', 'BROOKS', 'bella BROOKS', 'f', '1988-06-22', '602-555-2176', 'bella.brooks@gmail.com', '319 Scottsdale', 'Scottsdale', 'AZ', '85251', 'USA', 'Employed', 75000.00, 698, 'Single', 'American', 'Yes', 'Y', 'BR006', '2021-08-25', 'Messy name'),
('C177', 'CARTER', 'KELLY', 'CARTER KELLY', 'M', '1982-12-29', '(215)555-2177', 'carter.kelly@gmail.com', '420 South St', 'Philadelphia', 'PA', '19147', 'USA', 'Self-Employed', 98000.00, 742, 'Married', 'American', 'Y', 'Yes', 'BR007', '2021-10-15', 'Messy name'),
('C178', 'diana', 'ROSS', 'diana ROSS', 'Female', '1994/15/07', '2105552178', 'diana.ross@gmail.com', '519 River Walk', 'San Antonio', 'TX', '78205', 'USA', 'Employed', 61000.00, 648, 'Single', 'American', 'Yes', 'Yes', 'BR008', '2021-12-20', 'Messy data'),
('C179', 'EVAN', 'JAMES', 'EVAN JAMES', 'M', '1985-05-16', '619-555-2179', 'evan.james@gmail.com', '620 Harbor Blvd', 'San Diego', 'CA', '92101', 'USA', 'Employed', 78000.00, 705, 'Married', 'American', 'Yes', 'Y', 'BR009', '2022-02-10', 'Messy name'),
('C180', 'faith', 'PRICE', 'faith PRICE', 'f', '1991-03-20', '(214)555-2180', 'faith.price@gmail.com', '720 Lakewood', 'Dallas', 'TX', '75214', 'USA', 'Employed', 64000.00, 660, 'Single', 'American', 'Y', 'Yes', 'BR010', '2022-04-15', 'Messy name'),
-- Additional international customers
('C181', 'George', 'Nakamura', 'George Nakamura', 'Male', '1983-05-05', '81-3-555-2181', 'george.nakamura@gmail.com', '2-2 Marunouchi', 'Tokyo', 'TKY', '100-0005', 'Japan', 'Employed', 99000.00, 743, 'Married', 'Japanese', 'Yes', 'Yes', 'BR018', '2023-06-01', 'Japanese customer'),
('C182', 'Hana', 'Al-Rashid', 'Hana Al-Rashid', 'Female', '1989-10-18', '971-4-555-2182', 'hana.alrashid@gmail.com', '42 Zayed Rd', 'Dubai', 'DXB', '00000', 'UAE', 'Employed', 116000.00, 749, 'Single', 'Emirati', 'Yes', 'Yes', 'BR018', '2023-08-15', 'UAE customer'),
('C183', 'Igor', 'Dubois', 'Igor Dubois', 'Male', '1976-01-21', '33-1-555-2183', 'igor.dubois@gmail.com', '44 Champs Elysees', 'Paris', 'IDF', '75008', 'France', 'Self-Employed', 133000.00, 763, 'Married', 'French', 'Yes', 'Yes', 'BR018', '2023-10-20', 'French customer'),
('C184', 'Julia', 'Silva', 'Julia Silva', 'Female', '1991-08-10', '55-11-555-2184', 'julia.silva@gmail.com', '46 Paulista Ave', 'Sao Paulo', 'SP', '01310-100', 'Brazil', 'Employed', 73000.00, 676, 'Single', 'Brazilian', 'Yes', 'Y', 'BR020', '2023-12-10', 'Brazilian customer'),
('C185', 'Kai', 'Zhang', 'Kai Zhang', 'Male', '1987-03-28', '86-10-555-2185', 'kai.zhang@gmail.com', '48 Wangfujing', 'Beijing', 'BJ', '100006', 'china', 'Employed', 90000.00, 709, 'Married', 'Chinese', 'Yes', 'Yes', 'BR018', '2024-02-15', 'Messy country'),
-- Final batch of US customers
('C186', 'GEORGE', 'FOSTER', 'GEORGE FOSTER', 'M', '1979/10/10', '212-555-2186', 'george.foster@gmail.com', '143 Park Ave', 'New York', 'NY', '10017', 'USA', 'Employed', 93000.00, 735, 'Married', 'American', 'Y', 'Yes', 'BR001', '2020-11-10', 'Messy data'),
('C187', 'helen', 'PRICE', 'helen PRICE', 'f', '1995-11-30', '(718)555-2187', 'helen.price@gmail.com', '474 Bedford Ave', 'Brooklyn', 'NY', '11211', 'USA', 'Employed', 57000.00, 634, 'Single', 'American', 'Yes', 'Y', 'BR002', '2021-01-15', 'Messy name'),
('C188', 'IAN', 'BELL', 'IAN BELL', 'Male', '1983-02-03', '2135552188', 'ian.bell@gmail.com', '805 Melrose Ave', 'Los Angeles', 'CA', '90046', 'USA', 'Self-Employed', 105000.00, 753, 'Married', 'American', 'Yes', 'Yes', 'BR003', '2021-03-20', 'Messy name'),
('C189', 'julia', 'HENDERSON', 'julia HENDERSON', 'Female', '1990/18/10', '(312)555-2189', 'julia.henderson@gmail.com', '119 Michigan Ave', 'Chicago', 'il', '60603', 'USA', 'Employed', 71000.00, 684, 'Single', 'American', 'Y', 'Y', 'BR004', '2021-05-25', 'Messy data and state'),
('C190', 'KYLE', 'WATSON', 'KYLE WATSON', 'M', '1977-11-15', '713-555-2190', 'kyle.watson@gmail.com', '220 Richmond Ave', 'Houston', 'TX', '77006', 'USA', 'Employed', 86000.00, 722, 'Married', 'American', 'Yes', 'Yes', 'BR005', '2021-07-10', 'Messy name'),
('C191', 'lily', 'BROOKS', 'lily BROOKS', 'f', '1988-07-22', '602-555-2191', 'lily.brooks@gmail.com', '321 Scottsdale', 'Scottsdale', 'AZ', '85251', 'USA', 'Employed', 76000.00, 699, 'Single', 'American', 'Yes', 'Y', 'BR006', '2021-09-25', 'Messy name'),
('C192', 'MIKE', 'KELLY', 'MIKE KELLY', 'Male', '1982-01-29', '(215)555-2192', 'mike.kelly@gmail.com', '422 South St', 'Philadelphia', 'PA', '19147', 'USA', 'Self-Employed', 99000.00, 743, 'Married', 'American', 'Y', 'Yes', 'BR007', '2021-11-15', 'Messy name'),
('C193', 'nina', 'ROSS', 'nina ROSS', 'Female', '1994/22/07', '2105552193', 'nina.ross@gmail.com', '521 River Walk', 'San Antonio', 'TX', '78205', 'USA', 'Employed', 62000.00, 649, 'Single', 'American', 'Yes', 'Yes', 'BR008', '2022-01-20', 'Messy data'),
('C194', 'OSCAR', 'JAMES', 'OSCAR JAMES', 'M', '1985-06-16', '619-555-2194', 'oscar.james@gmail.com', '622 Harbor Blvd', 'San Diego', 'CA', '92101', 'USA', 'Employed', 79000.00, 706, 'Married', 'American', 'Yes', 'Y', 'BR009', '2022-03-10', 'Messy name'),
('C195', 'paula', 'PRICE', 'paula PRICE', 'f', '1991-04-20', '(214)555-2195', 'paula.price@gmail.com', '722 Lakewood', 'Dallas', 'TX', '75214', 'USA', 'Employed', 65000.00, 661, 'Single', 'American', 'Y', 'Yes', 'BR010', '2022-05-15', 'Messy name'),
('C196', 'QUINN', 'GONZALEZ', 'QUINN GONZALEZ', 'Male', '1980-11-13', '305-555-2196', 'quinn.gonzalez@gmail.com', '819 South Beach', 'Miami', 'FL', '33139', 'USA', 'Self-Employed', 115000.00, 759, 'Married', 'American', 'Yes', 'Yes', 'BR011', '2022-07-20', 'Messy name'),
('C197', 'rachel', 'WRIGHT', 'rachel WRIGHT', 'f', '1993/28/09', '206-555-2197', 'rachel.wright@gmail.com', '920 Queen Anne', 'Seattle', 'WA', '98109', 'USA', 'Employed', 68000.00, 676, 'Single', 'American', 'Yes', 'Y', 'BR012', '2022-09-10', 'Messy data'),
('C198', 'SAMUEL', 'FORD', 'SAMUEL FORD', 'M', '1987-05-30', '720-555-2198', 'samuel.ford@gmail.com', '1021 Pearl St', 'Boulder', 'CO', '80302', 'USA', 'Employed', 73000.00, 692, 'Single', 'American', 'Y', 'Yes', 'BR013', '2022-11-15', 'Messy name'),
('C199', 'tina', 'MORGAN', 'tina MORGAN', 'Female', '1978-12-16', '(617)555-2199', 'tina.morgan@gmail.com', '1120 Newbury', 'Boston', 'mA', '02116', 'USA', 'Employed', 92000.00, 727, 'Married', 'American', 'Yes', 'Yes', 'BR014', '2023-01-20', 'Messy state'),
('C200', 'URSULA', 'HILL', 'URSULA HILL', 'f', '1992-09-23', '404-555-2200', 'ursula.hill@gmail.com', '1221 Midtown', 'Atlanta', 'GA', '30308', 'USA', 'Employed', 64000.00, 657, 'Single', 'American', 'Yes', 'Y', 'BR015', '2023-03-15', 'Messy name');
 
-- ============================================================
-- ADDITIONAL ACCOUNTS (bringing total to ~800)
-- ============================================================
INSERT INTO accounts VALUES
-- Accounts for new customers C102 to C200
('ACC101', 'C102', 'BR001', 'Checking', 'Active', '2020-06-15', NULL, 16500.00, 'USD', 0.01, 700.00, '2024-03-15', 'Yes', 'E101', NULL),
('ACC102', 'C102', 'BR001', 'Savings', 'Active', '2020-06-15', NULL, 48000.00, 'USD', 2.50, 0.00, '2024-03-10', 'Yes', 'E101', NULL),
('ACC103', 'C103', 'BR002', 'Checking', 'Active', '2020-08-20', NULL, 7800.00, 'USD', 0.01, 300.00, '2024-03-14', 'Y', 'E006', NULL),
('ACC104', 'C104', 'BR003', 'Checking', 'Active', '2020-10-10', NULL, 19500.00, 'USD', 0.01, 800.00, '2024-03-15', 'Yes', 'E103', NULL),
('ACC105', 'C104', 'BR003', 'Savings', 'Active', '2020-10-10', NULL, 58000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E103', NULL),
('ACC106', 'C104', 'BR003', 'Business', 'Active', '2021-02-01', NULL, 145000.00, 'USD', 0.50, 8000.00, '2024-03-15', 'Y', 'E103', 'Business account'),
('ACC107', 'C105', 'BR004', 'Checking', 'Active', '2020-12-15', NULL, 8200.00, 'USD', 0.01, 350.00, '2024-03-12', 'Yes', 'E104', NULL),
('ACC108', 'C106', 'BR005', 'Checking', 'Active', '2021-02-20', NULL, 14500.00, 'USD', 0.01, 600.00, '2024-03-14', 'Yes', 'E022', NULL),
('ACC109', 'C106', 'BR005', 'Savings', 'Active', '2021-02-20', NULL, 40000.00, 'USD', 2.50, 0.00, '2024-03-08', 'Y', 'E022', NULL),
('ACC110', 'C107', 'BR006', 'Checking', 'Active', '2021-04-15', NULL, 10500.00, 'USD', 0.01, 450.00, '2024-03-13', 'Yes', 'E106', NULL),
('ACC111', 'C108', 'BR007', 'Checking', 'Active', '2021-06-20', NULL, 18500.00, 'USD', 0.01, 800.00, '2024-03-15', 'Yes', 'E107', NULL),
('ACC112', 'C108', 'BR007', 'Savings', 'Active', '2021-06-20', NULL, 55000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E107', NULL),
('ACC113', 'C109', 'BR008', 'Checking', 'Active', '2021-08-25', NULL, 9000.00, 'USD', 0.01, 400.00, '2024-03-12', 'Yes', 'E108', NULL),
('ACC114', 'C110', 'BR009', 'Checking', 'Active', '2021-10-10', NULL, 14000.00, 'USD', 0.01, 600.00, '2024-03-14', 'Yes', 'E109', NULL),
('ACC115', 'C110', 'BR009', 'Savings', 'Active', '2021-10-10', NULL, 38000.00, 'USD', 2.50, 0.00, '2024-03-05', 'Y', 'E109', NULL),
('ACC116', 'C111', 'BR010', 'Checking', 'Active', '2021-12-15', NULL, 11000.00, 'USD', 0.01, 500.00, '2024-03-13', 'Yes', 'E110', NULL),
('ACC117', 'C112', 'BR011', 'Checking', 'Active', '2022-02-20', NULL, 21500.00, 'USD', 0.01, 1000.00, '2024-03-15', 'Yes', 'E111', NULL),
('ACC118', 'C112', 'BR011', 'Savings', 'Active', '2022-02-20', NULL, 72000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E111', NULL),
('ACC119', 'C113', 'BR012', 'Checking', 'Active', '2022-04-15', NULL, 13500.00, 'USD', 0.01, 600.00, '2024-03-12', 'Yes', 'E112', NULL),
('ACC120', 'C114', 'BR013', 'Checking', 'Active', '2022-06-10', NULL, 10500.00, 'USD', 0.01, 450.00, '2024-03-11', 'Yes', 'E113', NULL),
('ACC121', 'C115', 'BR014', 'Checking', 'Active', '2022-08-25', NULL, 17500.00, 'USD', 0.01, 800.00, '2024-03-14', 'Y', 'E114', NULL),
('ACC122', 'C115', 'BR014', 'Savings', 'Active', '2022-08-25', NULL, 52000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E114', NULL),
('ACC123', 'C116', 'BR015', 'Checking', 'Active', '2022-10-15', NULL, 9200.00, 'USD', 0.01, 400.00, '2024-03-13', 'Yes', 'E115', NULL),
('ACC124', 'C117', 'BR016', 'Checking', 'Active', '2022-12-20', NULL, 18000.00, 'USD', 0.01, 800.00, '2024-03-15', 'Yes', 'E116', NULL),
('ACC125', 'C117', 'BR016', 'Savings', 'Active', '2022-12-20', NULL, 58000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E116', NULL),
('ACC126', 'C118', 'BR017', 'Checking', 'Active', '2023-02-10', NULL, 11500.00, 'USD', 0.01, 500.00, '2024-03-12', 'Yes', 'E117', NULL),
('ACC127', 'C119', 'BR018', 'Checking', 'Active', '2023-04-15', NULL, 28000.00, 'GBP', 0.01, 1500.00, '2024-03-15', 'Yes', 'E118', 'UK account'),
('ACC128', 'C120', 'BR018', 'Savings', 'Active', '2023-06-20', NULL, 95000.00, 'CNY', 2.25, 0.00, '2024-03-10', 'Y', 'E118', 'Chinese Yuan'),
('ACC129', 'C121', 'BR019', 'Checking', 'Active', '2023-08-10', NULL, 35000.00, 'CAD', 0.01, 2000.00, '2024-03-14', 'Yes', 'E119', 'Canadian Dollar'),
('ACC130', 'C122', 'BR020', 'Checking', 'Active', '2023-10-15', NULL, 55000.00, 'MXN', 0.01, 3000.00, '2024-03-13', 'Y', 'E120', 'Mexican Peso'),
-- More US accounts
('ACC131', 'C123', 'BR001', 'Checking', 'Active', '2020-07-20', NULL, 17000.00, 'USD', 0.01, 700.00, '2024-03-15', 'Yes', 'E101', NULL),
('ACC132', 'C123', 'BR001', 'Savings', 'Active', '2020-07-20', NULL, 50000.00, 'USD', 2.50, 0.00, '2024-03-10', 'Yes', 'E101', NULL),
('ACC133', 'C124', 'BR002', 'Checking', 'Active', '2020-09-15', NULL, 7500.00, 'USD', 0.01, 300.00, '2024-03-12', 'Y', 'E102', NULL),
('ACC134', 'C125', 'BR003', 'Checking', 'Active', '2020-11-10', NULL, 20000.00, 'USD', 0.01, 900.00, '2024-03-14', 'Yes', 'E103', NULL),
('ACC135', 'C125', 'BR003', 'Savings', 'Active', '2020-11-10', NULL, 60000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E103', NULL),
('ACC136', 'C126', 'BR004', 'Checking', 'Active', '2021-01-20', NULL, 9000.00, 'USD', 0.01, 400.00, '2024-03-11', 'Y', 'E104', NULL),
('ACC137', 'C127', 'BR005', 'Checking', 'Active', '2021-03-15', NULL, 15000.00, 'USD', 0.01, 650.00, '2024-03-15', 'Yes', 'E105', NULL),
('ACC138', 'C127', 'BR005', 'Savings', 'Active', '2021-03-15', NULL, 42000.00, 'USD', 2.50, 0.00, '2024-03-08', 'Yes', 'E105', NULL),
('ACC139', 'C128', 'BR006', 'Checking', 'Active', '2021-05-20', NULL, 11500.00, 'USD', 0.01, 500.00, '2024-03-13', 'Y', 'E106', NULL),
('ACC140', 'C129', 'BR007', 'Checking', 'Active', '2021-07-25', NULL, 16500.00, 'USD', 0.01, 700.00, '2024-03-14', 'Yes', 'E107', NULL),
('ACC141', 'C129', 'BR007', 'Savings', 'Active', '2021-07-25', NULL, 48000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E107', NULL),
('ACC142', 'C130', 'BR008', 'Checking', 'Active', '2021-09-10', NULL, 9800.00, 'USD', 0.01, 430.00, '2024-03-12', 'Y', 'E108', NULL),
('ACC143', 'C131', 'BR009', 'Checking', 'Active', '2021-11-25', NULL, 14500.00, 'USD', 0.01, 630.00, '2024-03-15', 'Yes', 'E109', NULL),
('ACC144', 'C132', 'BR010', 'Checking', 'Active', '2022-01-15', NULL, 11000.00, 'USD', 0.01, 500.00, '2024-03-13', 'Yes', 'E110', NULL),
('ACC145', 'C133', 'BR011', 'Checking', 'Active', '2022-03-20', NULL, 22000.00, 'USD', 0.01, 1000.00, '2024-03-15', 'Y', 'E111', NULL),
('ACC146', 'C133', 'BR011', 'Savings', 'Active', '2022-03-20', NULL, 75000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Yes', 'E111', NULL),
('ACC147', 'C134', 'BR012', 'Checking', 'Active', '2022-05-10', NULL, 13000.00, 'USD', 0.01, 580.00, '2024-03-12', 'Yes', 'E112', NULL),
('ACC148', 'C135', 'BR013', 'Checking', 'Active', '2022-07-15', NULL, 10500.00, 'USD', 0.01, 460.00, '2024-03-11', 'Y', 'E113', NULL),
('ACC149', 'C136', 'BR014', 'Checking', 'Active', '2022-09-20', NULL, 18000.00, 'USD', 0.01, 800.00, '2024-03-14', 'Yes', 'E114', NULL),
('ACC150', 'C136', 'BR014', 'Savings', 'Active', '2022-09-20', NULL, 53000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E114', NULL),
('ACC151', 'C137', 'BR015', 'Checking', 'Active', '2022-11-10', NULL, 9500.00, 'USD', 0.01, 420.00, '2024-03-13', 'Y', 'E115', NULL),
('ACC152', 'C138', 'BR016', 'Checking', 'Active', '2023-01-15', NULL, 18500.00, 'USD', 0.01, 850.00, '2024-03-15', 'Yes', 'E116', NULL),
('ACC153', 'C138', 'BR016', 'Savings', 'Active', '2023-01-15', NULL, 59000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Yes', 'E116', NULL),
('ACC154', 'C139', 'BR017', 'Checking', 'Active', '2023-03-20', NULL, 12000.00, 'USD', 0.01, 530.00, '2024-03-12', 'Y', 'E117', NULL),
('ACC155', 'C140', 'BR018', 'Checking', 'Active', '2023-05-10', NULL, 30000.00, 'GBP', 0.01, 2000.00, '2024-03-14', 'Yes', 'E118', 'UK account'),
('ACC156', 'C141', 'BR018', 'Savings', 'Active', '2023-07-15', NULL, 200000.00, 'CNY', 2.25, 0.00, '2024-03-10', 'Y', 'E118', 'Chinese Yuan'),
('ACC157', 'C142', 'BR019', 'Checking', 'Active', '2023-09-20', NULL, 40000.00, 'CAD', 0.01, 2500.00, '2024-03-13', 'Yes', 'E119', 'Canadian Dollar'),
('ACC158', 'C143', 'BR020', 'Checking', 'Active', '2023-11-10', NULL, 60000.00, 'MXN', 0.01, 3500.00, '2024-03-15', 'Y', 'E120', 'Mexican Peso'),
-- Dormant accounts
('ACC159', 'C144', 'BR001', 'Savings', 'Dormant', '2020-08-15', NULL, 3500.00, 'USD', 1.50, 0.00, '2023-07-01', 'Yes', 'E101', 'No activity 8+ months'),
('ACC160', 'C145', 'BR002', 'Checking', 'Dormant', '2020-10-20', NULL, 2200.00, 'USD', 0.01, 200.00, '2023-06-15', 'Yes', 'E006', 'No activity 9+ months'),
-- More accounts with issues
('ACC161', 'C146', 'BR003', 'Checking', 'Active', '2020-12-10', NULL, 14000.00, 'usd', 0.01, 600.00, '2024-03-14', 'Y', 'E103', 'Messy currency'),
('ACC162', 'C147', 'BR004', 'Savings', 'Active', '2021-02-15', NULL, 38000.00, 'Usd', 2.25, 0.00, '2024-03-05', 'Yes', 'E104', 'Messy currency'),
('ACC163', 'C148', 'BR005', 'Checking', 'Active', '2021-04-20', NULL, 19000.00, 'USD', 0.01, 850.00, '2024-03-15', 'Yes', 'E105', NULL),
('ACC164', 'C148', 'BR005', 'Savings', 'Active', '2021-04-20', NULL, 60000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E105', NULL),
('ACC165', 'C149', 'BR006', 'Checking', 'Active', '2021-06-25', NULL, 8000.00, 'USD', 0.01, 350.00, '2024-03-12', 'Yes', 'E106', NULL),
('ACC166', 'C150', 'BR007', 'Checking', 'Active', '2021-08-15', NULL, 15500.00, 'USD', 0.01, 680.00, '2024-03-14', 'Yes', 'E107', NULL),
('ACC167', 'C150', 'BR007', 'Savings', 'Active', '2021-08-15', NULL, 44000.00, 'USD', 2.50, 0.00, '2024-03-08', 'Y', 'E107', NULL),
('ACC168', 'C151', 'BR001', 'Checking', 'Active', '2020-09-01', NULL, 16000.00, 'USD', 0.01, 700.00, '2024-03-15', 'Yes', 'E101', 'Special char customer'),
('ACC169', 'C152', 'BR002', 'Checking', 'Active', '2020-11-15', NULL, 9500.00, 'USD', 0.01, 420.00, '2024-03-13', 'Yes', 'E102', 'Special char customer'),
('ACC170', 'C153', 'BR007', 'Checking', 'Active', '2021-02-10', NULL, 15000.00, 'USD', 0.01, 650.00, '2024-03-14', 'Y', 'E107', 'Special char customer'),
('ACC171', 'C154', 'BR008', 'Checking', 'Active', '2021-06-10', NULL, 10500.00, 'USD', 0.01, 460.00, '2024-03-12', 'Yes', 'E108', 'Special char customer'),
('ACC172', 'C155', 'BR009', 'Checking', 'Active', '2021-08-15', NULL, 17500.00, 'USD', 0.01, 780.00, '2024-03-15', 'Yes', 'E109', 'Special char customer'),
-- Invalid zip accounts
('ACC173', 'C156', 'BR011', 'Checking', 'Active', '2022-01-10', NULL, 11500.00, 'USD', 0.01, 510.00, '2024-03-13', 'Y', 'E111', NULL),
('ACC174', 'C157', 'BR012', 'Checking', 'Active', '2022-03-15', NULL, 16000.00, 'USD', 0.01, 700.00, '2024-03-15', 'Yes', 'E112', NULL),
('ACC175', 'C158', 'BR013', 'Checking', 'Active', '2022-05-20', NULL, 10000.00, 'USD', 0.01, 450.00, '2024-03-12', 'Yes', 'E113', NULL),
-- More accounts
('ACC176', 'C159', 'BR014', 'Checking', 'Active', '2022-07-10', NULL, 17000.00, 'USD', 0.01, 750.00, '2024-03-14', 'Y', 'E114', NULL),
('ACC177', 'C159', 'BR014', 'Savings', 'Active', '2022-07-10', NULL, 51000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Yes', 'E114', NULL),
('ACC178', 'C160', 'BR015', 'Checking', 'Active', '2022-09-15', NULL, 10000.00, 'USD', 0.01, 450.00, '2024-03-13', 'Yes', 'E115', NULL),
('ACC179', 'C161', 'BR016', 'Checking', 'Active', '2022-11-20', NULL, 15500.00, 'USD', 0.01, 680.00, '2024-03-15', 'Y', 'E116', NULL),
('ACC180', 'C161', 'BR016', 'Savings', 'Active', '2022-11-20', NULL, 43000.00, 'USD', 2.50, 0.00, '2024-03-10', 'Yes', 'E116', NULL),
('ACC181', 'C162', 'BR017', 'Checking', 'Active', '2023-01-10', NULL, 12500.00, 'USD', 0.01, 550.00, '2024-03-12', 'Yes', 'E117', NULL),
('ACC182', 'C163', 'BR018', 'Checking', 'Active', '2023-03-15', NULL, 24000.00, 'USD', 0.01, 1200.00, '2024-03-14', 'Y', 'E118', 'Russian USD account'),
('ACC183', 'C164', 'BR018', 'Savings', 'Active', '2023-05-20', NULL, 50000.00, 'KRW', 1.25, 0.00, '2024-03-10', 'Yes', 'E118', 'Korean Won'),
('ACC184', 'C165', 'BR018', 'Business', 'Active', '2023-07-10', NULL, 280000.00, 'EUR', 0.25, 15000.00, '2024-03-15', 'Yes', 'E118', 'German business'),
('ACC185', 'C166', 'BR018', 'Savings', 'Active', '2023-09-25', NULL, 72000.00, 'EUR', 1.75, 0.00, '2024-03-08', 'Y', 'E118', 'Italian savings'),
('ACC186', 'C167', 'BR020', 'Checking', 'Active', '2023-11-15', NULL, 100000.00, 'BRL', 0.01, 5500.00, '2024-03-13', 'Yes', 'E120', 'Brazilian Real'),
('ACC187', 'C168', 'BR018', 'Checking', 'Active', '2024-01-10', NULL, 32000.00, 'PLN', 0.01, 2500.00, '2024-03-11', 'Yes', 'E118', 'Polish Zloty'),
('ACC188', 'C169', 'BR018', 'Savings', 'Active', '2024-03-05', NULL, 40000.00, 'EGP', 5.00, 0.00, '2024-03-10', 'Y', 'E118', 'Egyptian Pound'),
('ACC189', 'C170', 'BR018', 'Checking', 'Active', '2024-04-20', NULL, 500000.00, 'INR', 0.01, 25000.00, '2024-04-20', 'Yes', 'E118', 'Indian Rupee'),
('ACC190', 'C171', 'BR001', 'Checking', 'Active', '2020-10-10', NULL, 18000.00, 'USD', 0.01, 800.00, '2024-03-15', 'Yes', 'E101', NULL),
('ACC191', 'C171', 'BR001', 'Savings', 'Active', '2020-10-10', NULL, 55000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E101', NULL),
('ACC192', 'C172', 'BR002', 'Checking', 'Active', '2020-12-25', NULL, 8000.00, 'USD', 0.01, 350.00, '2024-03-13', 'Yes', 'E102', NULL),
('ACC193', 'C173', 'BR003', 'Checking', 'Active', '2021-02-15', NULL, 20500.00, 'USD', 0.01, 950.00, '2024-03-14', 'Yes', 'E103', NULL),
('ACC194', 'C173', 'BR003', 'Savings', 'Active', '2021-02-15', NULL, 62000.00, 'USD', 2.75, 0.00, '2024-03-08', 'Y', 'E103', NULL),
('ACC195', 'C174', 'BR004', 'Checking', 'Active', '2021-04-20', NULL, 10000.00, 'USD', 0.01, 450.00, '2024-03-12', 'Yes', 'E104', NULL),
('ACC196', 'C175', 'BR005', 'Checking', 'Active', '2021-06-10', NULL, 16000.00, 'USD', 0.01, 700.00, '2024-03-15', 'Yes', 'E105', NULL),
('ACC197', 'C175', 'BR005', 'Savings', 'Active', '2021-06-10', NULL, 44000.00, 'USD', 2.50, 0.00, '2024-03-08', 'Y', 'E105', NULL),
('ACC198', 'C176', 'BR006', 'Checking', 'Active', '2021-08-25', NULL, 12500.00, 'USD', 0.01, 550.00, '2024-03-13', 'Yes', 'E106', NULL),
('ACC199', 'C177', 'BR007', 'Checking', 'Active', '2021-10-15', NULL, 18500.00, 'USD', 0.01, 820.00, '2024-03-14', 'Yes', 'E107', NULL),
('ACC200', 'C177', 'BR007', 'Savings', 'Active', '2021-10-15', NULL, 56000.00, 'USD', 2.75, 0.00, '2024-03-10', 'Y', 'E107', NULL);
 
-- ============================================================
-- ADDITIONAL TRANSACTIONS (bringing total to ~1000)
-- ============================================================
INSERT INTO transactions VALUES
('TXN101', 'ACC101', 'C102', 'BR001', 'Deposit', 4400.00, 'USD', '2024-01-18', 'Payroll', 20900.00, 'Completed', 'E101', 'Online', NULL),
('TXN102', 'ACC101', 'C102', 'BR001', 'Withdrawal', 1800.00, 'USD', '2024-01-25', 'Rent', 19100.00, 'Completed', 'E101', 'Online', NULL),
('TXN103', 'ACC103', 'C103', 'BR002', 'Deposit', 2800.00, 'USD', '2024-02-01', 'Payroll', 10600.00, 'Completed', 'E006', 'Online', NULL),
('TXN104', 'ACC104', 'C104', 'BR003', 'Deposit', 5200.00, 'USD', '2024-01-15', 'Business income', 24700.00, 'Completed', 'E103', 'Wire', NULL),
('TXN105', 'ACC106', 'C104', 'BR003', 'Deposit', 18000.00, 'USD', '2024-01-20', 'Business income', 163000.00, 'Completed', 'E103', 'Wire', 'Business deposit'),
('TXN106', 'ACC107', 'C105', 'BR004', 'Deposit', 3450.00, 'USD', '2024-02-05', 'Payroll', 11650.00, 'Completed', 'E104', 'Online', NULL),
('TXN107', 'ACC108', 'C106', 'BR005', 'Deposit', 4050.00, 'USD', '2024-01-22', 'Payroll', 18550.00, 'Completed', 'E022', 'Online', NULL),
('TXN108', 'ACC110', 'C107', 'BR006', 'Deposit', 3700.00, 'USD', '2024-02-08', 'Payroll', 14200.00, 'Completed', 'E106', 'Online', NULL),
('TXN109', 'ACC111', 'C108', 'BR007', 'Deposit', 4900.00, 'USD', '2024-01-18', 'Payroll', 23400.00, 'Completed', 'E107', 'Online', NULL),
('TXN110', 'ACC113', 'C109', 'BR008', 'Deposit', 3000.00, 'USD', '2024-02-01', 'Payroll', 12000.00, 'Completed', 'E108', 'Online', NULL),
('TXN111', 'ACC114', 'C110', 'BR009', 'Deposit', 3850.00, 'USD', '2024-01-15', 'Payroll', 17850.00, 'Completed', 'E109', 'Online', NULL),
('TXN112', 'ACC116', 'C111', 'BR010', 'Deposit', 3150.00, 'USD', '2024-02-05', 'Payroll', 14150.00, 'Completed', 'E110', 'Online', NULL),
('TXN113', 'ACC117', 'C112', 'BR011', 'Deposit', 5650.00, 'USD', '2024-01-22', 'Business income', 27150.00, 'Completed', 'E111', 'Wire', NULL),
('TXN114', 'ACC119', 'C113', 'BR012', 'Deposit', 3350.00, 'USD', '2024-02-08', 'Payroll', 16850.00, 'Completed', 'E112', 'Online', NULL),
('TXN115', 'ACC120', 'C114', 'BR013', 'Deposit', 3600.00, 'USD', '2024-01-18', 'Payroll', 14100.00, 'Completed', 'E113', 'Online', NULL),
('TXN116', 'ACC121', 'C115', 'BR014', 'Deposit', 4500.00, 'USD', '2024-02-01', 'Payroll', 22000.00, 'Completed', 'E114', 'Online', NULL),
('TXN117', 'ACC123', 'C116', 'BR015', 'Deposit', 3100.00, 'USD', '2024-01-15', 'Payroll', 12300.00, 'Completed', 'E115', 'Online', NULL),
('TXN118', 'ACC124', 'C117', 'BR016', 'Deposit', 4750.00, 'USD', '2024-02-05', 'Payroll', 22750.00, 'Completed', 'E116', 'Online', NULL),
('TXN119', 'ACC126', 'C118', 'BR017', 'Deposit', 3300.00, 'USD', '2024-01-22', 'Payroll', 14800.00, 'Completed', 'E117', 'Online', NULL),
('TXN120', 'ACC127', 'C119', 'BR018', 'Deposit', 5500.00, 'GBP', '2024-02-08', 'Salary', 33500.00, 'Completed', 'E118', 'Online', NULL),
-- Duplicate transactions (new batch)
('TXN121', 'ACC101', 'C102', 'BR001', 'Deposit', 4400.00, 'USD', '2024-01-18', 'Payroll', 20900.00, 'Completed', 'E101', 'Online', 'Duplicate of TXN101'),
('TXN122', 'ACC104', 'C104', 'BR003', 'Deposit', 5200.00, 'USD', '2024-01-15', 'Business income', 24700.00, 'Completed', 'E103', 'Wire', 'Duplicate of TXN104'),
('TXN123', 'ACC111', 'C108', 'BR007', 'Deposit', 4900.00, 'USD', '2024-01-18', 'Payroll', 23400.00, 'Completed', 'E107', 'Online', 'Duplicate of TXN109'),
-- Transactions with messy status
('TXN124', 'ACC131', 'C123', 'BR001', 'Deposit', 4600.00, 'USD', '2024-01-20', 'Payroll', 21600.00, 'COMPLETED', 'E101', 'Online', 'Status case issue'),
('TXN125', 'ACC134', 'C125', 'BR003', 'Withdrawal', 2500.00, 'USD', '2024-01-28', 'Shopping', 17500.00, 'completed', 'E103', 'Card', 'Status case issue'),
('TXN126', 'ACC137', 'C127', 'BR005', 'Deposit', 4250.00, 'USD', '2024-02-10', 'Payroll', 19250.00, 'PENDING', 'E105', 'Online', 'Status case issue'),
-- Zero amount transactions
('TXN127', 'ACC140', 'C129', 'BR007', 'Deposit', 0.00, 'USD', '2024-02-15', 'Test', 16500.00, 'Completed', 'E107', 'Online', 'Zero amount invalid'),
('TXN128', 'ACC143', 'C131', 'BR009', 'Withdrawal', 0.00, 'USD', '2024-02-18', 'Test', 14500.00, 'Completed', 'E109', 'ATM', 'Zero amount invalid'),
-- Negative amount transactions
('TXN129', 'ACC145', 'C133', 'BR011', 'Withdrawal', -3000.00, 'USD', '2024-01-25', 'Bill payment', 19000.00, 'Completed', 'E111', 'Online', 'Negative amount error'),
('TXN130', 'ACC148', 'C135', 'BR013', 'Deposit', -1500.00, 'USD', '2024-02-02', 'Reversal', 9000.00, 'Completed', 'E113', 'Online', 'Negative reversal'),
-- Messy currency transactions
('TXN131', 'ACC161', 'C146', 'BR003', 'Deposit', 3800.00, 'usd', '2024-01-18', 'Payroll', 17800.00, 'Completed', 'E103', 'Online', 'Messy currency'),
('TXN132', 'ACC162', 'C147', 'BR004', 'Deposit', 1900.00, 'Usd', '2024-01-25', 'Transfer', 39900.00, 'Completed', 'E104', 'Online', 'Messy currency'),
-- Future date transactions
('TXN133', 'ACC165', 'C149', 'BR006', 'Deposit', 3100.00, 'USD', '2025-08-15', 'Future deposit', 11100.00, 'Pending', 'E106', 'Online', 'Invalid future date'),
('TXN134', 'ACC168', 'C151', 'BR001', 'Withdrawal', 1000.00, 'USD', '2026-01-20', 'Future withdrawal', 15000.00, 'Pending', 'E101', 'ATM', 'Invalid future date'),
-- Channel inconsistencies
('TXN135', 'ACC170', 'C153', 'BR007', 'Deposit', 4000.00, 'USD', '2024-02-05', 'Payroll', 19000.00, 'Completed', 'E107', 'ONLINE', 'Channel case issue'),
('TXN136', 'ACC171', 'C154', 'BR008', 'Deposit', 3150.00, 'USD', '2024-01-22', 'Payroll', 13650.00, 'Completed', 'E108', 'branch', 'Channel case issue'),
('TXN137', 'ACC172', 'C155', 'BR009', 'Deposit', 4550.00, 'USD', '2024-02-08', 'Payroll', 22050.00, 'Completed', 'E109', 'Wire Transfer', 'Channel inconsistency'),
('TXN138', 'ACC173', 'C156', 'BR011', 'Deposit', 3200.00, 'USD', '2024-01-15', 'Payroll', 14700.00, 'Completed', 'E111', 'ATM Machine', 'Channel inconsistency'),
-- More normal transactions
('TXN139', 'ACC174', 'C157', 'BR012', 'Deposit', 4350.00, 'USD', '2024-02-01', 'Payroll', 20350.00, 'Completed', 'E112', 'Online', NULL),
('TXN140', 'ACC175', 'C158', 'BR013', 'Deposit', 3100.00, 'USD', '2024-01-18', 'Payroll', 13100.00, 'Completed', 'E113', 'Online', NULL),
('TXN141', 'ACC176', 'C159', 'BR014', 'Deposit', 4250.00, 'USD', '2024-02-05', 'Payroll', 21250.00, 'Completed', 'E114', 'Online', NULL),
('TXN142', 'ACC178', 'C160', 'BR015', 'Deposit', 3450.00, 'USD', '2024-01-22', 'Payroll', 13450.00, 'Completed', 'E115', 'Online', NULL),
('TXN143', 'ACC179', 'C161', 'BR016', 'Deposit', 4000.00, 'USD', '2024-02-08', 'Payroll', 19500.00, 'Completed', 'E116', 'Online', NULL),
('TXN144', 'ACC181', 'C162', 'BR017', 'Deposit', 3300.00, 'USD', '2024-01-15', 'Payroll', 15800.00, 'Completed', 'E117', 'Online', NULL),
('TXN145', 'ACC182', 'C163', 'BR018', 'Deposit', 6500.00, 'USD', '2024-02-01', 'Salary', 30500.00, 'Completed', 'E118', 'Wire', NULL),
('TXN146', 'ACC183', 'C164', 'BR018', 'Deposit', 3000000.00, 'KRW', '2024-01-25', 'Salary', 53000000.00, 'Completed', 'E118', 'Online', 'Korean Won deposit'),
('TXN147', 'ACC184', 'C165', 'BR018', 'Deposit', 35000.00, 'EUR', '2024-02-10', 'Business income', 315000.00, 'Completed', 'E118', 'Wire', 'Euro business'),
('TXN148', 'ACC186', 'C167', 'BR020', 'Deposit', 12000.00, 'BRL', '2024-01-20', 'Salary', 112000.00, 'Completed', 'E120', 'Online', NULL),
('TXN149', 'ACC190', 'C171', 'BR001', 'Deposit', 4600.00, 'USD', '2024-02-05', 'Payroll', 22600.00, 'Completed', 'E101', 'Online', NULL),
('TXN150', 'ACC192', 'C172', 'BR002', 'Deposit', 2850.00, 'USD', '2024-01-18', 'Payroll', 10850.00, 'Completed', 'E102', 'Online', NULL),
-- Large suspicious transactions
('TXN151', 'ACC118', 'C112', 'BR011', 'Deposit', 850000.00, 'USD', '2024-02-12', 'Wire transfer', 922000.00, 'Pending', 'E111', 'Wire', 'Large transaction - review needed'),
('TXN152', 'ACC146', 'C133', 'BR011', 'Withdrawal', 450000.00, 'USD', '2024-02-16', 'Investment', 0.00, 'Completed', 'E111', 'Wire', 'Large withdrawal'),
-- Transactions with spaces in description
('TXN153', 'ACC193', 'C173', 'BR003', 'Deposit', 5400.00, 'USD', '2024-02-08', '  Business income  ', 25900.00, 'Completed', 'E103', 'Wire', 'Spaces in description'),
('TXN154', 'ACC196', 'C175', 'BR005', 'Deposit', 4100.00, 'USD', '2024-01-25', '  Payroll  ', 20100.00, 'Completed', 'E105', 'Online', 'Spaces in description'),
('TXN155', 'ACC199', 'C177', 'BR007', 'Deposit', 4700.00, 'USD', '2024-02-01', '  Salary payment  ', 23200.00, 'Completed', 'E107', 'Online', 'Spaces in description'),
-- COVID period transactions
('TXN156', 'ACC103', 'C103', 'BR002', 'Deposit', 1200.00, 'USD', '2020-04-15', 'Stimulus check', 8200.00, 'Completed', 'E006', 'Online', 'COVID stimulus'),
('TXN157', 'ACC107', 'C105', 'BR004', 'Deposit', 1200.00, 'USD', '2020-04-18', 'Stimulus check', 9200.00, 'Completed', 'E104', 'Online', 'COVID stimulus'),
('TXN158', 'ACC108', 'C106', 'BR005', 'Withdrawal', 3500.00, 'USD', '2020-03-22', 'Emergency withdrawal', 11000.00, 'Completed', 'E022', 'Branch', 'COVID emergency'),
('TXN159', 'ACC110', 'C107', 'BR006', 'Deposit', 2400.00, 'USD', '2020-04-20', 'Stimulus check', 12900.00, 'Completed', 'E106', 'Online', 'COVID stimulus'),
('TXN160', 'ACC113', 'C109', 'BR008', 'Withdrawal', 4000.00, 'USD', '2020-03-18', 'Emergency cash', 5000.00, 'Completed', 'E108', 'Branch', 'COVID panic withdrawal'),
-- 2021 stimulus
('TXN161', 'ACC116', 'C111', 'BR010', 'Deposit', 1400.00, 'USD', '2021-03-16', 'Stimulus check', 12400.00, 'Completed', 'E110', 'Online', '2021 stimulus'),
('TXN162', 'ACC119', 'C113', 'BR012', 'Deposit', 1400.00, 'USD', '2021-03-19', 'Stimulus check', 14900.00, 'Completed', 'E112', 'Online', '2021 stimulus'),
-- 2022 transactions
('TXN163', 'ACC101', 'C102', 'BR001', 'Deposit', 5800.00, 'USD', '2022-02-15', 'Payroll raise', 25800.00, 'Completed', 'E101', 'Online', 'Salary increase'),
('TXN164', 'ACC128', 'C120', 'BR018', 'Deposit', 12000.00, 'CNY', '2022-08-01', 'Business income', 107000.00, 'Completed', 'E118', 'Wire', NULL),
('TXN165', 'ACC129', 'C121', 'BR019', 'Deposit', 8000.00, 'CAD', '2022-10-15', 'Business profit', 43000.00, 'Completed', 'E119', 'Wire', NULL),
-- 2023 transactions
('TXN166', 'ACC131', 'C123', 'BR001', 'Deposit', 6200.00, 'USD', '2023-01-18', 'Payroll raise', 23200.00, 'Completed', 'E101', 'Online', 'Salary increase'),
('TXN167', 'ACC155', 'C140', 'BR018', 'Deposit', 6000.00, 'GBP', '2023-03-05', 'Salary', 36000.00, 'Completed', 'E118', 'Online', NULL),
('TXN168', 'ACC156', 'C141', 'BR018', 'Deposit', 15000.00, 'CNY', '2023-05-18', 'Business income', 215000.00, 'Completed', 'E118', 'Wire', NULL),
-- Transactions for data analysis
('TXN169', 'ACC134', 'C125', 'BR003', 'Deposit', 9500.00, 'USD', '2023-08-22', 'Business profit', 69500.00, 'Completed', 'E103', 'Wire', NULL),
('TXN170', 'ACC141', 'C129', 'BR007', 'Deposit', 7500.00, 'USD', '2023-10-15', 'Business income', 55500.00, 'Completed', 'E107', 'Wire', NULL),
('TXN171', 'ACC144', 'C132', 'BR010', 'Deposit', 3300.00, 'USD', '2024-03-01', 'Payroll', 14300.00, 'Completed', 'E110', 'Online', NULL),
('TXN172', 'ACC147', 'C134', 'BR012', 'Deposit', 3350.00, 'USD', '2024-03-05', 'Payroll', 16350.00, 'Completed', 'E112', 'Online', NULL),
('TXN173', 'ACC150', 'C136', 'BR014', 'Deposit', 4550.00, 'USD', '2024-03-08', 'Payroll', 22550.00, 'Completed', 'E114', 'Online', NULL),
('TXN174', 'ACC153', 'C138', 'BR016', 'Deposit', 4800.00, 'USD', '2024-03-10', 'Payroll', 23800.00, 'Completed', 'E116', 'Online', NULL),
('TXN175', 'ACC158', 'C143', 'BR020', 'Deposit', 8000.00, 'MXN', '2024-03-12', 'Salary', 68000.00, 'Completed', 'E120', 'Online', NULL),
('TXN176', 'ACC163', 'C148', 'BR005', 'Deposit', 5100.00, 'USD', '2024-01-22', 'Payroll', 24100.00, 'Completed', 'E105', 'Online', NULL),
('TXN177', 'ACC166', 'C150', 'BR007', 'Deposit', 4050.00, 'USD', '2024-02-05', 'Payroll', 19550.00, 'Completed', 'E107', 'Online', NULL),
('TXN178', 'ACC169', 'C152', 'BR002', 'Deposit', 3300.00, 'USD', '2024-01-20', 'Payroll', 12800.00, 'Completed', 'E102', 'Online', NULL),
('TXN179', 'ACC185', 'C166', 'BR018', 'Deposit', 7600.00, 'EUR', '2024-02-08', 'Business income', 79600.00, 'Completed', 'E118', 'Wire', NULL),
('TXN180', 'ACC187', 'C168', 'BR018', 'Deposit', 4000.00, 'PLN', '2024-01-15', 'Salary', 36000.00, 'Completed', 'E118', 'Online', NULL),
-- More transactions to reach 1000
('TXN181', 'ACC194', 'C174', 'BR004', 'Deposit', 3500.00, 'USD', '2024-01-18', 'Payroll', 13500.00, 'Completed', 'E104', 'Online', NULL),
('TXN182', 'ACC195', 'C174', 'BR004', 'Withdrawal', 800.00, 'USD', '2024-01-25', 'Utilities', 12700.00, 'Completed', 'E104', 'Online', NULL),
('TXN183', 'ACC197', 'C175', 'BR005', 'Deposit', 1900.00, 'USD', '2024-01-28', 'Transfer', 45900.00, 'Completed', 'E105', 'Online', NULL),
('TXN184', 'ACC198', 'C176', 'BR006', 'Deposit', 3950.00, 'USD', '2024-02-01', 'Payroll', 16450.00, 'Completed', 'E106', 'Online', NULL),
('TXN185', 'ACC200', 'C177', 'BR007', 'Deposit', 2400.00, 'USD', '2024-01-20', 'Transfer', 58400.00, 'Completed', 'E107', 'Online', NULL),
('TXN186', 'ACC191', 'C171', 'BR001', 'Deposit', 3200.00, 'USD', '2024-01-25', 'Transfer', 58200.00, 'Completed', 'E101', 'Online', NULL),
('TXN187', 'ACC102', 'C102', 'BR001', 'Deposit', 2500.00, 'USD', '2024-02-10', 'Transfer', 50500.00, 'Completed', 'E101', 'Online', NULL),
('TXN188', 'ACC105', 'C104', 'BR003', 'Deposit', 4000.00, 'USD', '2024-02-15', 'Transfer', 62000.00, 'Completed', 'E103', 'Online', NULL),
('TXN189', 'ACC109', 'C106', 'BR005', 'Deposit', 2800.00, 'USD', '2024-02-20', 'Transfer', 42800.00, 'Completed', 'E022', 'Online', NULL),
('TXN190', 'ACC112', 'C108', 'BR007', 'Deposit', 3500.00, 'USD', '2024-02-25', 'Transfer', 58500.00, 'Completed', 'E107', 'Online', NULL),
('TXN191', 'ACC115', 'C110', 'BR009', 'Deposit', 2200.00, 'USD', '2024-03-01', 'Transfer', 40200.00, 'Completed', 'E109', 'Online', NULL),
('TXN192', 'ACC122', 'C115', 'BR014', 'Deposit', 3100.00, 'USD', '2024-03-05', 'Transfer', 55100.00, 'Completed', 'E114', 'Online', NULL),
('TXN193', 'ACC125', 'C117', 'BR016', 'Deposit', 3800.00, 'USD', '2024-03-08', 'Transfer', 61800.00, 'Completed', 'E116', 'Online', NULL),
('TXN194', 'ACC132', 'C123', 'BR001', 'Deposit', 4200.00, 'USD', '2024-03-10', 'Transfer', 54200.00, 'Completed', 'E101', 'Online', NULL),
('TXN195', 'ACC135', 'C125', 'BR003', 'Deposit', 5000.00, 'USD', '2024-03-12', 'Transfer', 65000.00, 'Completed', 'E103', 'Online', NULL),
('TXN196', 'ACC138', 'C127', 'BR005', 'Deposit', 3600.00, 'USD', '2024-03-14', 'Transfer', 45600.00, 'Completed', 'E105', 'Online', NULL),
('TXN197', 'ACC141', 'C129', 'BR007', 'Deposit', 4400.00, 'USD', '2024-03-15', 'Transfer', 52400.00, 'Completed', 'E107', 'Online', NULL),
('TXN198', 'ACC144', 'C132', 'BR010', 'Withdrawal', 1200.00, 'USD', '2024-03-14', 'Shopping', 13100.00, 'Completed', 'E110', 'Card', NULL),
('TXN199', 'ACC147', 'C134', 'BR012', 'Withdrawal', 900.00, 'USD', '2024-03-13', 'Dining', 15450.00, 'Completed', 'E112', 'Card', NULL),
('TXN200', 'ACC150', 'C136', 'BR014', 'Withdrawal', 1500.00, 'USD', '2024-03-12', 'Travel', 21050.00, 'Completed', 'E114', 'Card', NULL);
 
-- ============================================================
-- ADDITIONAL LOANS (bringing total to ~400)
-- ============================================================
INSERT INTO loans VALUES
('LN051', 'C102', 'BR001', 'E101', 'Mortgage', 380000.00, 3.85, 360, '2020-07-15', '2050-07-15', 1779.00, 48000.00, 332000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN052', 'C104', 'BR003', 'E103', 'Business', 200000.00, 5.75, 84, '2021-03-01', '2028-03-01', 3186.00, 72000.00, 128000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
('LN053', 'C106', 'BR005', 'E022', 'Mortgage', 360000.00, 3.65, 360, '2021-05-15', '2051-05-15', 1646.00, 35000.00, 325000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN054', 'C108', 'BR007', 'E107', 'Auto', 38000.00, 5.00, 60, '2021-08-01', '2026-08-01', 717.00, 22000.00, 16000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', NULL),
('LN055', 'C110', 'BR009', 'E109', 'Personal', 16000.00, 8.75, 48, '2021-11-15', '2025-11-15', 397.00, 14000.00, 2000.00, 'Active', 'USD', 'None', 1, 'Yes', 'One missed payment'),
('LN056', 'C112', 'BR011', 'E111', 'Business', 280000.00, 5.50, 84, '2022-04-01', '2029-04-01', 4462.00, 88000.00, 192000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
('LN057', 'C115', 'BR014', 'E114', 'Mortgage', 425000.00, 3.45, 360, '2022-10-01', '2052-10-01', 1889.00, 32000.00, 393000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN058', 'C117', 'BR016', 'E116', 'Business', 230000.00, 5.65, 84, '2023-02-15', '2030-02-15', 3667.00, 45000.00, 185000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
('LN059', 'C119', 'BR018', 'E118', 'Mortgage', 500000.00, 2.45, 300, '2023-05-01', '2048-05-01', 2236.00, 28000.00, 472000.00, 'Active', 'GBP', 'Property', 0, 'Yes', 'UK mortgage'),
('LN060', 'C121', 'BR019', 'E119', 'Business', 350000.00, 4.25, 120, '2023-09-01', '2033-09-01', 3568.00, 42000.00, 308000.00, 'Active', 'CAD', 'Business assets', 0, 'Yes', 'Canadian business loan'),
-- Defaulted loans
('LN061', 'C144', 'BR001', 'E101', 'Personal', 6000.00, 14.00, 24, '2022-09-01', '2024-09-01', 289.00, 867.00, 5133.00, 'Default', 'USD', 'None', 9, 'Yes', 'Unemployed - high risk'),
('LN062', 'C145', 'BR002', 'E006', 'Personal', 4500.00, 13.50, 24, '2022-11-15', '2024-11-15', 216.00, 648.00, 3852.00, 'Default', 'USD', 'None', 10, 'Yes', 'Below average credit'),
('LN063', 'C158', 'BR013', 'E113', 'Auto', 20000.00, 9.00, 48, '2022-06-01', '2026-06-01', 497.00, 5964.00, 14036.00, 'Default', 'USD', 'Vehicle', 7, 'Yes', 'Multiple missed payments'),
-- Restructured loans
('LN064', 'C146', 'BR003', 'E103', 'Personal', 10000.00, 10.50, 48, '2020-10-01', '2024-10-01', 256.00, 5120.00, 4880.00, 'Restructured', 'USD', 'None', 4, 'Yes', 'COVID restructure'),
('LN065', 'C147', 'BR004', 'E104', 'Auto', 22000.00, 7.25, 60, '2020-12-15', '2025-12-15', 439.00, 8780.00, 13220.00, 'Restructured', 'USD', 'Vehicle', 3, 'Yes', 'COVID hardship'),
-- Multiple loans same customer
('LN066', 'C123', 'BR001', 'E101', 'Mortgage', 440000.00, 3.55, 360, '2020-09-01', '2050-09-01', 1987.00, 52000.00, 388000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN067', 'C123', 'BR001', 'E101', 'Auto', 42000.00, 4.85, 60, '2022-04-15', '2027-04-15', 790.00, 23000.00, 19000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', NULL),
('LN068', 'C125', 'BR003', 'E103', 'Mortgage', 520000.00, 3.35, 360, '2020-12-01', '2050-12-01', 2296.00, 58000.00, 462000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN069', 'C125', 'BR003', 'E103', 'Business', 220000.00, 5.45, 84, '2021-07-01', '2028-07-01', 3504.00, 65000.00, 155000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
('LN070', 'C148', 'BR005', 'E105', 'Mortgage', 460000.00, 3.60, 360, '2021-05-01', '2051-05-01', 2092.00, 40000.00, 420000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN071', 'C148', 'BR005', 'E105', 'Business', 190000.00, 5.65, 84, '2021-12-15', '2028-12-15', 3028.00, 52000.00, 138000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
-- International loans
('LN072', 'C140', 'BR018', 'E118', 'Mortgage', 480000.00, 2.55, 300, '2023-06-01', '2048-06-01', 2144.00, 18000.00, 462000.00, 'Active', 'GBP', 'Property', 0, 'Yes', 'UK mortgage'),
('LN073', 'C142', 'BR019', 'E119', 'Business', 380000.00, 4.15, 120, '2023-10-01', '2033-10-01', 3869.00, 23000.00, 357000.00, 'Active', 'CAD', 'Business assets', 0, 'Yes', 'Canadian business'),
('LN074', 'C163', 'BR018', 'E118', 'Personal', 35000.00, 6.75, 48, '2023-03-01', '2027-03-01', 832.00, 12000.00, 23000.00, 'Active', 'USD', 'None', 0, 'Yes', 'Russian customer USD'),
('LN075', 'C165', 'BR018', 'E118', 'Business', 1200000.00, 3.15, 120, '2023-07-01', '2033-07-01', 11676.00, 72000.00, 1128000.00, 'Active', 'EUR', 'Business assets', 0, 'Yes', 'German large loan'),
-- Loans with missing data for imputation
('LN076', 'C127', 'BR005', 'E105', 'Auto', 29000.00, NULL, 60, '2021-04-01', '2026-04-01', NULL, 17000.00, 12000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', 'Missing rate - impute from similar'),
('LN077', 'C129', 'BR007', 'E107', 'Personal', 16000.00, NULL, 36, '2021-08-15', '2024-08-15', NULL, 16000.00, 0.00, 'Paid', 'USD', 'None', 0, 'No', 'Missing rate - impute'),
('LN078', 'C131', 'BR009', 'E109', 'Mortgage', 270000.00, NULL, 360, '2021-12-01', '2051-12-01', NULL, 20000.00, 250000.00, 'Active', 'USD', 'Property', 0, 'Yes', 'Missing rate - impute'),
('LN079', 'C133', 'BR011', 'E111', 'Business', 130000.00, NULL, 84, '2022-03-15', '2029-03-15', NULL, 38000.00, 92000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', 'Missing rate - impute'),
('LN080', 'C136', 'BR014', 'E114', 'Auto', 31000.00, NULL, 60, '2022-10-01', '2027-10-01', NULL, 16000.00, 15000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', 'Missing rate - impute'),
-- More loans
('LN081', 'C138', 'BR016', 'E116', 'Mortgage', 340000.00, 3.95, 360, '2023-02-01', '2053-02-01', 1606.00, 15000.00, 325000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN082', 'C150', 'BR007', 'E107', 'Mortgage', 355000.00, 3.80, 360, '2021-10-01', '2051-10-01', 1657.00, 42000.00, 313000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN083', 'C150', 'BR007', 'E107', 'Auto', 36000.00, 5.10, 60, '2022-06-15', '2027-06-15', 682.00, 19000.00, 17000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', NULL),
('LN084', 'C153', 'BR007', 'E107', 'Personal', 18000.00, 8.25, 48, '2021-03-15', '2025-03-15', 441.00, 15876.00, 2124.00, 'Active', 'USD', 'None', 0, 'Yes', NULL),
('LN085', 'C155', 'BR009', 'E109', 'Mortgage', 295000.00, 3.75, 360, '2021-09-01', '2051-09-01', 1366.00, 28000.00, 267000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
-- Loans with out of range interest rates
('LN086', 'C159', 'BR014', 'E114', 'Personal', 22000.00, 48.00, 36, '2022-08-01', '2025-08-01', 838.00, 20000.00, 2000.00, 'Active', 'USD', 'None', 2, 'Yes', 'Invalid high interest'),
('LN087', 'C160', 'BR015', 'E115', 'Auto', 26000.00, -3.00, 60, '2022-10-15', '2027-10-15', 467.00, 14000.00, 12000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', 'Negative interest error'),
-- Negative loan amounts
('LN088', 'C161', 'BR016', 'E116', 'Personal', -14000.00, 8.50, 36, '2022-12-01', '2025-12-01', 441.00, 14000.00, 0.00, 'Paid', 'USD', 'None', 0, 'No', 'Negative amount error'),
-- Loans with future start dates
('LN089', 'C162', 'BR017', 'E117', 'Personal', 16000.00, 8.75, 36, '2025-05-01', '2028-05-01', 510.00, 0.00, 16000.00, 'Pending', 'USD', 'None', 0, 'Yes', 'Invalid future start date'),
('LN090', 'C163', 'BR018', 'E118', 'Auto', 28000.00, 5.25, 60, '2026-01-15', '2031-01-15', 532.00, 0.00, 28000.00, 'Pending', 'USD', 'Vehicle', 0, 'Yes', 'Invalid future start date'),
-- More standard loans
('LN091', 'C164', 'BR018', 'E118', 'Personal', 20000.00, 6.25, 48, '2023-04-01', '2027-04-01', 471.00, 8000.00, 12000.00, 'Active', 'USD', 'None', 0, 'Yes', 'Korean customer USD loan'),
('LN092', 'C166', 'BR018', 'E118', 'Personal', 45000.00, 5.50, 48, '2023-10-01', '2027-10-01', 1036.00, 12000.00, 33000.00, 'Active', 'EUR', 'None', 0, 'Yes', 'Italian Euro loan'),
('LN093', 'C167', 'BR020', 'E120', 'Personal', 80000.00, 9.75, 36, '2024-01-01', '2027-01-01', 2565.00, 5000.00, 75000.00, 'Active', 'BRL', 'None', 0, 'Yes', 'Brazilian Real loan'),
('LN094', 'C169', 'BR018', 'E118', 'Personal', 40000.00, 12.50, 36, '2024-04-01', '2027-04-01', 1337.00, 0.00, 40000.00, 'Active', 'EGP', 'None', 0, 'Yes', 'Egyptian Pound loan'),
('LN095', 'C171', 'BR001', 'E101', 'Mortgage', 395000.00, 3.90, 360, '2020-11-01', '2050-11-01', 1861.00, 50000.00, 345000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN096', 'C173', 'BR003', 'E103', 'Business', 210000.00, 5.60, 84, '2021-04-01', '2028-04-01', 3345.00, 68000.00, 142000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
('LN097', 'C175', 'BR005', 'E105', 'Mortgage', 375000.00, 3.70, 360, '2021-07-01', '2051-07-01', 1724.00, 38000.00, 337000.00, 'Active', 'USD', 'Property', 0, 'Yes', NULL),
('LN098', 'C177', 'BR007', 'E107', 'Business', 195000.00, 5.70, 84, '2021-12-01', '2028-12-01', 3109.00, 55000.00, 140000.00, 'Active', 'USD', 'Business assets', 0, 'Yes', NULL),
('LN099', 'C179', 'BR009', 'E109', 'Auto', 34000.00, 5.20, 60, '2022-03-15', '2027-03-15', 645.00, 18000.00, 16000.00, 'Active', 'USD', 'Vehicle', 0, 'Yes', NULL),
('LN100', 'C181', 'BR018', 'E118', 'Personal', 4000000.00, 2.35, 60, '2023-07-01', '2028-07-01', 70600.00, 1200000.00, 2800000.00, 'Active', 'JPY', 'None', 0, 'Yes', 'Japanese Yen loan');
insert into customers values
-- ── USA +6 (spread across low-count branches) ──────────────
('C201','James','Carter','James Carter','Male','1986-04-12','503-555-3001','james.carter@gmail.com','201 SW Broadway','Portland','OR','97201','USA','Employed',82000.00,718,'Married','American','Yes','Yes','BR017','2022-06-10',NULL),
('C202','Linda','Foster','Linda Foster','Female','1991-09-18','503-555-3002','linda.foster@gmail.com','202 SW 5th Ave','Portland','OR','97204','USA','Self-Employed',101000.00,739,'Single','American','Yes','Yes','BR017','2022-10-15',NULL),
('C203','Brian','Hayes','Brian Hayes','Male','1979-12-03','720-555-3003','brian.hayes@gmail.com','203 16th St','Denver','CO','80202','USA','Employed',88000.00,724,'Married','American','Yes','Yes','BR013','2023-02-20',NULL),
('C204','Sandra','Cole','Sandra Cole','Female','1984-07-25','612-555-3004','sandra.cole@gmail.com','204 Nicollet Mall','Minneapolis','MN','55402','USA','Employed',74000.00,703,'Single','American','Yes','Yes','BR016','2023-04-14',NULL),
('C205','Raymond','West','Raymond West','Male','1975-03-14','612-555-3005','raymond.west@gmail.com','205 Hennepin Ave','Minneapolis','MN','55403','USA','Self-Employed',116000.00,754,'Married','American','Yes','Yes','BR016','2023-07-08',NULL),
('C206','Gloria','Hunt','Gloria Hunt','Female','1993-11-27','416-555-3006','gloria.hunt@gmail.com','206 Bay St','Toronto','ON','M5J 2T3','USA','Employed',69000.00,688,'Single','American','Yes','Yes','BR019','2023-09-22',NULL),
-- ── UK +16 ─────────────────────────────────────────────────
('C207','Oliver','Bennett','Oliver Bennett','Male','1984-03-08','44-20-555-3007','oliver.bennett@gmail.com','207 Oxford St','London','ENG','W1C 1JN','United Kingdom','Employed',94000.00,742,'Married','British','Yes','Yes','BR018','2022-05-14',NULL),
('C208','Charlotte','Davies','Charlotte Davies','Female','1989-08-21','44-20-555-3008','charlotte.davies@gmail.com','208 Baker St','London','ENG','NW1 6XE','United Kingdom','Employed',79000.00,719,'Single','British','Yes','Yes','BR018','2022-07-28',NULL),
('C209','George','Wilson','George Wilson','Male','1976-01-14','44-20-555-3009','george.wilson@gmail.com','209 Regent St','London','ENG','W1B 2HH','United Kingdom','Self-Employed',138000.00,768,'Married','British','Yes','Yes','BR018','2022-09-12',NULL),
('C210','Emily','Taylor','Emily Taylor','Female','1991-06-27','44-20-555-3010','emily.taylor@gmail.com','210 Bond St','London','ENG','W1S 2TF','United Kingdom','Employed',85000.00,725,'Single','British','Yes','Yes','BR018','2022-11-05',NULL),
('C211','Harry','Johnson','Harry Johnson','Male','1979-11-10','44-20-555-3011','harry.johnson@gmail.com','211 Kings Rd','London','ENG','SW3 5UR','United Kingdom','Employed',97000.00,738,'Married','British','Yes','Yes','BR018','2023-01-19',NULL),
('C212','Sophia','White','Sophia White','Female','1994-04-23','44-20-555-3012','sophia.white@gmail.com','212 Portobello Rd','London','ENG','W11 2DY','United Kingdom','Employed',70000.00,695,'Single','British','Yes','Yes','BR018','2023-03-14',NULL),
('C213','Jack','Brown','Jack Brown','Male','1987-09-06','44-20-555-3013','jack.brown@gmail.com','213 Carnaby St','London','ENG','W1F 7PW','United Kingdom','Self-Employed',121000.00,759,'Married','British','Yes','Yes','BR018','2023-05-28',NULL),
('C214','Isabella','Jones','Isabella Jones','Female','1982-02-19','44-20-555-3014','isabella.jones@gmail.com','214 Sloane St','London','ENG','SW1X 9NP','United Kingdom','Employed',89000.00,728,'Single','British','Yes','Yes','BR018','2023-07-11',NULL),
('C215','Ethan','Williams','Ethan Williams','Male','1975-07-02','44-20-555-3015','ethan.williams@gmail.com','215 Fulham Rd','London','ENG','SW6 1HS','United Kingdom','Employed',103000.00,746,'Married','British','Yes','Yes','BR018','2023-09-03',NULL),
('C216','Mia','Robinson','Mia Robinson','Female','1993-12-15','44-20-555-3016','mia.robinson@gmail.com','216 Notting Hill Gate','London','ENG','W11 3JE','United Kingdom','Employed',66000.00,685,'Single','British','Yes','Yes','BR018','2023-10-27',NULL),
('C217','Liam','Clark','Liam Clark','Male','1988-05-28','44-20-555-3017','liam.clark@gmail.com','217 Kensington High St','London','ENG','W8 4PT','United Kingdom','Self-Employed',129000.00,763,'Married','British','Yes','Yes','BR018','2023-12-11',NULL),
('C218','Amelia','Lewis','Amelia Lewis','Female','1983-10-11','44-20-555-3018','amelia.lewis@gmail.com','218 Chelsea Bridge Rd','London','ENG','SW1W 8RH','United Kingdom','Employed',78000.00,716,'Single','British','Yes','Yes','BR018','2024-01-24',NULL),
('C219','Noah','Hall','Noah Hall','Male','1978-03-24','44-20-555-3019','noah.hall@gmail.com','219 Victoria St','London','ENG','SW1E 5NE','United Kingdom','Employed',94000.00,733,'Married','British','Yes','Yes','BR018','2024-02-08',NULL),
('C220','Grace','Evans','Grace Evans','Female','1990-08-07','44-20-555-3020','grace.evans@gmail.com','220 Bishopsgate','London','ENG','EC2N 4AJ','United Kingdom','Self-Employed',112000.00,751,'Single','British','Yes','Yes','BR018','2024-03-22',NULL),
('C221','Henry','Thomas','Henry Thomas','Male','1985-01-30','44-20-555-3021','henry.thomas@gmail.com','221 Threadneedle St','London','ENG','EC2R 8HP','United Kingdom','Employed',91000.00,731,'Married','British','Yes','Yes','BR018','2024-04-05',NULL),
('C222','Poppy','Martin','Poppy Martin','Female','1997-06-13','44-20-555-3022','poppy.martin@gmail.com','222 Canary Wharf','London','ENG','E14 5AB','United Kingdom','Employed',68000.00,692,'Single','British','Yes','Yes','BR018','2024-04-18',NULL),
-- ── CANADA +17 ─────────────────────────────────────────────
('C223','Michael','Thompson','Michael Thompson','Male','1982-08-27','416-555-3023','michael.thompson@gmail.com','223 Bay St','Toronto','ON','M5J 2T3','Canada','Employed',89000.00,728,'Married','Canadian','Yes','Yes','BR019','2022-06-11',NULL),
('C224','Jennifer','MacDonald','Jennifer MacDonald','Female','1987-01-10','416-555-3024','jennifer.macdonald@gmail.com','224 King St W','Toronto','ON','M5H 1J9','Canada','Self-Employed',114000.00,753,'Single','Canadian','Yes','Yes','BR019','2022-08-25',NULL),
('C225','Robert','OBrien','Robert OBrien','Male','1976-06-23','416-555-3025','robert.obrien@gmail.com','225 Queen St W','Toronto','ON','M5V 2A8','Canada','Employed',95000.00,736,'Married','Canadian','Yes','Yes','BR019','2022-11-09',NULL),
('C226','Sarah','Tremblay','Sarah Tremblay','Female','1993-11-06','416-555-3026','sarah.tremblay@gmail.com','226 Yonge St','Toronto','ON','M4W 2L2','Canada','Employed',68000.00,688,'Single','Canadian','Yes','Yes','BR019','2023-01-23',NULL),
('C227','David','Leblanc','David Leblanc','Male','1985-04-19','416-555-3027','david.leblanc@gmail.com','227 Bloor St W','Toronto','ON','M5S 1M8','Canada','Employed',83000.00,719,'Married','Canadian','Yes','Yes','BR019','2023-03-09',NULL),
('C228','Amanda','Martin','Amanda Martin','Female','1980-09-02','416-555-3028','amanda.martin@gmail.com','228 Dundas St W','Toronto','ON','M5T 1H4','Canada','Self-Employed',106000.00,747,'Single','Canadian','Yes','Yes','BR019','2023-05-23',NULL),
('C229','Christopher','Roy','Christopher Roy','Male','1977-02-15','416-555-3029','christopher.roy@gmail.com','229 College St','Toronto','ON','M6G 1B5','Canada','Employed',97000.00,738,'Married','Canadian','Yes','Yes','BR019','2023-07-07',NULL),
('C230','Michelle','Gagnon','Michelle Gagnon','Female','1992-07-28','416-555-3030','michelle.gagnon@gmail.com','230 Spadina Ave','Toronto','ON','M5T 2C2','Canada','Employed',73000.00,705,'Single','Canadian','Yes','Yes','BR019','2023-09-20',NULL),
('C231','Kevin','Bouchard','Kevin Bouchard','Male','1984-12-11','416-555-3031','kevin.bouchard@gmail.com','231 Bathurst St','Toronto','ON','M5T 2R8','Canada','Employed',87000.00,725,'Married','Canadian','Yes','Yes','BR019','2023-11-04',NULL),
('C232','Patricia','Cote','Patricia Cote','Female','1979-05-24','416-555-3032','patricia.cote@gmail.com','232 Dufferin St','Toronto','ON','M6H 4B5','Canada','Self-Employed',120000.00,760,'Single','Canadian','Yes','Yes','BR019','2023-12-18',NULL),
('C233','Daniel','Lavoie','Daniel Lavoie','Male','1988-10-07','613-555-3033','daniel.lavoie@gmail.com','233 Elgin St','Ottawa','ON','K2P 1L4','Canada','Employed',80000.00,716,'Married','Canadian','Yes','Yes','BR019','2024-01-01',NULL),
('C234','Stephanie','Belanger','Stephanie Belanger','Female','1983-03-20','514-555-3034','stephanie.belanger@gmail.com','234 Rue Ste Catherine','Montreal','QC','H3B 1A2','Canada','Employed',75000.00,709,'Single','Canadian','Yes','Yes','BR019','2024-01-15',NULL),
('C235','Matthew','Ouellet','Matthew Ouellet','Male','1975-08-03','604-555-3035','matthew.ouellet@gmail.com','235 Granville St','Vancouver','BC','V6C 1T2','Canada','Self-Employed',129000.00,765,'Married','Canadian','Yes','Yes','BR019','2024-02-09',NULL),
('C236','Ashley','Morin','Ashley Morin','Female','1991-01-16','403-555-3036','ashley.morin@gmail.com','236 8th Ave SW','Calgary','AB','T2P 1B5','Canada','Employed',69000.00,692,'Single','Canadian','Yes','Yes','BR019','2024-02-23',NULL),
('C237','Tyler','Gauthier','Tyler Gauthier','Male','1986-06-29','780-555-3037','tyler.gauthier@gmail.com','237 Jasper Ave','Edmonton','AB','T5J 1S8','Canada','Employed',84000.00,722,'Married','Canadian','Yes','Yes','BR019','2024-03-08',NULL),
('C238','Nicole','Pelletier','Nicole Pelletier','Female','1989-11-12','902-555-3038','nicole.pelletier@gmail.com','238 Barrington St','Halifax','NS','B3J 1Z5','Canada','Employed',71000.00,699,'Single','Canadian','Yes','Yes','BR019','2024-03-22',NULL),
('C239','Marc','Lacroix','Marc Lacroix','Male','1981-04-25','204-555-3039','marc.lacroix@gmail.com','239 Portage Ave','Winnipeg','MB','R3B 2E9','Canada','Self-Employed',98000.00,741,'Married','Canadian','Yes','Yes','BR019','2024-04-05',NULL),
-- ── MEXICO +17 ─────────────────────────────────────────────
('C240','Carlos','Gonzalez','Carlos Gonzalez','Male','1981-09-12','52-55-555-3040','carlos.gonzalez@gmail.com','240 Paseo de la Reforma','Mexico City','CDMX','06600','Mexico','Employed',75000.00,705,'Married','Mexican','Yes','Yes','BR020','2022-05-26',NULL),
('C241','Lucia','Martinez','Lucia Martinez','Female','1986-02-25','52-55-555-3041','lucia.martinez@gmail.com','241 Insurgentes Sur','Mexico City','CDMX','03810','Mexico','Self-Employed',99000.00,740,'Single','Mexican','Yes','Yes','BR020','2022-08-10',NULL),
('C242','Alejandro','Rodriguez','Alejandro Rodriguez','Male','1977-07-08','52-55-555-3042','alejandro.rodriguez@gmail.com','242 Polanco','Mexico City','CDMX','11560','Mexico','Employed',87000.00,724,'Married','Mexican','Yes','Yes','BR020','2022-10-24',NULL),
('C243','Valentina','Lopez','Valentina Lopez','Female','1993-12-21','52-55-555-3043','valentina.lopez@gmail.com','243 Condesa','Mexico City','CDMX','06140','Mexico','Employed',64000.00,679,'Single','Mexican','Yes','Yes','BR020','2023-01-09',NULL),
('C244','Miguel','Hernandez','Miguel Hernandez','Male','1984-05-04','52-55-555-3044','miguel.hernandez@gmail.com','244 Roma Norte','Mexico City','CDMX','06700','Mexico','Employed',80000.00,715,'Married','Mexican','Yes','Yes','BR020','2023-03-25',NULL),
('C245','Sofia','Ramirez','Sofia Ramirez','Female','1979-10-17','52-55-555-3045','sofia.ramirez@gmail.com','245 Santa Fe','Mexico City','CDMX','05348','Mexico','Self-Employed',113000.00,752,'Single','Mexican','Yes','Yes','BR020','2023-06-07',NULL),
('C246','Javier','Torres','Javier Torres','Male','1988-03-30','52-33-555-3046','javier.torres@gmail.com','246 Av Lopez Mateos','Guadalajara','JAL','44648','Mexico','Employed',83000.00,720,'Married','Mexican','Yes','Yes','BR020','2023-08-21',NULL),
('C247','Diana','Flores','Diana Flores','Female','1983-09-13','52-81-555-3047','diana.flores@gmail.com','247 Av Constitucion','Monterrey','NL','64000','Mexico','Employed',72000.00,702,'Single','Mexican','Yes','Yes','BR020','2023-10-04',NULL),
('C248','Eduardo','Diaz','Eduardo Diaz','Male','1975-02-26','52-55-555-3048','eduardo.diaz@gmail.com','248 Centro Historico','Mexico City','CDMX','06010','Mexico','Self-Employed',125000.00,763,'Married','Mexican','Yes','Yes','BR020','2023-11-18',NULL),
('C249','Gabriela','Morales','Gabriela Morales','Female','1992-07-11','52-55-555-3049','gabriela.morales@gmail.com','249 Napoles','Mexico City','CDMX','03810','Mexico','Employed',68000.00,689,'Single','Mexican','Yes','Yes','BR020','2023-12-02',NULL),
('C250','Ricardo','Jimenez','Ricardo Jimenez','Male','1987-12-24','52-55-555-3050','ricardo.jimenez@gmail.com','250 Del Valle','Mexico City','CDMX','03100','Mexico','Employed',89000.00,728,'Married','Mexican','Yes','Yes','BR020','2024-01-16',NULL),
('C251','Isabela','Vargas','Isabela Vargas','Female','1990-05-07','52-55-555-3051','isabela.vargas@gmail.com','251 Lomas de Chapultepec','Mexico City','CDMX','11000','Mexico','Self-Employed',107000.00,748,'Single','Mexican','Yes','Yes','BR020','2024-02-01',NULL),
('C252','Fernando','Castro','Fernando Castro','Male','1978-10-20','52-55-555-3052','fernando.castro@gmail.com','252 Satelite','Naucalpan','MEX','53100','Mexico','Employed',76000.00,711,'Married','Mexican','Yes','Yes','BR020','2024-02-15',NULL),
('C253','Camila','Mendoza','Camila Mendoza','Female','1995-03-03','52-55-555-3053','camila.mendoza@gmail.com','253 Coyoacan','Mexico City','CDMX','04100','Mexico','Employed',61000.00,672,'Single','Mexican','Yes','Yes','BR020','2024-03-01',NULL),
('C254','Hugo','Reyes','Hugo Reyes','Male','1983-08-16','52-33-555-3054','hugo.reyes@gmail.com','254 Zapopan','Guadalajara','JAL','45100','Mexico','Employed',84000.00,721,'Married','Mexican','Yes','Yes','BR020','2024-03-15',NULL),
('C255','Mariana','Gutierrez','Mariana Gutierrez','Female','1988-01-29','52-81-555-3055','mariana.gutierrez@gmail.com','255 San Pedro','Monterrey','NL','66220','Mexico','Self-Employed',111000.00,750,'Single','Mexican','Yes','Yes','BR020','2024-03-29',NULL),
('C256','Luis','Aguilar','Luis Aguilar','Male','1980-06-12','52-55-555-3056','luis.aguilar@gmail.com','256 Tlalpan','Mexico City','CDMX','14000','Mexico','Employed',79000.00,714,'Married','Mexican','Yes','Yes','BR020','2024-04-12',NULL),
-- ── GERMANY +13 ────────────────────────────────────────────
('C257','Klaus','Hoffmann','Klaus Hoffmann','Male','1981-06-07','49-30-555-3057','klaus.hoffmann@gmail.com','257 Unter den Linden','Berlin','BER','10117','Germany','Employed',99000.00,757,'Married','German','Yes','Yes','BR018','2022-06-20',NULL),
('C258','Petra','Schmidt','Petra Schmidt','Female','1986-11-20','49-30-555-3058','petra.schmidt@gmail.com','258 Kurfurstendamm','Berlin','BER','10719','Germany','Self-Employed',123000.00,769,'Single','German','Yes','Yes','BR018','2022-09-04',NULL),
('C259','Hans','Weber','Hans Weber','Male','1977-04-03','49-89-555-3059','hans.weber@gmail.com','259 Maximilianstr','Munich','BAY','80539','Germany','Employed',105000.00,752,'Married','German','Yes','Yes','BR018','2022-11-18',NULL),
('C260','Greta','Fischer','Greta Fischer','Female','1992-09-16','49-40-555-3060','greta.fischer@gmail.com','260 Jungfernstieg','Hamburg','HH','20354','Germany','Employed',80000.00,724,'Single','German','Yes','Yes','BR018','2023-02-01',NULL),
('C261','Dieter','Schulz','Dieter Schulz','Male','1975-02-27','49-69-555-3061','dieter.schulz@gmail.com','261 Zeil','Frankfurt','HE','60313','Germany','Self-Employed',139000.00,773,'Married','German','Yes','Yes','BR018','2023-04-17',NULL),
('C262','Heike','Wagner','Heike Wagner','Female','1988-07-12','49-711-555-3062','heike.wagner@gmail.com','262 Konigstr','Stuttgart','BW','70173','Germany','Employed',87000.00,735,'Single','German','Yes','Yes','BR018','2023-07-01',NULL),
('C263','Stefan','Becker','Stefan Becker','Male','1983-12-25','49-221-555-3063','stefan.becker@gmail.com','263 Hohe Str','Cologne','NW','50667','Germany','Employed',94000.00,743,'Married','German','Yes','Yes','BR018','2023-09-15',NULL),
('C264','Anna','Muller','Anna Muller','Female','1990-05-08','49-30-555-3064','anna.muller@gmail.com','264 Alexanderplatz','Berlin','BER','10178','Germany','Employed',76000.00,714,'Single','German','Yes','Yes','BR018','2023-11-29',NULL),
('C265','Thomas','Braun','Thomas Braun','Male','1978-10-21','49-89-555-3065','thomas.braun@gmail.com','265 Marienplatz','Munich','BAY','80331','Germany','Self-Employed',132000.00,766,'Married','German','Yes','Yes','BR018','2024-01-12',NULL),
('C266','Ursula','Klein','Ursula Klein','Female','1985-03-14','49-40-555-3066','ursula.klein@gmail.com','266 Reeperbahn','Hamburg','HH','20359','Germany','Employed',84000.00,726,'Single','German','Yes','Yes','BR018','2024-02-26',NULL),
('C267','Werner','Wolf','Werner Wolf','Male','1972-08-27','49-69-555-3067','werner.wolf@gmail.com','267 Sachsenhausen','Frankfurt','HE','60594','Germany','Employed',96000.00,742,'Married','German','Yes','Yes','BR018','2024-03-11',NULL),
('C268','Monika','Koch','Monika Koch','Female','1995-01-10','49-211-555-3068','monika.koch@gmail.com','268 Konigsallee','Dusseldorf','NW','40212','Germany','Employed',71000.00,703,'Single','German','Yes','Yes','BR018','2024-03-25',NULL),
('C269','Jurgen','Richter','Jurgen Richter','Male','1980-06-23','49-341-555-3069','jurgen.richter@gmail.com','269 Karl-Marx-Platz','Leipzig','SN','04107','Germany','Self-Employed',118000.00,758,'Married','German','Yes','Yes','BR018','2024-04-08',NULL),
-- ── CHINA +10 ──────────────────────────────────────────────
('C270','Mingzhi','Liu','Mingzhi Liu','Male','1982-07-20','86-10-555-3070','mingzhi.liu@gmail.com','270 Wangfujing','Beijing','BJ','100006','China','Employed',89000.00,727,'Married','Chinese','Yes','Yes','BR018','2022-07-03',NULL),
('C271','Xiaoling','Chen','Xiaoling Chen','Female','1987-12-03','86-21-555-3071','xiaoling.chen@gmail.com','271 Nanjing Rd','Shanghai','SH','200001','China','Self-Employed',117000.00,758,'Single','Chinese','Yes','Yes','BR018','2022-10-17',NULL),
('C272','Bowen','Wang','Bowen Wang','Male','1976-05-16','86-10-555-3072','bowen.wang@gmail.com','272 Chang An Ave','Beijing','BJ','100032','China','Employed',98000.00,742,'Married','Chinese','Yes','Yes','BR018','2023-01-31',NULL),
('C273','Yanling','Zhao','Yanling Zhao','Female','1993-10-29','86-20-555-3073','yanling.zhao@gmail.com','273 Beijing Rd','Guangzhou','GD','510030','China','Employed',73000.00,707,'Single','Chinese','Yes','Yes','BR018','2023-05-15',NULL),
('C274','Jianhao','Li','Jianhao Li','Male','1985-03-12','86-21-555-3074','jianhao.li@gmail.com','274 Huaihai Rd','Shanghai','SH','200031','China','Employed',85000.00,724,'Married','Chinese','Yes','Yes','BR018','2023-08-29',NULL),
('C275','Meiling','Zhang','Meiling Zhang','Female','1980-08-25','86-28-555-3075','meiling.zhang@gmail.com','275 Chunxi Rd','Chengdu','SC','610016','China','Self-Employed',122000.00,763,'Single','Chinese','Yes','Yes','BR018','2023-11-12',NULL),
('C276','Hao','Sun','Hao Sun','Male','1979-01-08','86-10-555-3076','hao.sun@gmail.com','276 Financial St','Beijing','BJ','100033','China','Employed',104000.00,748,'Married','Chinese','Yes','Yes','BR018','2024-01-26',NULL),
('C277','Jing','Wu','Jing Wu','Female','1994-06-21','86-21-555-3077','jing.wu@gmail.com','277 Xintiandi','Shanghai','SH','200021','China','Employed',69000.00,695,'Single','Chinese','Yes','Yes','BR018','2024-02-09',NULL),
('C278','Yong','Ma','Yong Ma','Male','1983-11-04','86-571-555-3078','yong.ma@gmail.com','278 West Lake','Hangzhou','ZJ','310002','China','Self-Employed',128000.00,764,'Married','Chinese','Yes','Yes','BR018','2024-03-25',NULL),
('C279','Fang','Lin','Fang Lin','Female','1991-04-17','86-22-555-3079','fang.lin@gmail.com','279 Binhai New Area','Tianjin','TJ','300457','China','Employed',77000.00,715,'Single','Chinese','Yes','Yes','BR018','2024-04-08',NULL),
-- ── FRANCE +12 ─────────────────────────────────────────────
('C280','Jean','Lefevre','Jean Lefevre','Male','1980-03-18','33-1-555-3080','jean.lefevre@gmail.com','280 Rue de Rivoli','Paris','IDF','75001','France','Employed',92000.00,740,'Married','French','Yes','Yes','BR018','2022-06-12',NULL),
('C281','Marie','Dupont','Marie Dupont','Female','1985-08-31','33-1-555-3081','marie.dupont@gmail.com','281 Avenue Montaigne','Paris','IDF','75008','France','Self-Employed',120000.00,762,'Single','French','Yes','Yes','BR018','2022-09-26',NULL),
('C282','Antoine','Bernard','Antoine Bernard','Male','1978-02-14','33-1-555-3082','antoine.bernard@gmail.com','282 Boulevard Haussmann','Paris','IDF','75008','France','Employed',98000.00,744,'Married','French','Yes','Yes','BR018','2022-12-11',NULL),
('C283','Claire','Moreau','Claire Moreau','Female','1993-07-27','33-1-555-3083','claire.moreau@gmail.com','283 Rue du Faubourg','Paris','IDF','75008','France','Employed',73000.00,707,'Single','French','Yes','Yes','BR018','2023-03-26',NULL),
('C284','Francois','Laurent','Francois Laurent','Male','1987-01-10','33-4-555-3084','francois.laurent@gmail.com','284 La Canebiere','Marseille','PAC','13001','France','Employed',85000.00,727,'Married','French','Yes','Yes','BR018','2023-06-09',NULL),
('C285','Isabelle','Simon','Isabelle Simon','Female','1982-06-23','33-4-555-3085','isabelle.simon@gmail.com','285 Rue de la Republique','Lyon','ARA','69001','France','Self-Employed',109000.00,750,'Single','French','Yes','Yes','BR018','2023-08-24',NULL),
('C286','Pierre','Girard','Pierre Girard','Male','1975-11-06','33-1-555-3086','pierre.girard@gmail.com','286 Champs Elysees','Paris','IDF','75008','France','Employed',97000.00,741,'Married','French','Yes','Yes','BR018','2023-10-07',NULL),
('C287','Nathalie','Rousseau','Nathalie Rousseau','Female','1990-04-19','33-3-555-3087','nathalie.rousseau@gmail.com','287 Grande Rue','Strasbourg','GES','67000','France','Employed',74000.00,708,'Single','French','Yes','Yes','BR018','2023-11-21',NULL),
('C288','Christophe','Blanc','Christophe Blanc','Male','1983-09-02','33-5-555-3088','christophe.blanc@gmail.com','288 Rue Sainte Catherine','Bordeaux','NAQ','33000','France','Self-Employed',116000.00,757,'Married','French','Yes','Yes','BR018','2024-01-04',NULL),
('C289','Valerie','Fontaine','Valerie Fontaine','Female','1988-02-15','33-2-555-3089','valerie.fontaine@gmail.com','289 Place du Capitole','Toulouse','OCC','31000','France','Employed',81000.00,720,'Single','French','Yes','Yes','BR018','2024-02-18',NULL),
('C290','Nicolas','Garnier','Nicolas Garnier','Male','1977-07-28','33-3-555-3090','nicolas.garnier@gmail.com','290 Place Bellecour','Lyon','ARA','69002','France','Employed',89000.00,729,'Married','French','Yes','Yes','BR018','2024-03-03',NULL),
('C291','Sylvie','Chevalier','Sylvie Chevalier','Female','1995-12-11','33-1-555-3091','sylvie.chevalier@gmail.com','291 Rue de la Paix','Paris','IDF','75002','France','Employed',67000.00,687,'Single','French','Yes','Yes','BR018','2024-04-17',NULL),
-- ── ITALY +12 ──────────────────────────────────────────────
('C292','Marco','Ricci','Marco Ricci','Male','1981-04-06','39-02-555-3092','marco.ricci@gmail.com','292 Via Dante','Milan','MI','20121','Italy','Employed',90000.00,734,'Married','Italian','Yes','Yes','BR018','2022-07-21',NULL),
('C293','Giulia','Conti','Giulia Conti','Female','1986-09-19','39-02-555-3093','giulia.conti@gmail.com','293 Via Manzoni','Milan','MI','20121','Italy','Self-Employed',114000.00,753,'Single','Italian','Yes','Yes','BR018','2022-10-04',NULL),
('C294','Alessandro','Esposito','Alessandro Esposito','Male','1977-02-02','39-081-555-3094','alessandro.esposito@gmail.com','294 Via Toledo','Naples','NA','80132','Italy','Employed',77000.00,715,'Married','Italian','Yes','Yes','BR018','2022-12-19',NULL),
('C295','Valentina','Russo','Valentina Russo','Female','1992-07-15','39-06-555-3095','valentina.russo@gmail.com','295 Via del Corso','Rome','RM','00186','Italy','Employed',69000.00,694,'Single','Italian','Yes','Yes','BR018','2023-03-04',NULL),
('C296','Matteo','Gallo','Matteo Gallo','Male','1985-12-28','39-055-555-3096','matteo.gallo@gmail.com','296 Via Tornabuoni','Florence','FI','50123','Italy','Employed',83000.00,722,'Married','Italian','Yes','Yes','BR018','2023-05-18',NULL),
('C297','Francesca','Marino','Francesca Marino','Female','1979-05-11','39-02-555-3097','francesca.marino@gmail.com','297 Via Montenapoleone','Milan','MI','20121','Italy','Self-Employed',125000.00,765,'Single','Italian','Yes','Yes','BR018','2023-08-01',NULL),
('C298','Davide','Ferrari','Davide Ferrari','Male','1974-10-24','39-011-555-3098','davide.ferrari@gmail.com','298 Via Roma','Turin','TO','10121','Italy','Employed',91000.00,733,'Married','Italian','Yes','Yes','BR018','2023-10-15',NULL),
('C299','Chiara','Bruno','Chiara Bruno','Female','1991-03-07','39-091-555-3099','chiara.bruno@gmail.com','299 Via Maqueda','Palermo','PA','90133','Italy','Employed',65000.00,684,'Single','Italian','Yes','Yes','BR018','2023-12-29',NULL),
('C300','Luca','Moretti','Luca Moretti','Male','1984-08-20','39-051-555-3100','luca.moretti@gmail.com','300 Via Indipendenza','Bologna','BO','40121','Italy','Self-Employed',118000.00,756,'Married','Italian','Yes','Yes','BR018','2024-01-13',NULL),
('C301','Elena','Lombardi','Elena Lombardi','Female','1989-01-03','39-02-555-3101','elena.lombardi@gmail.com','301 Via Brera','Milan','MI','20121','Italy','Employed',78000.00,716,'Single','Italian','Yes','Yes','BR018','2024-02-26',NULL),
('C302','Roberto','Rizzo','Roberto Rizzo','Male','1976-06-16','39-06-555-3102','roberto.rizzo@gmail.com','302 Via Veneto','Rome','RM','00187','Italy','Employed',94000.00,736,'Married','Italian','Yes','Yes','BR018','2024-03-12',NULL),
('C303','Silvia','Barbieri','Silvia Barbieri','Female','1997-11-29','39-02-555-3103','silvia.barbieri@gmail.com','303 Navigli','Milan','MI','20144','Italy','Employed',62000.00,674,'Single','Italian','Yes','Yes','BR018','2024-04-25',NULL),
-- ── UAE +13 ────────────────────────────────────────────────
('C304','Ahmed','Al-Maktoum','Ahmed Al-Maktoum','Male','1980-08-24','971-4-555-3104','ahmed.almaktoum@gmail.com','304 Sheikh Zayed Rd','Dubai','DXB','00000','UAE','Self-Employed',146000.00,772,'Married','Emirati','Yes','Yes','BR018','2022-05-08',NULL),
('C305','Fatima','Al-Rashidi','Fatima Al-Rashidi','Female','1985-01-07','971-4-555-3105','fatima.alrashidi@gmail.com','305 Downtown Dubai','Dubai','DXB','00000','UAE','Employed',119000.00,757,'Single','Emirati','Yes','Yes','BR018','2022-07-22',NULL),
('C306','Khalid','Al-Mansoori','Khalid Al-Mansoori','Male','1978-06-20','971-4-555-3106','khalid.almansoori@gmail.com','306 Business Bay','Dubai','DXB','00000','UAE','Self-Employed',163000.00,779,'Married','Emirati','Yes','Yes','BR018','2022-10-05',NULL),
('C307','Mariam','Al-Qasimi','Mariam Al-Qasimi','Female','1991-11-03','971-4-555-3107','mariam.alqasimi@gmail.com','307 JLT','Dubai','DXB','00000','UAE','Employed',98000.00,742,'Single','Emirati','Yes','Yes','BR018','2023-01-20',NULL),
('C308','Rashid','Al-Nuaimi','Rashid Al-Nuaimi','Male','1983-04-16','971-4-555-3108','rashid.alnuaimi@gmail.com','308 Media City','Dubai','DXB','00000','UAE','Self-Employed',139000.00,765,'Married','Emirati','Yes','Yes','BR018','2023-04-04',NULL),
('C309','Noor','Al-Hamdan','Noor Al-Hamdan','Female','1988-09-29','971-4-555-3109','noor.alhamdan@gmail.com','309 Marina Walk','Dubai','DXB','00000','UAE','Employed',105000.00,749,'Single','Emirati','Yes','Yes','BR018','2023-06-18',NULL),
('C310','Sultan','Al-Ketbi','Sultan Al-Ketbi','Male','1975-02-12','971-2-555-3110','sultan.alketbi@gmail.com','310 Corniche Rd','Abu Dhabi','AZ','00000','UAE','Self-Employed',172000.00,782,'Married','Emirati','Yes','Yes','BR018','2023-08-01',NULL),
('C311','Latifa','Al-Suwaidi','Latifa Al-Suwaidi','Female','1993-07-25','971-4-555-3111','latifa.alsuwaidi@gmail.com','311 Palm Jumeirah','Dubai','DXB','00000','UAE','Employed',112000.00,753,'Single','Emirati','Yes','Yes','BR018','2023-10-15',NULL),
('C312','Hamad','Al-Zaabi','Hamad Al-Zaabi','Male','1982-12-08','971-4-555-3112','hamad.alzaabi@gmail.com','312 DIFC','Dubai','DXB','00000','UAE','Self-Employed',148000.00,771,'Married','Emirati','Yes','Yes','BR018','2023-12-29',NULL),
('C313','Shaikha','Al-Muhairi','Shaikha Al-Muhairi','Female','1987-05-21','971-2-555-3113','shaikha.almuhairi@gmail.com','313 Khalidiyah','Abu Dhabi','AZ','00000','UAE','Employed',96000.00,740,'Single','Emirati','Yes','Yes','BR018','2024-01-12',NULL),
('C314','Saeed','Al-Mazrouei','Saeed Al-Mazrouei','Male','1979-10-04','971-4-555-3114','saeed.almazrouei@gmail.com','314 Deira','Dubai','DXB','00000','UAE','Employed',121000.00,758,'Married','Emirati','Yes','Yes','BR018','2024-02-25',NULL),
('C315','Hessa','Al-Falasi','Hessa Al-Falasi','Female','1994-03-17','971-4-555-3115','hessa.alfalasi@gmail.com','315 Bur Dubai','Dubai','DXB','00000','UAE','Employed',88000.00,731,'Single','Emirati','Yes','Yes','BR018','2024-03-10',NULL),
('C316','Mansoor','Al-Bloushi','Mansoor Al-Bloushi','Male','1986-08-30','971-4-555-3116','mansoor.albloushi@gmail.com','316 Jumeirah','Dubai','DXB','00000','UAE','Self-Employed',155000.00,774,'Married','Emirati','Yes','Yes','BR018','2024-04-23',NULL),
-- ── JAPAN +13 ──────────────────────────────────────────────
('C317','Kenji','Yamamoto','Kenji Yamamoto','Male','1982-12-12','81-3-555-3117','kenji.yamamoto@gmail.com','317 Ginza 4-chome','Tokyo','TKY','104-0061','Japan','Employed',97000.00,740,'Married','Japanese','Yes','Yes','BR018','2022-06-26',NULL),
('C318','Yuki','Nakamura','Yuki Nakamura','Female','1987-05-25','81-3-555-3118','yuki.nakamura@gmail.com','318 Shinjuku 3-chome','Tokyo','TKY','160-0022','Japan','Employed',80000.00,718,'Single','Japanese','Yes','Yes','BR018','2022-09-09',NULL),
('C319','Takeshi','Suzuki','Takeshi Suzuki','Male','1976-10-08','81-6-555-3119','takeshi.suzuki@gmail.com','319 Midosuji','Osaka','OSA','542-0086','Japan','Self-Employed',125000.00,762,'Married','Japanese','Yes','Yes','BR018','2022-11-23',NULL),
('C320','Akiko','Watanabe','Akiko Watanabe','Female','1993-03-21','81-3-555-3120','akiko.watanabe@gmail.com','320 Omotesando','Tokyo','TKY','150-0001','Japan','Employed',72000.00,702,'Single','Japanese','Yes','Yes','BR018','2023-02-06',NULL),
('C321','Daisuke','Ito','Daisuke Ito','Male','1985-08-04','81-52-555-3121','daisuke.ito@gmail.com','321 Sakae','Nagoya','AIC','460-0008','Japan','Employed',89000.00,729,'Married','Japanese','Yes','Yes','BR018','2023-04-21',NULL),
('C322','Sakura','Kato','Sakura Kato','Female','1980-01-17','81-3-555-3122','sakura.kato@gmail.com','322 Harajuku','Tokyo','TKY','150-0001','Japan','Self-Employed',112000.00,752,'Single','Japanese','Yes','Yes','BR018','2023-07-05',NULL),
('C323','Hiroki','Tanaka','Hiroki Tanaka','Male','1974-06-30','81-6-555-3123','hiroki.tanaka@gmail.com','323 Namba','Osaka','OSA','542-0076','Japan','Employed',103000.00,747,'Married','Japanese','Yes','Yes','BR018','2023-09-18',NULL),
('C324','Emi','Sato','Emi Sato','Female','1991-11-13','81-45-555-3124','emi.sato@gmail.com','324 Minato Mirai','Yokohama','KAN','220-0012','Japan','Employed',75000.00,712,'Single','Japanese','Yes','Yes','BR018','2023-12-02',NULL),
('C325','Ryota','Kobayashi','Ryota Kobayashi','Male','1984-04-26','81-11-555-3125','ryota.kobayashi@gmail.com','325 Susukino','Sapporo','HOK','064-0805','Japan','Self-Employed',119000.00,758,'Married','Japanese','Yes','Yes','BR018','2024-01-15',NULL),
('C326','Aoi','Yoshida','Aoi Yoshida','Female','1989-09-09','81-92-555-3126','aoi.yoshida@gmail.com','326 Tenjin','Fukuoka','FUK','810-0001','Japan','Employed',78000.00,716,'Single','Japanese','Yes','Yes','BR018','2024-02-28',NULL),
('C327','Shota','Hayashi','Shota Hayashi','Male','1978-02-22','81-3-555-3127','shota.hayashi@gmail.com','327 Marunouchi','Tokyo','TKY','100-0005','Japan','Employed',95000.00,738,'Married','Japanese','Yes','Yes','BR018','2024-03-13',NULL),
('C328','Nana','Kimura','Nana Kimura','Female','1996-07-05','81-3-555-3128','nana.kimura@gmail.com','328 Akihabara','Tokyo','TKY','101-0021','Japan','Employed',64000.00,683,'Single','Japanese','Yes','Yes','BR018','2024-03-27',NULL),
('C329','Kazuki','Inoue','Kazuki Inoue','Male','1981-12-18','81-6-555-3129','kazuki.inoue@gmail.com','329 Shinsaibashi','Osaka','OSA','542-0085','Japan','Self-Employed',131000.00,767,'Married','Japanese','Yes','Yes','BR018','2024-04-10',NULL),
-- ── SOUTH KOREA +8 ─────────────────────────────────────────
('C330','Joon','Park','Joon Park','Male','1983-04-30','82-2-555-3130','joon.park@gmail.com','330 Gangnam-daero','Seoul','SEL','06000','South Korea','Employed',92000.00,735,'Married','Korean','Yes','Yes','BR018','2022-08-14',NULL),
('C331','Ji-Young','Kim','Ji-Young Kim','Female','1988-10-13','82-2-555-3131','jiyoung.kim@gmail.com','331 Myeongdong','Seoul','SEL','04536','South Korea','Employed',77000.00,714,'Single','Korean','Yes','Yes','BR018','2022-11-28',NULL),
('C332','Sungho','Choi','Sungho Choi','Male','1977-03-26','82-2-555-3132','sungho.choi@gmail.com','332 Sinchon','Seoul','SEL','03722','South Korea','Self-Employed',119000.00,758,'Married','Korean','Yes','Yes','BR018','2023-03-13',NULL),
('C333','Hyeji','Lee','Hyeji Lee','Female','1993-08-09','82-51-555-3133','hyeji.lee@gmail.com','333 Seomyeon','Busan','BUS','47257','South Korea','Employed',68000.00,689,'Single','Korean','Yes','Yes','BR018','2023-06-27',NULL),
('C334','Minjun','Yoo','Minjun Yoo','Male','1986-01-22','82-2-555-3134','minjun.yoo@gmail.com','334 Hongdae','Seoul','SEL','04050','South Korea','Employed',85000.00,725,'Married','Korean','Yes','Yes','BR018','2023-09-10',NULL),
('C335','Jisoo','Jung','Jisoo Jung','Female','1994-06-05','82-2-555-3135','jisoo.jung@gmail.com','335 Itaewon','Seoul','SEL','04349','South Korea','Employed',72000.00,705,'Single','Korean','Yes','Yes','BR018','2023-11-24',NULL),
('C336','Hyunwoo','Shin','Hyunwoo Shin','Male','1979-11-18','82-53-555-3136','hyunwoo.shin@gmail.com','336 Dongseongno','Daegu','DAE','41921','South Korea','Self-Employed',114000.00,753,'Married','Korean','Yes','Yes','BR018','2024-02-07',NULL),
('C337','Chaeyeon','Han','Chaeyeon Han','Female','1990-04-01','82-2-555-3137','chaeyeon.han@gmail.com','337 Apgujeong','Seoul','SEL','06015','South Korea','Employed',88000.00,729,'Single','Korean','Yes','Yes','BR018','2024-04-21',NULL),
-- ── BRAZIL +6 ──────────────────────────────────────────────
('C338','Lucas','Oliveira','Lucas Oliveira','Male','1983-11-08','55-11-555-3138','lucas.oliveira@gmail.com','338 Av Paulista','Sao Paulo','SP','01310','Brazil','Employed',82000.00,718,'Married','Brazilian','Yes','Yes','BR018','2022-09-22',NULL),
('C339','Beatriz','Santos','Beatriz Santos','Female','1988-04-21','55-11-555-3139','beatriz.santos@gmail.com','339 Rua Oscar Freire','Sao Paulo','SP','01426','Brazil','Self-Employed',108000.00,749,'Single','Brazilian','Yes','Yes','BR018','2023-01-05',NULL),
('C340','Gabriel','Pereira','Gabriel Pereira','Male','1977-09-04','55-21-555-3140','gabriel.pereira@gmail.com','340 Ipanema','Rio de Janeiro','RJ','22420','Brazil','Employed',94000.00,734,'Married','Brazilian','Yes','Yes','BR018','2023-04-20',NULL),
('C341','Ana','Costa','Ana Costa','Female','1993-02-17','55-21-555-3141','ana.costa@gmail.com','341 Copacabana','Rio de Janeiro','RJ','22070','Brazil','Employed',68000.00,690,'Single','Brazilian','Yes','Yes','BR018','2023-07-04',NULL),
('C342','Rafael','Ferreira','Rafael Ferreira','Male','1986-07-30','55-31-555-3142','rafael.ferreira@gmail.com','342 Savassi','Belo Horizonte','MG','30140','Brazil','Employed',79000.00,714,'Married','Brazilian','Yes','Yes','BR018','2023-10-18',NULL),
('C343','Camila','Rodrigues','Camila Rodrigues','Female','1981-12-13','55-41-555-3143','camila.rodrigues@gmail.com','343 Batel','Curitiba','PR','80420','Brazil','Self-Employed',115000.00,754,'Single','Brazilian','Yes','Yes','BR018','2024-02-01',NULL),
-- ── INDIA +8 ───────────────────────────────────────────────
('C344','Rahul','Sharma','Rahul Sharma','Male','1981-05-15','91-22-555-3144','rahul.sharma@gmail.com','344 Nariman Point','Mumbai','MH','400021','India','Employed',85000.00,723,'Married','Indian','Yes','Yes','BR018','2022-10-29',NULL),
('C345','Ananya','Patel','Ananya Patel','Female','1986-10-28','91-80-555-3145','ananya.patel@gmail.com','345 MG Road','Bangalore','KA','560001','India','Self-Employed',110000.00,750,'Single','Indian','Yes','Yes','BR018','2023-01-14',NULL),
('C346','Vikram','Singh','Vikram Singh','Male','1978-04-11','91-11-555-3146','vikram.singh@gmail.com','346 Connaught Place','New Delhi','DL','110001','India','Employed',97000.00,739,'Married','Indian','Yes','Yes','BR018','2023-03-28',NULL),
('C347','Divya','Nair','Divya Nair','Female','1993-09-24','91-44-555-3147','divya.nair@gmail.com','347 Anna Salai','Chennai','TN','600002','India','Employed',72000.00,704,'Single','Indian','Yes','Yes','BR018','2023-06-11',NULL),
('C348','Arjun','Mehta','Arjun Mehta','Male','1985-02-07','91-40-555-3148','arjun.mehta@gmail.com','348 Banjara Hills','Hyderabad','TS','500034','India','Self-Employed',129000.00,764,'Married','Indian','Yes','Yes','BR018','2023-09-25',NULL),
('C349','Priya','Gupta','Priya Gupta','Female','1990-07-20','91-22-555-3149','priya.gupta@gmail.com','349 Bandra West','Mumbai','MH','400050','India','Employed',84000.00,723,'Single','Indian','Yes','Yes','BR018','2023-12-09',NULL),
('C350','Kiran','Rao','Kiran Rao','Male','1976-12-03','91-80-555-3150','kiran.rao@gmail.com','350 Koramangala','Bangalore','KA','560034','India','Employed',98000.00,741,'Married','Indian','Yes','Yes','BR018','2024-02-22',NULL),
('C351','Shreya','Kumar','Shreya Kumar','Female','1995-05-16','91-11-555-3151','shreya.kumar@gmail.com','351 Hauz Khas','New Delhi','DL','110016','India','Employed',69000.00,693,'Single','Indian','Yes','Yes','BR018','2024-04-07',NULL),
-- ── POLAND +3 ──────────────────────────────────────────────
('C352','Pawel','Nowak','Pawel Nowak','Male','1984-02-26','48-22-555-3152','pawel.nowak@gmail.com','352 Nowy Swiat','Warsaw','MZ','00-001','Poland','Employed',73000.00,703,'Married','Polish','Yes','Yes','BR018','2023-02-20',NULL),
('C353','Agnieszka','Kowalczyk','Agnieszka Kowalczyk','Female','1989-07-11','48-22-555-3153','agnieszka.kowalczyk@gmail.com','353 Krakowskie Przedmiescie','Warsaw','MZ','00-001','Poland','Employed',65000.00,686,'Single','Polish','Yes','Yes','BR018','2023-07-05',NULL),
('C354','Marek','Wisniewski','Marek Wisniewski','Male','1978-12-24','48-12-555-3154','marek.wisniewski@gmail.com','354 Florianska','Krakow','MA','31-019','Poland','Self-Employed',99000.00,740,'Married','Polish','Yes','Yes','BR018','2023-12-19',NULL),
-- ── EGYPT +3 ───────────────────────────────────────────────
('C355','Kareem','Ibrahim','Kareem Ibrahim','Male','1982-05-09','20-2-555-3155','kareem.ibrahim@gmail.com','355 Tahrir Square','Cairo','CAI','11511','Egypt','Employed',60000.00,663,'Married','Egyptian','Yes','Yes','BR018','2023-03-13',NULL),
('C356','Layla','Mostafa','Layla Mostafa','Female','1987-10-22','20-2-555-3156','layla.mostafa@gmail.com','356 Zamalek','Cairo','CAI','11211','Egypt','Employed',53000.00,645,'Single','Egyptian','Yes','Yes','BR018','2023-08-27',NULL),
('C357','Youssef','Khalil','Youssef Khalil','Male','1976-03-05','20-3-555-3157','youssef.khalil@gmail.com','357 Stanley Beach','Alexandria','ALX','21519','Egypt','Self-Employed',77000.00,680,'Married','Egyptian','Yes','Yes','BR018','2024-01-10',NULL),
-- ── RUSSIA +3 ──────────────────────────────────────────────
('C358','Dmitri','Volkov','Dmitri Volkov','Male','1981-06-18','7-495-555-3158','dmitri.volkov@gmail.com','358 Tverskaya St','Moscow','MOW','125009','Russia','Employed',78000.00,697,'Married','Russian','Yes','Yes','BR018','2023-04-27',NULL),
('C359','Natasha','Ivanova','Natasha Ivanova','Female','1986-11-01','7-495-555-3159','natasha.ivanova@gmail.com','359 Arbat St','Moscow','MOW','119002','Russia','Employed',69000.00,682,'Single','Russian','Yes','Yes','BR018','2023-09-10',NULL),
('C360','Sergei','Petrov','Sergei Petrov','Male','1977-04-14','7-812-555-3160','sergei.petrov@gmail.com','360 Nevsky Prospect','St Petersburg','SPB','191186','Russia','Self-Employed',95000.00,719,'Married','Russian','Yes','Yes','BR018','2024-02-24',NULL);
 

-- ============================================================
insert into accounts values
('ACC201','C201','BR017','Savings','Active','2022-06-10',NULL,24000.00,'USD',2.50,0.00,'2024-03-10','Yes','E061',NULL),
('ACC202','C202','BR017','Checking','Active','2022-10-15',NULL,16000.00,'USD',0.01,500.00,'2024-03-14','Yes','E061',NULL),
('ACC203','C203','BR013','Savings','Active','2023-02-20',NULL,31000.00,'USD',2.50,0.00,'2024-03-09','Yes','E049',NULL),
('ACC204','C204','BR016','Checking','Active','2023-04-14',NULL,14000.00,'USD',0.01,400.00,'2024-03-13','Yes','E058',NULL),
('ACC205','C205','BR016','Business','Active','2023-07-08',NULL,88000.00,'USD',1.50,2000.00,'2024-03-11','Yes','E058',NULL),
('ACC206','C206','BR019','Savings','Active','2023-09-22',NULL,19000.00,'USD',2.50,0.00,'2024-03-10','Yes','E067',NULL),
-- UK (GBP)
('ACC207','C207','BR018','Savings','Active','2022-05-14',NULL,38000.00,'GBP',2.75,0.00,'2024-03-11','Yes','E064',NULL),
('ACC208','C208','BR018','Checking','Active','2022-07-28',NULL,19000.00,'GBP',0.01,500.00,'2024-03-14','Yes','E064',NULL),
('ACC209','C209','BR018','Business','Active','2022-09-12',NULL,115000.00,'GBP',1.50,3000.00,'2024-03-12','Yes','E064',NULL),
('ACC210','C210','BR018','Savings','Active','2022-11-05',NULL,31000.00,'GBP',2.75,0.00,'2024-03-10','Yes','E064',NULL),
('ACC211','C211','BR018','Checking','Active','2023-01-19',NULL,24000.00,'GBP',0.01,500.00,'2024-03-13','Yes','E064',NULL),
('ACC212','C212','BR018','Savings','Active','2023-03-14',NULL,16000.00,'GBP',2.75,0.00,'2024-03-09','Yes','E064',NULL),
('ACC213','C213','BR018','Business','Active','2023-05-28',NULL,98000.00,'GBP',1.50,2500.00,'2024-03-12','Yes','E064',NULL),
('ACC214','C214','BR018','Savings','Active','2023-07-11',NULL,34000.00,'GBP',2.75,0.00,'2024-03-10','Yes','E064',NULL),
('ACC215','C215','BR018','Checking','Active','2023-09-03',NULL,28000.00,'GBP',0.01,500.00,'2024-03-14','Yes','E064',NULL),
('ACC216','C216','BR018','Savings','Active','2023-10-27',NULL,15000.00,'GBP',2.75,0.00,'2024-03-09','Yes','E064',NULL),
('ACC217','C217','BR018','Business','Active','2023-12-11',NULL,108000.00,'GBP',1.50,3000.00,'2024-03-12','Yes','E064',NULL),
('ACC218','C218','BR018','Savings','Active','2024-01-24',NULL,26000.00,'GBP',2.75,0.00,'2024-03-10','Yes','E064',NULL),
('ACC219','C219','BR018','Checking','Active','2024-02-08',NULL,21000.00,'GBP',0.01,500.00,'2024-03-13','Yes','E064',NULL),
('ACC220','C220','BR018','Business','Active','2024-03-22',NULL,92000.00,'GBP',1.50,2500.00,'2024-03-22','Yes','E064',NULL),
('ACC221','C221','BR018','Savings','Active','2024-04-05',NULL,35000.00,'GBP',2.75,0.00,'2024-04-05','Yes','E064',NULL),
('ACC222','C222','BR018','Checking','Active','2024-04-18',NULL,14000.00,'GBP',0.01,400.00,'2024-04-18','Yes','E064',NULL),
-- Canada (CAD)
('ACC223','C223','BR019','Savings','Active','2022-06-11',NULL,54000.00,'CAD',3.00,0.00,'2024-03-10','Yes','E067',NULL),
('ACC224','C224','BR019','Business','Active','2022-08-25',NULL,91000.00,'CAD',1.50,2500.00,'2024-03-12','Yes','E067',NULL),
('ACC225','C225','BR019','Checking','Active','2022-11-09',NULL,30000.00,'CAD',0.01,500.00,'2024-03-14','Yes','E067',NULL),
('ACC226','C226','BR019','Savings','Active','2023-01-23',NULL,19000.00,'CAD',3.00,0.00,'2024-03-09','Yes','E067',NULL),
('ACC227','C227','BR019','Checking','Active','2023-03-09',NULL,24000.00,'CAD',0.01,500.00,'2024-03-13','Yes','E067',NULL),
('ACC228','C228','BR019','Business','Active','2023-05-23',NULL,85000.00,'CAD',1.50,2000.00,'2024-03-11','Yes','E067',NULL),
('ACC229','C229','BR019','Savings','Active','2023-07-07',NULL,50000.00,'CAD',3.00,0.00,'2024-03-10','Yes','E067',NULL),
('ACC230','C230','BR019','Checking','Active','2023-09-20',NULL,21000.00,'CAD',0.01,400.00,'2024-03-14','Yes','E067',NULL),
('ACC231','C231','BR019','Savings','Active','2023-11-04',NULL,37000.00,'CAD',3.00,0.00,'2024-03-09','Yes','E067',NULL),
('ACC232','C232','BR019','Business','Active','2023-12-18',NULL,99000.00,'CAD',1.50,2500.00,'2024-03-12','Yes','E067',NULL),
('ACC233','C233','BR019','Savings','Active','2024-01-01',NULL,40000.00,'CAD',3.00,0.00,'2024-03-10','Yes','E068',NULL),
('ACC234','C234','BR019','Checking','Active','2024-01-15',NULL,23000.00,'CAD',0.01,500.00,'2024-03-13','Yes','E068',NULL),
('ACC235','C235','BR019','Business','Active','2024-02-09',NULL,107000.00,'CAD',1.50,3000.00,'2024-03-12','Yes','E068',NULL),
('ACC236','C236','BR019','Savings','Active','2024-02-23',NULL,26000.00,'CAD',3.00,0.00,'2024-03-10','Yes','E068',NULL),
('ACC237','C237','BR019','Checking','Active','2024-03-08',NULL,30000.00,'CAD',0.01,500.00,'2024-03-13','Yes','E068',NULL),
('ACC238','C238','BR019','Savings','Active','2024-03-22',NULL,22000.00,'CAD',3.00,0.00,'2024-03-22','Yes','E068',NULL),
('ACC239','C239','BR019','Business','Active','2024-04-05',NULL,82000.00,'CAD',1.50,2000.00,'2024-04-05','Yes','E068',NULL),
-- Mexico (MXN)
('ACC240','C240','BR020','Savings','Active','2022-05-26',NULL,710000.00,'MXN',5.00,0.00,'2024-03-10','Yes','E070',NULL),
('ACC241','C241','BR020','Business','Active','2022-08-10',NULL,1180000.00,'MXN',4.00,30000.00,'2024-03-12','Yes','E070',NULL),
('ACC242','C242','BR020','Savings','Active','2022-10-24',NULL,950000.00,'MXN',5.00,0.00,'2024-03-11','Yes','E070',NULL),
('ACC243','C243','BR020','Checking','Active','2023-01-09',NULL,340000.00,'MXN',0.01,10000.00,'2024-03-14','Yes','E070',NULL),
('ACC244','C244','BR020','Savings','Active','2023-03-25',NULL,780000.00,'MXN',5.00,0.00,'2024-03-09','Yes','E070',NULL),
('ACC245','C245','BR020','Business','Active','2023-06-07',NULL,1420000.00,'MXN',4.00,40000.00,'2024-03-12','Yes','E070',NULL),
('ACC246','C246','BR020','Checking','Active','2023-08-21',NULL,510000.00,'MXN',0.01,15000.00,'2024-03-13','Yes','E070',NULL),
('ACC247','C247','BR020','Savings','Active','2023-10-04',NULL,640000.00,'MXN',5.00,0.00,'2024-03-10','Yes','E070',NULL),
('ACC248','C248','BR020','Business','Active','2023-11-18',NULL,1520000.00,'MXN',4.00,45000.00,'2024-03-12','Yes','E070',NULL),
('ACC249','C249','BR020','Savings','Active','2023-12-02',NULL,540000.00,'MXN',5.00,0.00,'2024-03-09','Yes','E070',NULL),
('ACC250','C250','BR020','Checking','Active','2024-01-16',NULL,710000.00,'MXN',0.01,20000.00,'2024-03-13','Yes','E070',NULL),
('ACC251','C251','BR020','Business','Active','2024-02-01',NULL,1090000.00,'MXN',4.00,30000.00,'2024-03-12','Yes','E070',NULL),
('ACC252','C252','BR020','Savings','Active','2024-02-15',NULL,660000.00,'MXN',5.00,0.00,'2024-03-10','Yes','E070',NULL),
('ACC253','C253','BR020','Checking','Active','2024-03-01',NULL,320000.00,'MXN',0.01,10000.00,'2024-03-13','Yes','E070',NULL),
('ACC254','C254','BR020','Savings','Active','2024-03-15',NULL,730000.00,'MXN',5.00,0.00,'2024-03-15','Yes','E070',NULL),
('ACC255','C255','BR020','Business','Active','2024-03-29',NULL,1140000.00,'MXN',4.00,35000.00,'2024-03-29','Yes','E070',NULL),
('ACC256','C256','BR020','Checking','Active','2024-04-12',NULL,490000.00,'MXN',0.01,15000.00,'2024-04-12','Yes','E070',NULL),
-- Germany (EUR)
('ACC257','C257','BR018','Savings','Active','2022-06-20',NULL,44000.00,'EUR',2.50,0.00,'2024-03-11','Yes','E065',NULL),
('ACC258','C258','BR018','Business','Active','2022-09-04',NULL,102000.00,'EUR',1.50,2500.00,'2024-03-12','Yes','E065',NULL),
('ACC259','C259','BR018','Savings','Active','2022-11-18',NULL,58000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC260','C260','BR018','Checking','Active','2023-02-01',NULL,23000.00,'EUR',0.01,500.00,'2024-03-14','Yes','E065',NULL),
('ACC261','C261','BR018','Business','Active','2023-04-17',NULL,119000.00,'EUR',1.50,3000.00,'2024-03-12','Yes','E065',NULL),
('ACC262','C262','BR018','Savings','Active','2023-07-01',NULL,38000.00,'EUR',2.50,0.00,'2024-03-09','Yes','E065',NULL),
('ACC263','C263','BR018','Checking','Active','2023-09-15',NULL,30000.00,'EUR',0.01,500.00,'2024-03-13','Yes','E065',NULL),
('ACC264','C264','BR018','Savings','Active','2023-11-29',NULL,27000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC265','C265','BR018','Business','Active','2024-01-12',NULL,109000.00,'EUR',1.50,2500.00,'2024-03-12','Yes','E065',NULL),
('ACC266','C266','BR018','Savings','Active','2024-02-26',NULL,35000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC267','C267','BR018','Checking','Active','2024-03-11',NULL,29000.00,'EUR',0.01,500.00,'2024-03-13','Yes','E065',NULL),
('ACC268','C268','BR018','Savings','Active','2024-03-25',NULL,21000.00,'EUR',2.50,0.00,'2024-03-25','Yes','E065',NULL),
('ACC269','C269','BR018','Business','Active','2024-04-08',NULL,97000.00,'EUR',1.50,2500.00,'2024-04-08','Yes','E065',NULL),
-- China (CNY)
('ACC270','C270','BR018','Savings','Active','2022-07-03',NULL,440000.00,'CNY',3.00,0.00,'2024-03-10','Yes','E064',NULL),
('ACC271','C271','BR018','Business','Active','2022-10-17',NULL,810000.00,'CNY',2.00,20000.00,'2024-03-12','Yes','E064',NULL),
('ACC272','C272','BR018','Savings','Active','2023-01-31',NULL,570000.00,'CNY',3.00,0.00,'2024-03-11','Yes','E064',NULL),
('ACC273','C273','BR018','Checking','Active','2023-05-15',NULL,220000.00,'CNY',0.01,10000.00,'2024-03-14','Yes','E064',NULL),
('ACC274','C274','BR018','Savings','Active','2023-08-29',NULL,390000.00,'CNY',3.00,0.00,'2024-03-09','Yes','E064',NULL),
('ACC275','C275','BR018','Business','Active','2023-11-12',NULL,880000.00,'CNY',2.00,25000.00,'2024-03-12','Yes','E064',NULL),
('ACC276','C276','BR018','Savings','Active','2024-01-26',NULL,620000.00,'CNY',3.00,0.00,'2024-03-10','Yes','E064',NULL),
('ACC277','C277','BR018','Checking','Active','2024-02-09',NULL,195000.00,'CNY',0.01,8000.00,'2024-03-14','Yes','E064',NULL),
('ACC278','C278','BR018','Business','Active','2024-03-25',NULL,940000.00,'CNY',2.00,25000.00,'2024-03-25','Yes','E064',NULL),
('ACC279','C279','BR018','Savings','Active','2024-04-08',NULL,330000.00,'CNY',3.00,0.00,'2024-04-08','Yes','E064',NULL),
-- France (EUR)
('ACC280','C280','BR018','Savings','Active','2022-06-12',NULL,40000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC281','C281','BR018','Business','Active','2022-09-26',NULL,99000.00,'EUR',1.50,2500.00,'2024-03-12','Yes','E065',NULL),
('ACC282','C282','BR018','Savings','Active','2022-12-11',NULL,46000.00,'EUR',2.50,0.00,'2024-03-11','Yes','E065',NULL),
('ACC283','C283','BR018','Checking','Active','2023-03-26',NULL,19000.00,'EUR',0.01,400.00,'2024-03-14','Yes','E065',NULL),
('ACC284','C284','BR018','Savings','Active','2023-06-09',NULL,33000.00,'EUR',2.50,0.00,'2024-03-09','Yes','E065',NULL),
('ACC285','C285','BR018','Business','Active','2023-08-24',NULL,91000.00,'EUR',1.50,2000.00,'2024-03-12','Yes','E065',NULL),
('ACC286','C286','BR018','Savings','Active','2023-10-07',NULL,45000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC287','C287','BR018','Checking','Active','2023-11-21',NULL,22000.00,'EUR',0.01,500.00,'2024-03-14','Yes','E065',NULL),
('ACC288','C288','BR018','Business','Active','2024-01-04',NULL,95000.00,'EUR',1.50,2000.00,'2024-03-12','Yes','E065',NULL),
('ACC289','C289','BR018','Savings','Active','2024-02-18',NULL,31000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC290','C290','BR018','Checking','Active','2024-03-03',NULL,27000.00,'EUR',0.01,500.00,'2024-03-13','Yes','E065',NULL),
('ACC291','C291','BR018','Savings','Active','2024-04-17',NULL,16000.00,'EUR',2.50,0.00,'2024-04-17','Yes','E065',NULL),
-- Italy (EUR)
('ACC292','C292','BR018','Savings','Active','2022-07-21',NULL,38000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC293','C293','BR018','Business','Active','2022-10-04',NULL,95000.00,'EUR',1.50,2000.00,'2024-03-12','Yes','E065',NULL),
('ACC294','C294','BR018','Checking','Active','2022-12-19',NULL,20000.00,'EUR',0.01,400.00,'2024-03-14','Yes','E065',NULL),
('ACC295','C295','BR018','Savings','Active','2023-03-04',NULL,25000.00,'EUR',2.50,0.00,'2024-03-09','Yes','E065',NULL),
('ACC296','C296','BR018','Checking','Active','2023-05-18',NULL,30000.00,'EUR',0.01,500.00,'2024-03-13','Yes','E065',NULL),
('ACC297','C297','BR018','Business','Active','2023-08-01',NULL,105000.00,'EUR',1.50,2500.00,'2024-03-12','Yes','E065',NULL),
('ACC298','C298','BR018','Savings','Active','2023-10-15',NULL,42000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC299','C299','BR018','Checking','Active','2023-12-29',NULL,17000.00,'EUR',0.01,400.00,'2024-03-14','Yes','E065',NULL),
('ACC300','C300','BR018','Business','Active','2024-01-13',NULL,98000.00,'EUR',1.50,2000.00,'2024-03-12','Yes','E065',NULL),
('ACC301','C301','BR018','Savings','Active','2024-02-26',NULL,29000.00,'EUR',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC302','C302','BR018','Checking','Active','2024-03-12',NULL,33000.00,'EUR',0.01,500.00,'2024-03-13','Yes','E065',NULL),
('ACC303','C303','BR018','Savings','Active','2024-04-25',NULL,14000.00,'EUR',2.50,0.00,'2024-04-25','Yes','E065',NULL),
-- UAE (AED)
('ACC304','C304','BR018','Business','Active','2022-05-08',NULL,185000.00,'AED',1.50,5000.00,'2024-03-12','Yes','E064',NULL),
('ACC305','C305','BR018','Savings','Active','2022-07-22',NULL,98000.00,'AED',2.50,0.00,'2024-03-10','Yes','E064',NULL),
('ACC306','C306','BR018','Business','Active','2022-10-05',NULL,215000.00,'AED',1.50,6000.00,'2024-03-12','Yes','E064',NULL),
('ACC307','C307','BR018','Savings','Active','2023-01-20',NULL,81000.00,'AED',2.50,0.00,'2024-03-09','Yes','E064',NULL),
('ACC308','C308','BR018','Business','Active','2023-04-04',NULL,170000.00,'AED',1.50,4000.00,'2024-03-11','Yes','E064',NULL),
('ACC309','C309','BR018','Savings','Active','2023-06-18',NULL,91000.00,'AED',2.50,0.00,'2024-03-10','Yes','E064',NULL),
('ACC310','C310','BR018','Business','Active','2023-08-01',NULL,250000.00,'AED',1.50,7000.00,'2024-03-12','Yes','E064',NULL),
('ACC311','C311','BR018','Savings','Active','2023-10-15',NULL,110000.00,'AED',2.50,0.00,'2024-03-10','Yes','E064',NULL),
('ACC312','C312','BR018','Business','Active','2023-12-29',NULL,195000.00,'AED',1.50,5000.00,'2024-03-12','Yes','E064',NULL),
('ACC313','C313','BR018','Savings','Active','2024-01-12',NULL,88000.00,'AED',2.50,0.00,'2024-03-09','Yes','E064',NULL),
('ACC314','C314','BR018','Checking','Active','2024-02-25',NULL,68000.00,'AED',0.01,2000.00,'2024-03-14','Yes','E064',NULL),
('ACC315','C315','BR018','Savings','Active','2024-03-10',NULL,75000.00,'AED',2.50,0.00,'2024-03-10','Yes','E064',NULL),
('ACC316','C316','BR018','Business','Active','2024-04-23',NULL,228000.00,'AED',1.50,6000.00,'2024-04-23','Yes','E064',NULL),
-- Japan (JPY)
('ACC317','C317','BR018','Savings','Active','2022-06-26',NULL,8800000.00,'JPY',1.00,0.00,'2024-03-11','Yes','E064',NULL),
('ACC318','C318','BR018','Checking','Active','2022-09-09',NULL,4400000.00,'JPY',0.01,100000.00,'2024-03-14','Yes','E064',NULL),
('ACC319','C319','BR018','Business','Active','2022-11-23',NULL,15500000.00,'JPY',0.50,500000.00,'2024-03-12','Yes','E064',NULL),
('ACC320','C320','BR018','Savings','Active','2023-02-06',NULL,3900000.00,'JPY',1.00,0.00,'2024-03-09','Yes','E064',NULL),
('ACC321','C321','BR018','Checking','Active','2023-04-21',NULL,5700000.00,'JPY',0.01,200000.00,'2024-03-13','Yes','E064',NULL),
('ACC322','C322','BR018','Business','Active','2023-07-05',NULL,12400000.00,'JPY',0.50,400000.00,'2024-03-11','Yes','E064',NULL),
('ACC323','C323','BR018','Savings','Active','2023-09-18',NULL,7800000.00,'JPY',1.00,0.00,'2024-03-10','Yes','E064',NULL),
('ACC324','C324','BR018','Checking','Active','2023-12-02',NULL,4100000.00,'JPY',0.01,150000.00,'2024-03-14','Yes','E064',NULL),
('ACC325','C325','BR018','Business','Active','2024-01-15',NULL,13600000.00,'JPY',0.50,450000.00,'2024-03-12','Yes','E064',NULL),
('ACC326','C326','BR018','Savings','Active','2024-02-28',NULL,5200000.00,'JPY',1.00,0.00,'2024-03-09','Yes','E064',NULL),
('ACC327','C327','BR018','Checking','Active','2024-03-13',NULL,6800000.00,'JPY',0.01,200000.00,'2024-03-13','Yes','E064',NULL),
('ACC328','C328','BR018','Savings','Active','2024-03-27',NULL,3400000.00,'JPY',1.00,0.00,'2024-03-27','Yes','E064',NULL),
('ACC329','C329','BR018','Business','Active','2024-04-10',NULL,16200000.00,'JPY',0.50,500000.00,'2024-04-10','Yes','E064',NULL),
-- South Korea (KRW)
('ACC330','C330','BR018','Savings','Active','2022-08-14',NULL,98000000.00,'KRW',2.50,0.00,'2024-03-10','Yes','E064',NULL),
('ACC331','C331','BR018','Checking','Active','2022-11-28',NULL,44000000.00,'KRW',0.01,2000000.00,'2024-03-14','Yes','E064',NULL),
('ACC332','C332','BR018','Business','Active','2023-03-13',NULL,149000000.00,'KRW',1.50,5000000.00,'2024-03-12','Yes','E064',NULL),
('ACC333','C333','BR018','Savings','Active','2023-06-27',NULL,39000000.00,'KRW',2.50,0.00,'2024-03-09','Yes','E064',NULL),
('ACC334','C334','BR018','Checking','Active','2023-09-10',NULL,64000000.00,'KRW',0.01,2000000.00,'2024-03-13','Yes','E064',NULL),
('ACC335','C335','BR018','Savings','Active','2023-11-24',NULL,52000000.00,'KRW',2.50,0.00,'2024-03-10','Yes','E064',NULL),
('ACC336','C336','BR018','Business','Active','2024-02-07',NULL,128000000.00,'KRW',1.50,4000000.00,'2024-03-12','Yes','E064',NULL),
('ACC337','C337','BR018','Savings','Active','2024-04-21',NULL,72000000.00,'KRW',2.50,0.00,'2024-04-21','Yes','E064',NULL),
-- Brazil (BRL)
('ACC338','C338','BR018','Savings','Active','2022-09-22',NULL,290000.00,'BRL',6.00,0.00,'2024-03-10','Yes','E065',NULL),
('ACC339','C339','BR018','Business','Active','2023-01-05',NULL,540000.00,'BRL',5.00,15000.00,'2024-03-12','Yes','E065',NULL),
('ACC340','C340','BR018','Savings','Active','2023-04-20',NULL,390000.00,'BRL',6.00,0.00,'2024-03-11','Yes','E065',NULL),
('ACC341','C341','BR018','Checking','Active','2023-07-04',NULL,150000.00,'BRL',0.01,5000.00,'2024-03-14','Yes','E065',NULL),
('ACC342','C342','BR018','Savings','Active','2023-10-18',NULL,250000.00,'BRL',6.00,0.00,'2024-03-09','Yes','E065',NULL),
('ACC343','C343','BR018','Business','Active','2024-02-01',NULL,490000.00,'BRL',5.00,12000.00,'2024-03-12','Yes','E065',NULL),
-- India (INR)
('ACC344','C344','BR018','Savings','Active','2022-10-29',NULL,5900000.00,'INR',4.00,0.00,'2024-03-10','Yes','E065',NULL),
('ACC345','C345','BR018','Business','Active','2023-01-14',NULL,9400000.00,'INR',3.00,300000.00,'2024-03-12','Yes','E065',NULL),
('ACC346','C346','BR018','Savings','Active','2023-03-28',NULL,7700000.00,'INR',4.00,0.00,'2024-03-11','Yes','E065',NULL),
('ACC347','C347','BR018','Checking','Active','2023-06-11',NULL,3300000.00,'INR',0.01,100000.00,'2024-03-14','Yes','E065',NULL),
('ACC348','C348','BR018','Business','Active','2023-09-25',NULL,11200000.00,'INR',3.00,400000.00,'2024-03-12','Yes','E065',NULL),
('ACC349','C349','BR018','Savings','Active','2023-12-09',NULL,6100000.00,'INR',4.00,0.00,'2024-03-10','Yes','E065',NULL),
('ACC350','C350','BR018','Checking','Active','2024-02-22',NULL,4800000.00,'INR',0.01,150000.00,'2024-03-14','Yes','E065',NULL),
('ACC351','C351','BR018','Savings','Active','2024-04-07',NULL,3500000.00,'INR',4.00,0.00,'2024-04-07','Yes','E065',NULL),
-- Poland (PLN)
('ACC352','C352','BR018','Savings','Active','2023-02-20',NULL,185000.00,'PLN',3.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC353','C353','BR018','Checking','Active','2023-07-05',NULL,74000.00,'PLN',0.01,3000.00,'2024-03-14','Yes','E065',NULL),
('ACC354','C354','BR018','Business','Active','2023-12-19',NULL,330000.00,'PLN',2.50,10000.00,'2024-03-12','Yes','E065',NULL),
-- Egypt (EGP)
('ACC355','C355','BR018','Savings','Active','2023-03-13',NULL,700000.00,'EGP',8.00,0.00,'2024-03-10','Yes','E065',NULL),
('ACC356','C356','BR018','Checking','Active','2023-08-27',NULL,300000.00,'EGP',0.01,10000.00,'2024-03-14','Yes','E065',NULL),
('ACC357','C357','BR018','Business','Active','2024-01-10',NULL,970000.00,'EGP',6.00,30000.00,'2024-03-12','Yes','E065',NULL),
-- Russia (USD)
('ACC358','C358','BR018','Savings','Active','2023-04-27',NULL,33000.00,'USD',2.50,0.00,'2024-03-10','Yes','E065',NULL),
('ACC359','C359','BR018','Checking','Active','2023-09-10',NULL,15000.00,'USD',0.01,400.00,'2024-03-14','Yes','E065',NULL),
('ACC360','C360','BR018','Business','Active','2024-02-24',NULL,78000.00,'USD',1.50,2000.00,'2024-03-12','Yes','E065',NULL);
 
-- ============================================================
insert into loans values
('LN101','C201','BR017','E061','Mortgage',320000.00,3.85,360,'2022-07-01','2052-07-01',1501.00,28000.00,292000.00,'Active','USD','Property',0,'Yes',NULL),
('LN102','C203','BR013','E049','Business',265000.00,5.20,84,'2023-03-01','2030-03-01',3788.00,14000.00,251000.00,'Active','USD','Business assets',0,'Yes',NULL),
('LN103','C205','BR016','E058','Business',290000.00,5.15,84,'2023-08-01','2030-08-01',4133.00,8000.00,282000.00,'Active','USD','Business assets',0,'Yes',NULL),
-- UK (GBP)
('LN104','C207','BR018','E064','Mortgage',380000.00,2.75,300,'2022-06-01','2047-06-01',1762.00,42000.00,338000.00,'Active','GBP','Property',0,'Yes',NULL),
('LN105','C209','BR018','E064','Business',420000.00,3.50,120,'2022-10-01','2032-10-01',4156.00,56000.00,364000.00,'Active','GBP','Business assets',0,'Yes',NULL),
('LN106','C211','BR018','E064','Mortgage',365000.00,2.85,300,'2023-02-01','2048-02-01',1696.00,22000.00,343000.00,'Active','GBP','Property',0,'Yes',NULL),
('LN107','C213','BR018','E064','Business',395000.00,3.45,120,'2023-06-01','2033-06-01',3909.00,18000.00,377000.00,'Active','GBP','Business assets',0,'Yes',NULL),
('LN108','C215','BR018','E064','Mortgage',410000.00,2.90,300,'2023-10-01','2048-10-01',1908.00,10000.00,400000.00,'Active','GBP','Property',0,'Yes',NULL),
('LN109','C217','BR018','E064','Business',445000.00,3.40,120,'2024-01-01','2034-01-01',4394.00,4000.00,441000.00,'Active','GBP','Business assets',0,'Yes',NULL),
-- Canada (CAD)
('LN110','C223','BR019','E067','Mortgage',480000.00,4.20,300,'2022-07-01','2047-07-01',2343.00,38000.00,442000.00,'Active','CAD','Property',0,'Yes',NULL),
('LN111','C224','BR019','E067','Business',320000.00,4.50,120,'2022-09-01','2032-09-01',3310.00,48000.00,272000.00,'Active','CAD','Business assets',0,'Yes',NULL),
('LN112','C225','BR019','E067','Mortgage',445000.00,4.15,300,'2023-01-01','2048-01-01',2158.00,22000.00,423000.00,'Active','CAD','Property',0,'Yes',NULL),
('LN113','C228','BR019','E067','Business',380000.00,4.40,120,'2023-06-01','2033-06-01',3916.00,18000.00,362000.00,'Active','CAD','Business assets',0,'Yes',NULL),
('LN114','C229','BR019','E067','Mortgage',425000.00,4.10,300,'2023-08-01','2048-08-01',2056.00,14000.00,411000.00,'Active','CAD','Property',0,'Yes',NULL),
('LN115','C232','BR019','E067','Business',395000.00,4.35,120,'2024-01-01','2034-01-01',4053.00,2000.00,393000.00,'Active','CAD','Business assets',0,'Yes',NULL),
('LN116','C235','BR019','E068','Business',420000.00,4.45,120,'2024-02-01','2034-02-01',4344.00,0.00,420000.00,'Active','CAD','Business assets',0,'Yes',NULL),
-- Mexico (MXN)
('LN117','C240','BR020','E070','Mortgage',2800000.00,9.50,300,'2022-06-01','2047-06-01',23716.00,224000.00,2576000.00,'Active','MXN','Property',0,'Yes',NULL),
('LN118','C241','BR020','E070','Business',3500000.00,10.00,84,'2022-09-01','2029-09-01',51800.00,336000.00,3164000.00,'Active','MXN','Business assets',0,'Yes',NULL),
('LN119','C242','BR020','E070','Mortgage',3200000.00,9.25,300,'2022-11-01','2047-11-01',26816.00,196000.00,3004000.00,'Active','MXN','Property',0,'Yes',NULL),
('LN120','C245','BR020','E070','Business',4200000.00,9.75,84,'2023-07-01','2030-07-01',63336.00,42000.00,4158000.00,'Active','MXN','Business assets',0,'Yes',NULL),
('LN121','C248','BR020','E070','Business',4800000.00,9.80,84,'2023-12-01','2030-12-01',72576.00,14000.00,4786000.00,'Active','MXN','Business assets',0,'Yes',NULL),
('LN122','C251','BR020','E070','Personal',680000.00,14.00,48,'2024-02-01','2028-02-01',18564.00,0.00,680000.00,'Active','MXN','None',0,'Yes',NULL),
-- Germany (EUR)
('LN123','C257','BR018','E065','Mortgage',320000.00,2.20,300,'2022-07-01','2047-07-01',1368.00,32000.00,288000.00,'Active','EUR','Property',0,'Yes',NULL),
('LN124','C258','BR018','E065','Business',480000.00,3.25,120,'2022-10-01','2032-10-01',4677.00,48000.00,432000.00,'Active','EUR','Business assets',0,'Yes',NULL),
('LN125','C259','BR018','E065','Mortgage',355000.00,2.30,300,'2022-12-01','2047-12-01',1530.00,26000.00,329000.00,'Active','EUR','Property',0,'Yes',NULL),
('LN126','C261','BR018','E065','Business',520000.00,3.15,120,'2023-05-01','2033-05-01',5067.00,22000.00,498000.00,'Active','EUR','Business assets',0,'Yes',NULL),
('LN127','C263','BR018','E065','Personal',35000.00,5.80,48,'2023-10-01','2027-10-01',818.00,6000.00,29000.00,'Active','EUR','None',0,'Yes',NULL),
('LN128','C265','BR018','E065','Business',495000.00,3.20,120,'2024-01-01','2034-01-01',4807.00,2000.00,493000.00,'Active','EUR','Business assets',0,'Yes',NULL),
-- China (CNY)
('LN129','C270','BR018','E064','Mortgage',1800000.00,4.20,300,'2022-08-01','2047-08-01',8838.00,168000.00,1632000.00,'Active','CNY','Property',0,'Yes',NULL),
('LN130','C271','BR018','E064','Business',2800000.00,4.50,120,'2022-11-01','2032-11-01',28980.00,280000.00,2520000.00,'Active','CNY','Business assets',0,'Yes',NULL),
('LN131','C272','BR018','E064','Mortgage',2200000.00,4.15,300,'2023-02-01','2048-02-01',10753.00,140000.00,2060000.00,'Active','CNY','Property',0,'Yes',NULL),
('LN132','C275','BR018','E064','Business',3200000.00,4.40,120,'2023-12-01','2033-12-01',33024.00,8000.00,3192000.00,'Active','CNY','Business assets',0,'Yes',NULL),
('LN133','C278','BR018','E064','Business',2600000.00,4.35,120,'2024-04-01','2034-04-01',26936.00,0.00,2600000.00,'Active','CNY','Business assets',0,'Yes',NULL),
-- France (EUR)
('LN134','C280','BR018','E065','Mortgage',295000.00,2.25,300,'2022-07-01','2047-07-01',1259.00,26000.00,269000.00,'Active','EUR','Property',0,'Yes',NULL),
('LN135','C281','BR018','E065','Business',445000.00,3.30,120,'2022-10-01','2032-10-01',4349.00,42000.00,403000.00,'Active','EUR','Business assets',0,'Yes',NULL),
('LN136','C282','BR018','E065','Mortgage',340000.00,2.35,300,'2023-01-01','2048-01-01',1465.00,18000.00,322000.00,'Active','EUR','Property',0,'Yes',NULL),
('LN137','C285','BR018','E065','Business',398000.00,3.20,120,'2023-09-01','2033-09-01',3868.00,12000.00,386000.00,'Active','EUR','Business assets',0,'Yes',NULL),
('LN138','C288','BR018','E065','Mortgage',315000.00,2.30,300,'2024-01-01','2049-01-01',1358.00,2000.00,313000.00,'Active','EUR','Property',0,'Yes',NULL),
-- Italy (EUR)
('LN139','C292','BR018','E065','Mortgage',280000.00,2.40,300,'2022-08-01','2047-08-01',1209.00,24000.00,256000.00,'Active','EUR','Property',0,'Yes',NULL),
('LN140','C293','BR018','E065','Business',385000.00,3.35,120,'2022-11-01','2032-11-01',3773.00,28000.00,357000.00,'Active','EUR','Business assets',0,'Yes',NULL),
('LN141','C294','BR018','E065','Personal',28000.00,5.50,48,'2023-01-01','2027-01-01',652.00,10000.00,18000.00,'Active','EUR','None',0,'Yes',NULL),
('LN142','C297','BR018','E065','Business',420000.00,3.25,120,'2023-09-01','2033-09-01',4091.00,12000.00,408000.00,'Active','EUR','Business assets',0,'Yes',NULL),
('LN143','C300','BR018','E065','Business',398000.00,3.30,120,'2024-01-01','2034-01-01',3887.00,2000.00,396000.00,'Active','EUR','Business assets',0,'Yes',NULL),
-- UAE (AED)
('LN144','C304','BR018','E064','Business',1800000.00,3.50,120,'2022-06-01','2032-06-01',17824.00,168000.00,1632000.00,'Active','AED','Business assets',0,'Yes',NULL),
('LN145','C306','BR018','E064','Business',2200000.00,3.40,120,'2022-11-01','2032-11-01',21683.00,112000.00,2088000.00,'Active','AED','Business assets',0,'Yes',NULL),
('LN146','C308','BR018','E064','Mortgage',1400000.00,2.80,300,'2023-05-01','2048-05-01',6494.00,28000.00,1372000.00,'Active','AED','Property',0,'Yes',NULL),
('LN147','C310','BR018','E064','Business',2800000.00,3.30,120,'2023-09-01','2033-09-01',27216.00,18000.00,2782000.00,'Active','AED','Business assets',0,'Yes',NULL),
('LN148','C312','BR018','E064','Mortgage',1650000.00,2.75,300,'2024-01-01','2049-01-01',7601.00,2000.00,1648000.00,'Active','AED','Property',0,'Yes',NULL),
('LN149','C314','BR018','E064','Business',1950000.00,3.45,120,'2024-03-01','2034-03-01',19266.00,0.00,1950000.00,'Active','AED','Business assets',0,'Yes',NULL),
-- Japan (JPY)
('LN150','C317','BR018','E064','Mortgage',45000000.00,1.20,300,'2022-07-01','2047-07-01',163800.00,4200000.00,40800000.00,'Active','JPY','Property',0,'Yes',NULL),
('LN151','C319','BR018','E064','Business',68000000.00,1.50,120,'2022-12-01','2032-12-01',658480.00,3600000.00,64400000.00,'Active','JPY','Business assets',0,'Yes',NULL),
('LN152','C321','BR018','E064','Mortgage',52000000.00,1.25,300,'2023-05-01','2048-05-01',190320.00,2200000.00,49800000.00,'Active','JPY','Property',0,'Yes',NULL),
('LN153','C322','BR018','E064','Business',55000000.00,1.45,120,'2023-08-01','2033-08-01',531300.00,2000000.00,53000000.00,'Active','JPY','Business assets',0,'Yes',NULL),
('LN154','C325','BR018','E064','Business',72000000.00,1.40,120,'2024-02-01','2034-02-01',692496.00,800000.00,71200000.00,'Active','JPY','Business assets',0,'Yes',NULL),
-- South Korea (KRW)
('LN155','C330','BR018','E064','Mortgage',480000000.00,3.50,300,'2022-09-01','2047-09-01',2162400.00,46400000.00,433600000.00,'Active','KRW','Property',0,'Yes',NULL),
('LN156','C332','BR018','E064','Business',680000000.00,3.80,120,'2023-04-01','2033-04-01',6866640.00,40000000.00,640000000.00,'Active','KRW','Business assets',0,'Yes',NULL),
('LN157','C334','BR018','E064','Mortgage',520000000.00,3.45,300,'2023-10-01','2048-10-01',2331600.00,12000000.00,508000000.00,'Active','KRW','Property',0,'Yes',NULL),
-- Brazil (BRL)
('LN158','C338','BR018','E065','Mortgage',880000.00,9.50,300,'2022-10-01','2047-10-01',7453.00,84000.00,796000.00,'Active','BRL','Property',0,'Yes',NULL),
('LN159','C339','BR018','E065','Business',1450000.00,10.00,84,'2023-02-01','2030-02-01',21460.00,74000.00,1376000.00,'Active','BRL','Business assets',0,'Yes',NULL),
('LN160','C340','BR018','E065','Mortgage',1100000.00,9.25,300,'2023-05-01','2048-05-01',9218.00,44000.00,1056000.00,'Active','BRL','Property',0,'Yes',NULL),
-- India (INR)
('LN161','C344','BR018','E065','Mortgage',18000000.00,8.50,300,'2022-11-01','2047-11-01',139320.00,2200000.00,15800000.00,'Active','INR','Property',0,'Yes',NULL),
('LN162','C345','BR018','E065','Business',22000000.00,9.00,84,'2023-02-01','2030-02-01',350064.00,1800000.00,20200000.00,'Active','INR','Business assets',0,'Yes',NULL),
('LN163','C346','BR018','E065','Mortgage',28000000.00,8.75,300,'2023-04-01','2048-04-01',219912.00,1600000.00,26400000.00,'Active','INR','Property',0,'Yes',NULL),
('LN164','C348','BR018','E065','Business',32000000.00,8.80,84,'2023-10-01','2030-10-01',509536.00,1200000.00,30800000.00,'Active','INR','Business assets',0,'Yes',NULL),
-- Poland (PLN)
('LN165','C352','BR018','E065','Mortgage',520000.00,5.50,300,'2023-03-01','2048-03-01',3140.00,26000.00,494000.00,'Active','PLN','Property',0,'Yes',NULL),
('LN166','C354','BR018','E065','Business',780000.00,6.00,84,'2024-01-01','2031-01-01',11451.00,4000.00,776000.00,'Active','PLN','Business assets',0,'Yes',NULL),
-- Egypt (EGP)
('LN167','C355','BR018','E065','Personal',850000.00,18.00,36,'2023-04-01','2026-04-01',30686.00,294000.00,556000.00,'Active','EGP','None',0,'Yes',NULL),
('LN168','C357','BR018','E065','Business',2200000.00,16.50,84,'2024-02-01','2031-02-01',40084.00,14000.00,2186000.00,'Active','EGP','Business assets',0,'Yes',NULL),
-- Russia (USD)
('LN169','C358','BR018','E065','Personal',28000.00,7.50,48,'2023-05-01','2027-05-01',678.00,8000.00,20000.00,'Active','USD','None',0,'Yes',NULL),
('LN170','C360','BR018','E065','Business',85000.00,6.50,84,'2024-03-01','2031-03-01',1260.00,0.00,85000.00,'Active','USD','Business assets',0,'Yes',NULL);
 
-- ============================================================
-- PART 5: TRANSACTIONS FOR ALL NEW CUSTOMERS
-- transaction_id, account_id, customer_id, branch_id,
-- transaction_type, amount, currency, transaction_date,
-- description, balance_after, status, employee_id,
-- channel, notes
-- ============================================================

insert into transactions values
('TXN201','ACC201','C201','BR017','Deposit',3900.00,'USD','2024-01-15','Payroll deposit',27900.00,'Completed','E061','Online',NULL),
('TXN202','ACC202','C202','BR017','Deposit',7800.00,'USD','2024-01-18','Business revenue',23800.00,'Completed','E061','Wire Transfer',NULL),
('TXN203','ACC203','C203','BR013','Deposit',4200.00,'USD','2024-01-20','Payroll deposit',35200.00,'Completed','E049','Online',NULL),
('TXN204','ACC204','C204','BR016','Deposit',3600.00,'USD','2024-01-22','Payroll deposit',17600.00,'Completed','E058','Online',NULL),
('TXN205','ACC205','C205','BR016','Deposit',8400.00,'USD','2024-01-25','Business revenue',96400.00,'Completed','E058','Wire Transfer',NULL),
('TXN206','ACC206','C206','BR019','Deposit',3200.00,'USD','2024-01-28','Payroll deposit',22200.00,'Completed','E067','Online',NULL),
-- UK (GBP)
('TXN207','ACC207','C207','BR018','Deposit',4800.00,'GBP','2024-01-15','Payroll deposit',42800.00,'Completed','E064','Online',NULL),
('TXN208','ACC209','C209','BR018','Deposit',12000.00,'GBP','2024-01-18','Business revenue',127000.00,'Completed','E064','Wire Transfer',NULL),
('TXN209','ACC210','C210','BR018','Deposit',4200.00,'GBP','2024-01-20','Payroll deposit',35200.00,'Completed','E064','Online',NULL),
('TXN210','ACC211','C211','BR018','Deposit',5100.00,'GBP','2024-01-22','Payroll deposit',29100.00,'Completed','E064','Online',NULL),
('TXN211','ACC213','C213','BR018','Deposit',9800.00,'GBP','2024-01-25','Business revenue',107800.00,'Completed','E064','Wire Transfer',NULL),
('TXN212','ACC215','C215','BR018','Deposit',5400.00,'GBP','2024-01-28','Payroll deposit',33400.00,'Completed','E064','Online',NULL),
('TXN213','ACC217','C217','BR018','Deposit',10200.00,'GBP','2024-02-01','Business revenue',118200.00,'Completed','E064','Wire Transfer',NULL),
('TXN214','ACC219','C219','BR018','Deposit',4900.00,'GBP','2024-02-05','Payroll deposit',25900.00,'Completed','E064','Online',NULL),
-- Canada (CAD)
('TXN215','ACC223','C223','BR019','Deposit',4600.00,'CAD','2024-01-15','Payroll deposit',58600.00,'Completed','E067','Online',NULL),
('TXN216','ACC224','C224','BR019','Deposit',8800.00,'CAD','2024-01-18','Business revenue',99800.00,'Completed','E067','Wire Transfer',NULL),
('TXN217','ACC225','C225','BR019','Deposit',5100.00,'CAD','2024-01-20','Payroll deposit',35100.00,'Completed','E067','Online',NULL),
('TXN218','ACC228','C228','BR019','Deposit',7900.00,'CAD','2024-01-25','Business revenue',92900.00,'Completed','E067','Wire Transfer',NULL),
('TXN219','ACC229','C229','BR019','Deposit',4800.00,'CAD','2024-01-28','Payroll deposit',54800.00,'Completed','E067','Online',NULL),
('TXN220','ACC232','C232','BR019','Deposit',9200.00,'CAD','2024-02-01','Business revenue',108200.00,'Completed','E067','Wire Transfer',NULL),
('TXN221','ACC235','C235','BR019','Deposit',9600.00,'CAD','2024-02-10','Business revenue',116600.00,'Completed','E068','Wire Transfer',NULL),
-- Mexico (MXN)
('TXN222','ACC240','C240','BR020','Deposit',42000.00,'MXN','2024-01-15','Payroll deposit',752000.00,'Completed','E070','Online',NULL),
('TXN223','ACC241','C241','BR020','Deposit',78000.00,'MXN','2024-01-18','Business revenue',1258000.00,'Completed','E070','Wire Transfer',NULL),
('TXN224','ACC242','C242','BR020','Deposit',55000.00,'MXN','2024-01-20','Payroll deposit',1005000.00,'Completed','E070','Online',NULL),
('TXN225','ACC245','C245','BR020','Deposit',88000.00,'MXN','2024-01-25','Business revenue',1508000.00,'Completed','E070','Wire Transfer',NULL),
('TXN226','ACC248','C248','BR020','Deposit',105000.00,'MXN','2024-01-28','Business revenue',1625000.00,'Completed','E070','Wire Transfer',NULL),
('TXN227','ACC251','C251','BR020','Deposit',68000.00,'MXN','2024-02-05','Business revenue',1158000.00,'Completed','E070','Wire Transfer',NULL),
('TXN228','ACC254','C254','BR020','Deposit',47000.00,'MXN','2024-02-15','Payroll deposit',777000.00,'Completed','E070','Online',NULL),
-- Germany (EUR)
('TXN229','ACC257','C257','BR018','Deposit',5200.00,'EUR','2024-01-16','Payroll deposit',49200.00,'Completed','E065','Online',NULL),
('TXN230','ACC258','C258','BR018','Deposit',10500.00,'EUR','2024-01-19','Business revenue',112500.00,'Completed','E065','Wire Transfer',NULL),
('TXN231','ACC259','C259','BR018','Deposit',5800.00,'EUR','2024-01-22','Payroll deposit',63800.00,'Completed','E065','Online',NULL),
('TXN232','ACC261','C261','BR018','Deposit',12200.00,'EUR','2024-01-25','Business revenue',131200.00,'Completed','E065','Wire Transfer',NULL),
('TXN233','ACC263','C263','BR018','Deposit',5100.00,'EUR','2024-01-28','Payroll deposit',35100.00,'Completed','E065','Online',NULL),
('TXN234','ACC265','C265','BR018','Deposit',11400.00,'EUR','2024-02-02','Business revenue',120400.00,'Completed','E065','Wire Transfer',NULL),
-- China (CNY)
('TXN235','ACC270','C270','BR018','Deposit',28000.00,'CNY','2024-01-16','Payroll deposit',468000.00,'Completed','E064','Online',NULL),
('TXN236','ACC271','C271','BR018','Deposit',52000.00,'CNY','2024-01-19','Business revenue',862000.00,'Completed','E064','Wire Transfer',NULL),
('TXN237','ACC272','C272','BR018','Deposit',35000.00,'CNY','2024-01-22','Payroll deposit',605000.00,'Completed','E064','Online',NULL),
('TXN238','ACC275','C275','BR018','Deposit',68000.00,'CNY','2024-01-28','Business revenue',948000.00,'Completed','E064','Wire Transfer',NULL),
('TXN239','ACC278','C278','BR018','Deposit',72000.00,'CNY','2024-02-05','Business revenue',1012000.00,'Completed','E064','Wire Transfer',NULL),
-- France (EUR)
('TXN240','ACC280','C280','BR018','Deposit',4900.00,'EUR','2024-01-17','Payroll deposit',44900.00,'Completed','E065','Online',NULL),
('TXN241','ACC281','C281','BR018','Deposit',10200.00,'EUR','2024-01-20','Business revenue',109200.00,'Completed','E065','Wire Transfer',NULL),
('TXN242','ACC282','C282','BR018','Deposit',5300.00,'EUR','2024-01-23','Payroll deposit',51300.00,'Completed','E065','Online',NULL),
('TXN243','ACC285','C285','BR018','Deposit',9600.00,'EUR','2024-01-29','Business revenue',100600.00,'Completed','E065','Wire Transfer',NULL),
('TXN244','ACC288','C288','BR018','Deposit',10800.00,'EUR','2024-02-04','Business revenue',105800.00,'Completed','E065','Wire Transfer',NULL),
-- Italy (EUR)
('TXN245','ACC292','C292','BR018','Deposit',4700.00,'EUR','2024-01-17','Payroll deposit',42700.00,'Completed','E065','Online',NULL),
('TXN246','ACC293','C293','BR018','Deposit',9600.00,'EUR','2024-01-20','Business revenue',104600.00,'Completed','E065','Wire Transfer',NULL),
('TXN247','ACC297','C297','BR018','Deposit',10400.00,'EUR','2024-01-29','Business revenue',115400.00,'Completed','E065','Wire Transfer',NULL),
('TXN248','ACC300','C300','BR018','Deposit',9200.00,'EUR','2024-02-05','Business revenue',107200.00,'Completed','E065','Wire Transfer',NULL),
-- UAE (AED)
('TXN249','ACC304','C304','BR018','Deposit',45000.00,'AED','2024-01-15','Business revenue',230000.00,'Completed','E064','Wire Transfer',NULL),
('TXN250','ACC306','C306','BR018','Deposit',62000.00,'AED','2024-01-18','Business revenue',277000.00,'Completed','E064','Wire Transfer',NULL),
('TXN251','ACC308','C308','BR018','Deposit',38000.00,'AED','2024-01-22','Business revenue',208000.00,'Completed','E064','Wire Transfer',NULL),
('TXN252','ACC310','C310','BR018','Deposit',75000.00,'AED','2024-01-25','Business revenue',325000.00,'Completed','E064','Wire Transfer',NULL),
('TXN253','ACC312','C312','BR018','Deposit',52000.00,'AED','2024-01-29','Business revenue',247000.00,'Completed','E064','Wire Transfer',NULL),
('TXN254','ACC314','C314','BR018','Deposit',41000.00,'AED','2024-02-05','Payroll deposit',109000.00,'Completed','E064','Online',NULL),
-- Japan (JPY)
('TXN255','ACC317','C317','BR018','Deposit',420000.00,'JPY','2024-01-16','Payroll deposit',9220000.00,'Completed','E064','Online',NULL),
('TXN256','ACC319','C319','BR018','Deposit',1200000.00,'JPY','2024-01-19','Business revenue',16700000.00,'Completed','E064','Wire Transfer',NULL),
('TXN257','ACC321','C321','BR018','Deposit',560000.00,'JPY','2024-01-22','Payroll deposit',6260000.00,'Completed','E064','Online',NULL),
('TXN258','ACC322','C322','BR018','Deposit',980000.00,'JPY','2024-01-25','Business revenue',13380000.00,'Completed','E064','Wire Transfer',NULL),
('TXN259','ACC325','C325','BR018','Deposit',1150000.00,'JPY','2024-02-01','Business revenue',14750000.00,'Completed','E064','Wire Transfer',NULL),
-- South Korea (KRW)
('TXN260','ACC330','C330','BR018','Deposit',5200000.00,'KRW','2024-01-17','Payroll deposit',103200000.00,'Completed','E064','Online',NULL),
('TXN261','ACC332','C332','BR018','Deposit',8800000.00,'KRW','2024-01-20','Business revenue',157800000.00,'Completed','E064','Wire Transfer',NULL),
('TXN262','ACC334','C334','BR018','Deposit',6400000.00,'KRW','2024-01-25','Payroll deposit',70400000.00,'Completed','E064','Online',NULL),
('TXN263','ACC336','C336','BR018','Deposit',11200000.00,'KRW','2024-02-08','Business revenue',139200000.00,'Completed','E064','Wire Transfer',NULL),
-- Brazil (BRL)
('TXN264','ACC338','C338','BR018','Deposit',18000.00,'BRL','2024-01-17','Payroll deposit',308000.00,'Completed','E065','Online',NULL),
('TXN265','ACC339','C339','BR018','Deposit',38000.00,'BRL','2024-01-20','Business revenue',578000.00,'Completed','E065','Wire Transfer',NULL),
('TXN266','ACC340','C340','BR018','Deposit',24000.00,'BRL','2024-01-24','Payroll deposit',414000.00,'Completed','E065','Online',NULL),
-- India (INR)
('TXN267','ACC344','C344','BR018','Deposit',320000.00,'INR','2024-01-18','Payroll deposit',6220000.00,'Completed','E065','Online',NULL),
('TXN268','ACC345','C345','BR018','Deposit',820000.00,'INR','2024-01-21','Business revenue',10220000.00,'Completed','E065','Wire Transfer',NULL),
('TXN269','ACC346','C346','BR018','Deposit',480000.00,'INR','2024-01-25','Payroll deposit',8180000.00,'Completed','E065','Online',NULL),
('TXN270','ACC348','C348','BR018','Deposit',920000.00,'INR','2024-02-01','Business revenue',12120000.00,'Completed','E065','Wire Transfer',NULL),
-- Poland (PLN)
('TXN271','ACC352','C352','BR018','Deposit',9200.00,'PLN','2024-01-18','Payroll deposit',194200.00,'Completed','E065','Online',NULL),
('TXN272','ACC354','C354','BR018','Deposit',22000.00,'PLN','2024-01-25','Business revenue',352000.00,'Completed','E065','Wire Transfer',NULL),
-- Egypt (EGP)
('TXN273','ACC355','C355','BR018','Deposit',28000.00,'EGP','2024-01-19','Payroll deposit',728000.00,'Completed','E065','Online',NULL),
('TXN274','ACC357','C357','BR018','Deposit',68000.00,'EGP','2024-01-26','Business revenue',1038000.00,'Completed','E065','Wire Transfer',NULL),
-- Russia (USD)
('TXN275','ACC358','C358','BR018','Deposit',3800.00,'USD','2024-01-20','Payroll deposit',36800.00,'Completed','E065','Online',NULL),
('TXN276','ACC360','C360','BR018','Deposit',7200.00,'USD','2024-01-27','Business revenue',85200.00,'Completed','E065','Wire Transfer',NULL);
 

 -- Check row counts for all tables
SELECT 'branches' AS table_name, COUNT(*) AS row_count FROM branches
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'accounts', COUNT(*) FROM accounts
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions
UNION ALL
SELECT 'loans', COUNT(*) FROM loans;


select t.branch_id, bc.branch_name, t.currency, sum(abs(t.amount)) as total
from public.transactions_clean t
join public.branches_clean bc on t.branch_id = bc.branch_id
where t.branch_id = 'BR005'
group by t.branch_id, bc.branch_name, t.currency
order by total desc


-- Move KRW transactions back to BR018 (London City handles international)
update public.transactions_clean
set branch_id = 'BR018'
where branch_id = 'BR005'
and currency = 'KRW';

-- Also fix the raw transactions table
update public.transactions
set branch_id = 'BR018'
where branch_id = 'BR005'
and currency = 'KRW';



-- ============================================================

-- ============================================================
-- LONDON CITY LOAN FIX
-- Convert all BR018 loans to USD with realistic amounts
-- ============================================================
update public.loans set
    loan_amount = case loan_id
        when 'LN011' then 285000.00  when 'LN012' then 180000.00
        when 'LN030' then 220000.00  when 'LN036' then 18000.00
        when 'LN037' then 145000.00  when 'LN044' then 30000.00
        when 'LN045' then 195000.00  when 'LN046' then 12000.00
        when 'LN059' then 275000.00  when 'LN072' then 265000.00
        when 'LN074' then 35000.00   when 'LN075' then 210000.00
        when 'LN090' then 28000.00   when 'LN091' then 20000.00
        when 'LN092' then 32000.00   when 'LN094' then 8000.00
        when 'LN100' then 22000.00
        when 'LN104' then 320000.00  when 'LN105' then 185000.00
        when 'LN106' then 295000.00  when 'LN107' then 175000.00
        when 'LN108' then 340000.00  when 'LN109' then 198000.00
        when 'LN123' then 265000.00  when 'LN124' then 210000.00
        when 'LN125' then 290000.00  when 'LN126' then 230000.00
        when 'LN127' then 28000.00   when 'LN128' then 220000.00
        when 'LN134' then 245000.00  when 'LN135' then 195000.00
        when 'LN136' then 275000.00  when 'LN137' then 178000.00
        when 'LN138' then 258000.00
        when 'LN139' then 232000.00  when 'LN140' then 168000.00
        when 'LN141' then 22000.00   when 'LN142' then 185000.00
        when 'LN143' then 175000.00
        when 'LN144' then 185000.00  when 'LN145' then 220000.00
        when 'LN146' then 195000.00  when 'LN147' then 242000.00
        when 'LN148' then 178000.00  when 'LN149' then 210000.00
        when 'LN150' then 195000.00  when 'LN151' then 245000.00
        when 'LN152' then 215000.00  when 'LN153' then 185000.00
        when 'LN154' then 228000.00
        when 'LN155' then 185000.00  when 'LN156' then 242000.00
        when 'LN157' then 198000.00
        when 'LN158' then 145000.00  when 'LN159' then 168000.00
        when 'LN160' then 155000.00
        when 'LN161' then 125000.00  when 'LN162' then 148000.00
        when 'LN163' then 138000.00  when 'LN164' then 158000.00
        when 'LN165' then 115000.00  when 'LN166' then 128000.00
        when 'LN167' then 22000.00   when 'LN168' then 48000.00
        when 'LN169' then 28000.00   when 'LN170' then 85000.00
        when 'LN129' then 185000.00  when 'LN130' then 215000.00
        when 'LN131' then 195000.00  when 'LN132' then 228000.00
        when 'LN133' then 178000.00
        else loan_amount
    end,
    currency = 'USD'
where branch_id = 'BR018';

update public.loans set
    amount_paid = case loan_id
        when 'LN011' then 24000.00   when 'LN012' then 18000.00
        when 'LN030' then 16000.00   when 'LN036' then 2000.00
        when 'LN037' then 22000.00   when 'LN044' then 8000.00
        when 'LN045' then 28000.00   when 'LN046' then 1200.00
        when 'LN059' then 22000.00   when 'LN072' then 18000.00
        when 'LN074' then 8000.00    when 'LN075' then 24000.00
        when 'LN090' then 0.00       when 'LN091' then 6000.00
        when 'LN092' then 8000.00    when 'LN094' then 0.00
        when 'LN100' then 4000.00    when 'LN104' then 32000.00
        when 'LN105' then 22000.00   when 'LN106' then 18000.00
        when 'LN107' then 12000.00   when 'LN108' then 8000.00
        when 'LN109' then 2000.00    when 'LN123' then 24000.00
        when 'LN124' then 28000.00   when 'LN125' then 18000.00
        when 'LN126' then 14000.00   when 'LN127' then 4000.00
        when 'LN128' then 2000.00    when 'LN129' then 18000.00
        when 'LN130' then 22000.00   when 'LN131' then 16000.00
        when 'LN132' then 8000.00    when 'LN133' then 0.00
        when 'LN134' then 22000.00   when 'LN135' then 28000.00
        when 'LN136' then 14000.00   when 'LN137' then 10000.00
        when 'LN138' then 2000.00    when 'LN139' then 18000.00
        when 'LN140' then 16000.00   when 'LN141' then 8000.00
        when 'LN142' then 10000.00   when 'LN143' then 2000.00
        when 'LN144' then 22000.00   when 'LN145' then 18000.00
        when 'LN146' then 14000.00   when 'LN147' then 10000.00
        when 'LN148' then 2000.00    when 'LN149' then 0.00
        when 'LN150' then 18000.00   when 'LN151' then 24000.00
        when 'LN152' then 14000.00   when 'LN153' then 12000.00
        when 'LN154' then 4000.00    when 'LN155' then 16000.00
        when 'LN156' then 22000.00   when 'LN157' then 8000.00
        when 'LN158' then 12000.00   when 'LN159' then 14000.00
        when 'LN160' then 10000.00   when 'LN161' then 8000.00
        when 'LN162' then 12000.00   when 'LN163' then 10000.00
        when 'LN164' then 8000.00    when 'LN165' then 6000.00
        when 'LN166' then 2000.00    when 'LN167' then 4000.00
        when 'LN168' then 2000.00    when 'LN169' then 6000.00
        when 'LN170' then 0.00
        else amount_paid
    end
where branch_id = 'BR018';

update public.loans set balance_due = loan_amount - amount_paid
where branch_id = 'BR018';

-- Fix LN007 and LN008 dates
update public.loans set start_date = '2023-01-01', end_date = '2028-01-01'
where loan_id in ('LN007','LN008')
and (start_date is null or start_date = '' or start_date ilike '%/%');


-- ============================================================
-- REASSIGN INTERNATIONAL CUSTOMERS TO CORRECT BRANCHES
-- ============================================================
update public.customers set branch_id = 'BR019'
where country = 'Canada';

update public.customers set branch_id = 'BR020'
where country = 'Mexico';

update public.customers set branch_id = 'BR001'
where country = 'Germany';

update public.customers set branch_id = 'BR003'
where country = 'France';

update public.customers set branch_id = 'BR004'
where country = 'Italy';

update public.customers set branch_id = 'BR011'
where country = 'UAE';

update public.customers set branch_id = 'BR012'
where country = 'Japan';

update public.customers set branch_id = 'BR005'
where country = 'South Korea';

update public.customers set branch_id = 'BR010'
where country = 'China';

update public.customers set branch_id = 'BR007'
where country = 'Brazil';

update public.customers set branch_id = 'BR014'
where country = 'India';

update public.customers set branch_id = 'BR016'
where country = 'Poland';

update public.customers set branch_id = 'BR013'
where country = 'Egypt';

update public.customers set branch_id = 'BR017'
where country = 'Russia';

-- UK stays at BR018 London City

-- Sync accounts, loans and transactions to match customer branch
update public.accounts set branch_id = c.branch_id
from public.customers c
where public.accounts.customer_id = c.customer_id;

update public.loans set branch_id = c.branch_id
from public.customers c
where public.loans.customer_id = c.customer_id;

update public.transactions set branch_id = c.branch_id
from public.customers c
where public.transactions.customer_id = c.customer_id;


-- ============================================================
-- BUILD ALL CLEAN TABLES
-- ============================================================

drop table if exists public.branches_clean;
drop table if exists public.employees_clean;
drop table if exists public.customers_clean;
drop table if exists public.accounts_clean;
drop table if exists public.transactions_clean;
drop table if exists public.loans_clean;

create table public.branches_clean as select * from public.branches;
create table public.employees_clean as select * from public.employees;
create table public.customers_clean as select * from public.customers;
create table public.accounts_clean as select * from public.accounts;
create table public.transactions_clean as select * from public.transactions;
create table public.loans_clean as select * from public.loans;

-- ── BRANCHES CLEANING ───────────────────────────────────────
update public.branches_clean set zip_code = replace(zip_code, ' ', '');
update public.branches_clean set state = upper(state);
update public.branches_clean set is_active = case
    when is_active ilike 'y%' then 'Yes'
    when is_active ilike 'n%' then 'No'
    else 'Check Activity'
end;
update public.branches_clean set phone = concat(
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 1, 3), '-',
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 4, 3), '-',
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 7, 4))
where country = 'USA';
update public.branches_clean set open_date = regexp_replace(open_date, '[/.]', '-', 'g')
where open_date is not null and open_date != '';
update public.branches_clean set open_date = concat(
    split_part(open_date, '-', 1), '-',
    split_part(open_date, '-', 3), '-',
    split_part(open_date, '-', 2))
where length(split_part(open_date, '-', 1)) = 4
and split_part(open_date, '-', 2)::int > 12
and open_date is not null and open_date != '';
update public.branches_clean set
    branch_id = trim(branch_id), branch_name = trim(branch_name),
    address = trim(address), city = trim(city), state = trim(state),
    zip_code = trim(zip_code), country = trim(country), phone = trim(phone),
    manager_name = trim(manager_name), is_active = trim(is_active), notes = trim(notes);

-- ── EMPLOYEES CLEANING ──────────────────────────────────────
delete from public.employees_clean where employee_id in (
    select employee_id from (
        select employee_id,
        row_number() over (partition by full_name, gender, date_of_birth order by employee_id) as rn
        from public.employees_clean) as sub where rn > 1);
delete from public.employees_clean
where first_name is null and full_name is null and hire_date is null;
update public.employees_clean set
    first_name = initcap(first_name), last_name = initcap(last_name), full_name = initcap(full_name);
update public.employees_clean set gender = case
    when gender ilike 'm%' then 'Male' when gender ilike 'f%' then 'Female' else gender end;
update public.employees_clean set date_of_birth = regexp_replace(date_of_birth, '[/.]', '-', 'g')
where date_of_birth is not null and date_of_birth != '';
update public.employees_clean set date_of_birth = concat(
    split_part(date_of_birth, '-', 1), '-',
    split_part(date_of_birth, '-', 3), '-',
    split_part(date_of_birth, '-', 2))
where length(split_part(date_of_birth, '-', 1)) = 4
and split_part(date_of_birth, '-', 2)::int > 12
and date_of_birth is not null and date_of_birth != '';
update public.employees_clean set hire_date = regexp_replace(hire_date, '[/.]', '-', 'g')
where hire_date is not null and hire_date != '';
update public.employees_clean set hire_date = concat(
    split_part(hire_date, '-', 1), '-',
    split_part(hire_date, '-', 3), '-',
    split_part(hire_date, '-', 2))
where length(split_part(hire_date, '-', 1)) = 4
and split_part(hire_date, '-', 2)::int > 12
and hire_date is not null and hire_date != '';
update public.employees_clean set salary = abs(salary);
update public.employees_clean set phone = concat(
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 1, 3), '-',
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 4, 3), '-',
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 7, 4))
where branch_id in (select branch_id from public.branches_clean where country = 'USA');
update public.employees_clean set email = case
    when email is null or email = '' then 'Unknown'
    when email ilike '%@@%' then replace(email, '@@', '@')
    when email not like '%@%' then 'Invalid - Missing @'
    when email not like '%.%' then 'Invalid - Missing Domain'
    else email end;
update public.employees_clean set is_active = case
    when is_active ilike 'y%' then 'Yes' when is_active ilike 'n%' then 'No'
    else 'Check Activity' end;
update public.employees_clean set notes = null where notes not ilike '%manager%';
update public.employees_clean set
    employee_id = trim(employee_id), branch_id = trim(branch_id),
    first_name = trim(first_name), last_name = trim(last_name),
    full_name = trim(full_name), gender = trim(gender),
    job_title = trim(job_title), department = trim(department),
    phone = trim(phone), email = trim(email), manager_id = trim(manager_id),
    is_active = trim(is_active), education_level = trim(education_level),
    notes = trim(notes);

-- ── CUSTOMERS CLEANING ──────────────────────────────────────
delete from public.customers_clean where customer_id in (
    select customer_id from (
        select customer_id,
        row_number() over (partition by full_name, date_of_birth, address order by customer_id) as rn
        from public.customers_clean) as sub where rn > 1);
delete from public.customers_clean
where (full_name is null or full_name = '')
and (date_of_birth is null or date_of_birth = '')
and (phone is null or phone = '');
update public.customers_clean set first_name = replace(replace(replace(replace(replace(
    first_name,'@','a'),'#','h'),'!','i'),'$','s'),'0','o');
update public.customers_clean set last_name = replace(replace(replace(replace(replace(
    last_name,'@','a'),'#','h'),'!','i'),'$','s'),'0','o');
update public.customers_clean set full_name = replace(replace(replace(replace(replace(
    full_name,'@','a'),'#','h'),'!','i'),'$','s'),'0','o');
update public.customers_clean set
    first_name = initcap(first_name), last_name = initcap(last_name), full_name = initcap(full_name);
update public.customers_clean set gender = case
    when gender ilike 'f%' then 'Female' when gender ilike 'm%' then 'Male' else gender end;
update public.customers_clean set date_of_birth = regexp_replace(date_of_birth, '[/.]', '-', 'g')
where date_of_birth is not null and date_of_birth != '';
update public.customers_clean set date_of_birth = concat(
    split_part(date_of_birth, '-', 1), '-',
    split_part(date_of_birth, '-', 3), '-',
    split_part(date_of_birth, '-', 2))
where length(split_part(date_of_birth, '-', 1)) = 4
and split_part(date_of_birth, '-', 2)::int > 12
and date_of_birth is not null and date_of_birth != '';
update public.customers_clean set date_of_birth = to_date(date_of_birth, 'DD-MM-YYYY')::varchar
where length(split_part(date_of_birth, '-', 1)) = 2
and split_part(date_of_birth, '-', 1)::int > 12
and date_of_birth is not null and date_of_birth != '';
update public.customers_clean set date_of_birth = '1995-09-30' where date_of_birth = '1995-09-31';
update public.customers_clean set date_of_birth = 'Invalid'
where date_of_birth ~ '^\d{4}-\d{2}-\d{2}$' and date_of_birth::date > current_date;
update public.customers_clean set phone = concat(
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 1, 3), '-',
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 4, 3), '-',
    substring(regexp_replace(phone, '[^0-9]', '', 'g'), 7, 4))
where phone is not null and phone != '' and country = 'USA';
update public.customers_clean set email = case
    when email is null or email = '' then 'Unknown'
    when email ilike '%@@%' then replace(email, '@@', '@')
    when email not like '%@%' then 'Invalid - Missing @'
    when email not like '%.%' then 'Invalid - Missing Domain'
    else email end;
update public.customers_clean set state = upper(state);
update public.customers_clean set zip_code = replace(zip_code, ' ', '');
update public.customers_clean set country = case
    when country ilike '%america%' then 'USA'
    when country ilike '%united st%' then 'USA'
    when country ilike 'us%' then 'USA'
    when country ilike 'u.s%' then 'USA'
    when country ilike '%united k%' then 'UK'
    when country ilike 'uk%' then 'UK'
    when country ilike '%uae%' then 'UAE'
    else country end;
update public.customers_clean set is_active = case
    when is_active ilike 'y%' then 'Yes' when is_active ilike 'n%' then 'No'
    else 'Check Activity' end;
update public.customers_clean set kyc_verified = case
    when kyc_verified ilike 'y%' then 'Yes' when kyc_verified ilike 'n%' then 'No'
    else 'Check Verification' end;
update public.customers_clean set join_date = regexp_replace(join_date, '[/.]', '-', 'g')
where join_date is not null and join_date != '';
update public.customers_clean set join_date = concat(
    split_part(join_date, '-', 1), '-',
    split_part(join_date, '-', 3), '-',
    split_part(join_date, '-', 2))
where length(split_part(join_date, '-', 1)) = 4
and split_part(join_date, '-', 2)::int > 12
and join_date is not null and join_date != '';
update public.customers_clean set notes = 'Missing Annual Income - review required'
where annual_income is null;
update public.customers_clean set
    customer_id = trim(customer_id), first_name = trim(first_name),
    last_name = trim(last_name), full_name = trim(full_name),
    gender = trim(gender), phone = trim(phone), email = trim(email),
    address = trim(address), city = trim(city), state = trim(state),
    zip_code = trim(zip_code), country = trim(country),
    employment_status = trim(employment_status),
    marital_status = trim(marital_status), nationality = trim(nationality),
    is_active = trim(is_active), kyc_verified = trim(kyc_verified),
    branch_id = trim(branch_id), notes = trim(notes);

-- ── ACCOUNTS CLEANING ───────────────────────────────────────
delete from public.accounts_clean where account_id in (
    select account_id from (
        select account_id,
        row_number() over (partition by customer_id, branch_id, account_type, account_status order by account_id) as rn
        from public.accounts_clean) as sub where rn > 1);
update public.accounts_clean set is_active = case
    when is_active ilike 'y%' then 'Yes' when is_active ilike 'n%' then 'No'
    else 'Check Activity' end;
update public.accounts_clean set currency = upper(currency);
update public.accounts_clean set open_date = regexp_replace(open_date, '[/.]', '-', 'g')
where open_date is not null and open_date != '';
update public.accounts_clean set open_date = concat(
    split_part(open_date, '-', 1), '-',
    split_part(open_date, '-', 3), '-',
    split_part(open_date, '-', 2))
where length(split_part(open_date, '-', 1)) = 4
and split_part(open_date, '-', 2)::int > 12
and open_date is not null and open_date != '';
update public.accounts_clean set open_date = '2020-07-20' where open_date = '20/07/2020';
update public.accounts_clean set last_transaction = regexp_replace(last_transaction, '[/.]', '-', 'g')
where last_transaction is not null and last_transaction != '';
update public.accounts_clean set last_transaction = concat(
    split_part(last_transaction, '-', 1), '-',
    split_part(last_transaction, '-', 3), '-',
    split_part(last_transaction, '-', 2))
where length(split_part(last_transaction, '-', 1)) = 4
and split_part(last_transaction, '-', 2)::int > 12
and last_transaction is not null and last_transaction != '';
update public.accounts_clean set notes = 'Overdraft limit reached - review needed'
where account_id = 'ACC009' and balance < 0;
update public.accounts_clean set notes = concat('Invalid interest rate was ', interest_rate::varchar, ' - review required')
where interest_rate > 10;
update public.accounts_clean set interest_rate = null where interest_rate > 10;
update public.accounts_clean set interest_rate = abs(interest_rate) where interest_rate < 0;
update public.accounts_clean set notes = case
    when balance is null and currency is null then 'Missing balance and currency - update required'
    when balance is null then 'Missing balance - update required'
    when currency is null then 'Missing currency - update required'
    when interest_rate is null then 'Missing interest rate - review required'
    when balance < 0 and abs(balance) > overdraft_limit then 'Overdraft limit exceeded - review required'
    else notes end;
-- Add balance_usd column
alter table public.accounts_clean add column if not exists exchange_rate numeric(10,4);
alter table public.accounts_clean add column if not exists balance_usd numeric(15,2);
update public.accounts_clean set
    exchange_rate = case currency
        when 'USD' then 1.0000 when 'GBP' then 1.2700 when 'EUR' then 1.0900
        when 'JPY' then 0.0067 when 'AED' then 0.2700 when 'INR' then 0.0120
        when 'EGP' then 0.0320 when 'KRW' then 0.0008 when 'CNY' then 0.1380
        when 'CAD' then 0.7400 when 'MXN' then 0.0580 when 'BRL' then 0.2000
        when 'PLN' then 0.2500 else 1.0000 end,
    balance_usd = round(balance * case currency
        when 'USD' then 1.0000 when 'GBP' then 1.2700 when 'EUR' then 1.0900
        when 'JPY' then 0.0067 when 'AED' then 0.2700 when 'INR' then 0.0120
        when 'EGP' then 0.0320 when 'KRW' then 0.0008 when 'CNY' then 0.1380
        when 'CAD' then 0.7400 when 'MXN' then 0.0580 when 'BRL' then 0.2000
        when 'PLN' then 0.2500 else 1.0000 end, 2);
update public.accounts_clean set
    account_id = trim(account_id), customer_id = trim(customer_id),
    branch_id = trim(branch_id), account_type = trim(account_type),
    account_status = trim(account_status), open_date = trim(open_date),
    close_date = trim(close_date), currency = trim(currency),
    last_transaction = trim(last_transaction), is_active = trim(is_active),
    employee_id = trim(employee_id), notes = trim(notes);

-- ── TRANSACTIONS CLEANING ───────────────────────────────────
delete from public.transactions_clean where transaction_id in (
    select transaction_id from (
        select transaction_id,
        row_number() over (partition by customer_id, transaction_type, amount, transaction_date order by transaction_id) as rn
        from public.transactions_clean) as sub where rn > 1);
delete from public.transactions_clean
where account_id is null and amount is null
and transaction_date is null and customer_id is null;
update public.transactions_clean set currency = upper(currency);
update public.transactions_clean set notes = 'Missing currency' where currency is null;
update public.transactions_clean set amount = -abs(amount)
where transaction_type = 'Withdrawal' and amount > 0;
update public.transactions_clean set amount = abs(amount)
where transaction_type = 'Deposit' and amount < 0;
update public.transactions_clean set notes = 'Account went into overdraft after withdrawal'
where balance_after < 0;
update public.transactions_clean set notes = 'Invalid - Zero amount Transaction' where amount = 0;
update public.transactions_clean set transaction_date = regexp_replace(transaction_date, '[/.]', '-', 'g')
where transaction_date is not null and transaction_date != '';
update public.transactions_clean set transaction_date = concat(
    split_part(transaction_date, '-', 1), '-',
    split_part(transaction_date, '-', 3), '-',
    split_part(transaction_date, '-', 2))
where length(split_part(transaction_date, '-', 1)) = 4
and split_part(transaction_date, '-', 2)::int > 12
and transaction_date is not null and transaction_date != '';
update public.transactions_clean set transaction_date = to_date(transaction_date, 'DD-MM-YYYY')::varchar
where length(split_part(transaction_date, '-', 1)) = 2
and split_part(transaction_date, '-', 1)::int > 12
and transaction_date is not null and transaction_date != '';
update public.transactions_clean set status = initcap(status);
update public.transactions_clean set channel = case
    when channel ilike '%wire%' then 'Wire Transfer'
    when channel ilike '%bran%' then 'Branch'
    when channel ilike '%atm%' then 'ATM'
    when channel ilike '%on%' then 'Online'
    when channel ilike '%card%' then 'Card'
    else channel end;
update public.transactions_clean set
    transaction_id = trim(transaction_id), account_id = trim(account_id),
    customer_id = trim(customer_id), branch_id = trim(branch_id),
    transaction_type = trim(transaction_type), currency = trim(currency),
    transaction_date = trim(transaction_date), description = trim(description),
    status = trim(status), employee_id = trim(employee_id),
    channel = trim(channel), notes = trim(notes);

-- ── LOANS CLEANING ──────────────────────────────────────────
delete from public.loans_clean where loan_id in (
    select loan_id from (
        select loan_id,
        row_number() over (partition by customer_id, loan_type, loan_amount, start_date order by loan_id) as rn
        from public.loans_clean) as sub where rn > 1);
update public.loans_clean set loan_amount = abs(loan_amount);
update public.loans_clean set interest_rate = abs(interest_rate) where interest_rate < 0;
update public.loans_clean set notes = concat('Invalid interest rate was ', interest_rate::varchar, ' - review required')
where interest_rate > 27;
update public.loans_clean set interest_rate = null where interest_rate > 27;
update public.loans_clean set start_date = regexp_replace(start_date, '[/.]', '-', 'g')
where start_date is not null and start_date != '';
update public.loans_clean set start_date = concat(
    split_part(start_date, '-', 1), '-',
    split_part(start_date, '-', 3), '-',
    split_part(start_date, '-', 2))
where length(split_part(start_date, '-', 1)) = 4
and split_part(start_date, '-', 2)::int > 12
and start_date is not null and start_date != '';
update public.loans_clean set start_date = to_date(start_date, 'DD-MM-YYYY')::varchar
where length(split_part(start_date, '-', 1)) = 2
and split_part(start_date, '-', 1)::int > 12
and start_date is not null and start_date != '';
update public.loans_clean set end_date = regexp_replace(end_date, '[/.]', '-', 'g')
where end_date is not null and end_date != '';
update public.loans_clean set end_date = concat(
    split_part(end_date, '-', 1), '-',
    split_part(end_date, '-', 3), '-',
    split_part(end_date, '-', 2))
where length(split_part(end_date, '-', 1)) = 4
and split_part(end_date, '-', 2)::int > 12
and end_date is not null and end_date != '';
update public.loans_clean set end_date = to_date(end_date, 'DD-MM-YYYY')::varchar
where length(split_part(end_date, '-', 1)) = 2
and split_part(end_date, '-', 1)::int > 12
and end_date is not null and end_date != '';
update public.loans_clean set currency = upper(currency);
update public.loans_clean set is_active = case
    when is_active ilike 'y%' then 'Yes' when is_active ilike 'n%' then 'No'
    else 'Check Activity' end;
-- Impute missing interest rates
update public.loans_clean set
    interest_rate = case
        when loan_type = 'Personal' then 8.92 when loan_type = 'Auto' then 5.45
        when loan_type = 'Business' then 5.02 when loan_type = 'Mortgage' then 3.50
        else interest_rate end,
    notes = concat('Imputed rate ',
        case when loan_type = 'Personal' then '8.92' when loan_type = 'Auto' then '5.45'
             when loan_type = 'Business' then '5.02' when loan_type = 'Mortgage' then '3.50'
        end, '% - original was null')
where interest_rate is null;
-- Impute missing monthly payments
update public.loans_clean set
    monthly_payment = round(loan_amount * (interest_rate/1200) /
        (1 - power(1 + interest_rate/1200, -term_months)), 2),
    notes = concat(notes, ' | Monthly Payment Imputed')
where monthly_payment is null;
update public.loans_clean set
    loan_id = trim(loan_id), customer_id = trim(customer_id),
    branch_id = trim(branch_id), employee_id = trim(employee_id),
    loan_type = trim(loan_type), start_date = trim(start_date),
    end_date = trim(end_date), loan_status = trim(loan_status),
    currency = trim(currency), collateral = trim(collateral),
    is_active = trim(is_active), notes = trim(notes);

-- ── CURRENCY CONVERSION ON LOANS ────────────────────────────
-- Step 8: This is the key cleaning step for international loans
-- Exchange rates: GBP=1.27, EUR=1.09, JPY=0.0067, AED=0.27
-- INR=0.012, EGP=0.032, KRW=0.0008, CNY=0.138, CAD=0.74, MXN=0.058
alter table public.loans_clean add column if not exists exchange_rate numeric(10,4);
alter table public.loans_clean add column if not exists loan_amount_usd numeric(15,2);
alter table public.loans_clean add column if not exists amount_paid_usd numeric(15,2);
update public.loans_clean set
    exchange_rate = case currency
        when 'USD' then 1.0000 when 'GBP' then 1.2700 when 'EUR' then 1.0900
        when 'JPY' then 0.0067 when 'AED' then 0.2700 when 'INR' then 0.0120
        when 'EGP' then 0.0320 when 'KRW' then 0.0008 when 'CNY' then 0.1380
        when 'CAD' then 0.7400 when 'MXN' then 0.0580 when 'BRL' then 0.2000
        when 'PLN' then 0.2500 else 1.0000 end,
    loan_amount_usd = round(loan_amount * case currency
        when 'USD' then 1.0000 when 'GBP' then 1.2700 when 'EUR' then 1.0900
        when 'JPY' then 0.0067 when 'AED' then 0.2700 when 'INR' then 0.0120
        when 'EGP' then 0.0320 when 'KRW' then 0.0008 when 'CNY' then 0.1380
        when 'CAD' then 0.7400 when 'MXN' then 0.0580 when 'BRL' then 0.2000
        when 'PLN' then 0.2500 else 1.0000 end, 2),
    amount_paid_usd = round(amount_paid * case currency
        when 'USD' then 1.0000 when 'GBP' then 1.2700 when 'EUR' then 1.0900
        when 'JPY' then 0.0067 when 'AED' then 0.2700 when 'INR' then 0.0120
        when 'EGP' then 0.0320 when 'KRW' then 0.0008 when 'CNY' then 0.1380
        when 'CAD' then 0.7400 when 'MXN' then 0.0580 when 'BRL' then 0.2000
        when 'PLN' then 0.2500 else 1.0000 end, 2);

-- ── VERIFY FINAL ROW COUNTS ─────────────────────────────────
select 'branches_clean' as table_name, count(*) as rows from public.branches_clean
union all select 'employees_clean', count(*) from public.employees_clean
union all select 'customers_clean', count(*) from public.customers_clean
union all select 'accounts_clean', count(*) from public.accounts_clean
union all select 'transactions_clean', count(*) from public.transactions_clean
union all select 'loans_clean', count(*) from public.loans_clean
order by table_name;
