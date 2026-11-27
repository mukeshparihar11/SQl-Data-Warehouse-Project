/* CREATE TABLES 

this script creates tables in the 'datawarehouse' database , 
Dropping existing tables if they already exist.
Run scripts -
*/

DROP TABLE IF EXISTS crm_cust_info;


CREATE TABLE crm_cust_info (
cst_id INT ,
cst_key VARCHAR (50),
cst_firstname VARCHAR (50),
cst_lastname VARCHAR (50),
cst_marital_status VARCHAR (50),
cst_gndr VARCHAR (20),
cst_create_date DATE
);


DROP TABLE IF EXISTS crm_prd_info;

CREATE TABLE crm_prd_info (
prd_id INT ,
prd_key VARCHAR (50),
prd_nm VARCHAR (100),
prd_cost INT ,
prd_line VARCHAR (20),
prd_start_dt DATE ,
prd_end_dt DATE
);


DROP TABLE IF EXISTS crm_sales_details;

CREATE TABLE crm_sales_details (
sls_ord_num VARCHAR (50),
sls_prd_key VARCHAR (50),
sls_cust_id INT,
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT ,
sls_price INT 
);


DROP TABLE IF EXISTS erp_cust_bdate;

CREATE TABLE erp_cust_bdate (
CUST_AZ12 VARCHAR (50),
BDATE DATE,
GEN VARCHAR (20)
);


DROP TABLE IF EXISTS erp_cust_loc;

CREATE TABLE erp_cust_loc (
CID VARCHAR (60),
CNTRY VARCHAR (50)
);

DROP TABLE IF EXISTS erp_cat_product;

CREATE TABLE erp_cat_product (
ID  VARCHAR (50),
CAT  VARCHAR (50),
SUBCAT  VARCHAR (50),
MAINTENANCE  VARCHAR (20)
);
