
--  Create the 'DataWarehouse' database.

/*

Create Database and Schemas

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold' */
	

-- Drop and recreate the 'DataWarehouse' database


CREATE DATABASE IF NOT EXISTS datawarehouse;

USE datawarehouse;

CREATE SCHEMA Bronze;

CREATE SCHEMA Sliver;

CREATE SCHEMA Gold;
