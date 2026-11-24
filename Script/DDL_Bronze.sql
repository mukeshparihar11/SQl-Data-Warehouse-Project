/* CREATE TABLES 

this script creates tables in the 'datawarehouse' database , Dropping existing tables if they already exist.

*/

DROP TABLE IF EXIST cust_info;


CREATE TABLE  cust_info (
cst_id INT ,
cst_key VARCHAR (50),
cst_firstname VARCHAR (50),
cst_lastname VARCHAR (50),
cst_marital_status VARCHAR (50),
cst_gndr VARCHAR (20),
cst_create_date DATE
);


DROP TABLE IF EXIST prd_info;

CREATE TABLE  prd_info (
prd_id INT ,
prd_key VARCHAR (50),
prd_nm VARCHAR (100),
prd_cost BOOLEAN ,
prd_line VARCHAR (20),
prd_start_dt DATETIME ,
prd_end_dt DATETIME
);


DROP TABLE IF EXIST sales_details;

CREATE TABLE sales_details (
sls_ord_num VARCHAR (50),
sls_prd_key VARCHAR (50),
sls_cust_id INT,
sls_order_dt DATETIME,
sls_ship_dt DATETIME,
sls_due_dt DATETIME,
sls_sales BOOLEAN,
sls_quantity INT ,
sls_price BOOLEAN 
);


DROP TABLE IF EXIST CUST_AZ12;

CREATE TABLE CUST_AZ12 (
CUST_AZ12 VARCHAR (50),
BDATE DATETIME,
GEN VARCHAR (20)
);


DROP TABLE IF EXIST CUST_AZ12;

CREATE TABLE LOC_A101 (
CID VARCHAR (60),
CNTRY VARCHAR (50)
);

DROP TABLE IF EXIST PX_CAT_G1V2;

CREATE TABLE PX_CAT_G1V2 (
ID  VARCHAR (50),
CAT  VARCHAR (50),
SUBCAT  VARCHAR (50),
MAINTENANCE  VARCHAR (20)
);

