# DATA WAREHOUSE AND ANALYTICS PROJECT
## Data Architecture
1. Bronze Layer: Stores raw data as-is from the source systems. Data is ingested from CSV Files into PostgreSQL Database.
2. Silver Layer:  This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. Gold Layer: Business-ready data modeled into a star schema required for reporting and analytics.

## Tech Stack:
1. Database: PostgreSQL 17
2. Language:SQL, PL/pgSQL
3. Architecture: Medallion Architecture (Bronze/Silver/Gold)
4. Data Modeling: Star Schema (Fact & Dimension Tables)
5. Source Data: CSV Files (CRM & ERP systems)
     
## Project Overview
This project involves:
1. Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
2. ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.
3. Data Modeling: Developing fact and dimension tables optimized for analytical queries.
4. Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.

## Data Sources
1. CRM System: Customer info, product info, sales details
2. ERP System: Customer records, location data, product categories

## Project Structure
├── datasets/
│   ├── source_crm/
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   └── source_erp/
│       ├── CUST_AZ12.csv
│       ├── LOC_A101.csv
│       └── PX_CAT_G1V2.csv
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
└── README.md

## How to Run
1. Clone the repository
2. Create the database
   CREATE DATABASE datawarehouse;
3. Run bronze layer
   CALL bronze.load_bronze();
4. Run silver layer
   CALL silver.load_silver();
5. Run gold layer
  

   
