/*
Stored Procedure: Load data 

Script Purpose:
    This stored procedure loads data into the 'datawarehouse' database from external CSV files.
    It performs the following actions:
    - Truncates the all tables before loading data.
    - Uses the `LOAD DATA LOCAL INFILE ` command to load data from csv Files to tables.

*/


LOAD DATA LOCAL INFILE 'D:/sql-data-warehouse-project (1)/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
INTO TABLE	 cust_info
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/sql-data-warehouse-project (1)/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
INTO TABLE prd_info
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'D:/sql-data-warehouse-project (1)/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
INTO TABLE sales_details
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
 
 

LOAD DATA LOCAL INFILE "D:/sql-data-warehouse-project (1)/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv"
INTO TABLE CUST_AZ12
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "D:/sql-data-warehouse-project (1)/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv"
INTO TABLE LOC_A101
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
 
 LOAD DATA LOCAL INFILE "D:/sql-data-warehouse-project (1)/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv"
INTO TABLE PX_CAT_G1V2
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
