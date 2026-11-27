/*
Stored Procedure: Load data 

Script Purpose:
 This stored procedure loads data into the 'datawarehouse' 
 database from external CSV files.It performs the following actions:
    - Truncates the all tables before loading data.
    - Uses the `LOAD DATA LOCAL INFILE ` command to load data from csv Files to tables.

*/
/* 
Raw data load script 

   - Source CSVs are loaded as it
   - Blank values and invalid dates (e.g. '#VALUE!') in the CSVs caused
     warnings 1366 (Incorrect integer value) and 1265 (Data truncated)
     when loaded straight into INT / DATE columns.
     
   - Fix: read each risky column into a user variable (@col) first, then
     convert it with SET during the load. real data cleaning happens later in SQL.

   - NULLIF(TRIM(@col), '')  : trim spaces; blank text becomes NULL
                               (an empty string is not a valid INT / DATE)
   - STR_TO_DATE(text, fmt)  : convert text to a real DATE using the
                               source format ('%d-%m-%Y' or '%Y-%m-%d')
   - NULLIF(..., '#VALUE!')  : sales_details.sls_order_dt has an CSV
                               error value in 18 rows; treat it as NULL
   - Text columns are loaded untouched (spaces kept) so that cleaning
     (TRIM, standardising etc.) stays visible in the cleaning step.
*/

TRUNCATE TABLE crm_cust_info;

LOAD DATA LOCAL INFILE 'C:/Users/Mukku/OneDrive/Desktop/cust_info.csv'
INTO TABLE	crm_cust_info
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, @cst_create_date)
SET 
    cst_id = NULLIF(TRIM(@cst_id), ''),
    cst_gndr = NULLIF(TRIM(@cst_gndr), ''),
    cst_create_date = STR_TO_DATE(NULLIF(TRIM(@cst_create_date), ''), '%Y-%m-%d');


TRUNCATE TABLE crm_prd_info;

LOAD DATA LOCAL INFILE 'C:/Users/Mukku/OneDrive/Desktop/prd_info.csv'
INTO TABLE crm_prd_info
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@prd_id, prd_key, prd_nm, @prd_cost, prd_line, @prd_start_dt, @prd_end_dt)
SET 
    prd_id   = NULLIF(TRIM(@prd_id), ''),
    prd_cost = NULLIF(TRIM(@prd_cost), ''),
    prd_start_dt = STR_TO_DATE(NULLIF(TRIM(@prd_start_dt), ''), '%d-%m-%Y'),
    prd_end_dt   = STR_TO_DATE(NULLIF(TRIM(@prd_end_dt), ''), '%d-%m-%Y');

TRUNCATE TABLE crm_sales_details;

LOAD DATA LOCAL INFILE 'C:/Users/Mukku/OneDrive/Desktop/sales_details.csv'
INTO TABLE crm_sales_details
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(sls_ord_num, sls_prd_key, @sls_cust_id, @sls_order_dt, @sls_ship_dt, @sls_due_dt,
 @sls_sales, @sls_quantity, @sls_price)
SET 
    sls_cust_id  = NULLIF(TRIM(@sls_cust_id), ''),
    sls_sales    = NULLIF(TRIM(@sls_sales), ''),
    sls_quantity = NULLIF(TRIM(@sls_quantity), ''),
    sls_price    = NULLIF(TRIM(@sls_price), ''),
    sls_order_dt = STR_TO_DATE(NULLIF(NULLIF(TRIM(@sls_order_dt), ''), '#VALUE!'), '%d-%m-%Y'),
    sls_ship_dt  = STR_TO_DATE(NULLIF(TRIM(@sls_ship_dt), ''), '%d-%m-%Y'),
    sls_due_dt   = STR_TO_DATE(NULLIF(TRIM(@sls_due_dt), ''), '%d-%m-%Y');
 
 
TRUNCATE TABLE erp_cust_loc;

LOAD DATA LOCAL INFILE 'C:/Users/Mukku/OneDrive/Desktop/cust_loc.csv'
INTO TABLE erp_cust_loc
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'  -- currect script ..
IGNORE 1 ROWS;

TRUNCATE TABLE erp_cust_bdate;

LOAD DATA LOCAL INFILE 'C:/Users/Mukku/OneDrive/Desktop/cust_bdate.csv'
INTO TABLE erp_cust_bdate
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@CID, @BDATE, @GEN)
SET 
   BDATE = STR_TO_DATE(NULLIF(TRIM(@BDATE), ''), '%d-%m-%Y');
 
 TRUNCATE TABLE erp_cat_product; 
 
 LOAD DATA LOCAL INFILE 'C:/Users/Mukku/OneDrive/Desktop/cat_product.csv'
INTO TABLE erp_cat_product
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' -- currect script ..
IGNORE 1 ROWS;
