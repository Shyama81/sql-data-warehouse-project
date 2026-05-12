CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
start_time TIMESTAMP;
end_time TIMESTAMP;
batch_start_time TIMESTAMP;
batch_end_time TIMESTAMP;
BEGIN
start_time := clock_timestamp();
RAISE NOTICE '=============================';
RAISE NOTICE 'Loading Bronze Layer Started AT: %',start_time;
RAISE NOTICE '=============================';

batch_start_time := clock_timestamp();
RAISE NOTICE 'Loading bronze.crm_cust_info';
TRUNCATE Table bronze.crm_cust_info;
COPY bronze.crm_cust_info FROM  '/home/shyama/Downloads/sql-data-warehouse-project-main/datasets/source_crm/cust_info.csv' DELIMITER ','CSV HEADER;
batch_end_time := clock_timestamp();
RAISE NOTICE 'Done bronze.crm_cust_info | Duration: % milliseconds ', EXTRACT (MILLISECONDS FROM(batch_end_time - batch_start_time));
RAISE NOTICE '-----------------------------';

batch_start_time := clock_timestamp();
RAISE NOTICE 'Loading bronze.crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;
COPY bronze.crm_prd_info FROM '/home/shyama/Downloads/sql-data-warehouse-project-main/datasets/source_crm/prd_info.csv' DELIMITER ','CSV HEADER;
batch_end_time := clock_timestamp();
RAISE NOTICE 'Done bronze.crm_prd_info  | Duration: % milliseconds ', EXTRACT (MILLISECONDS FROM(batch_end_time - batch_start_time));
RAISE NOTICE '---------------------------';

batch_start_time := clock_timestamp();
RAISE NOTICE 'Loading bronze.crm_sales_details';
TRUNCATE TABLE bronze.crm_sales_details;
COPY bronze.crm_sales_details FROM '/home/shyama/Downloads/sql-data-warehouse-project-main/datasets/source_crm/sales_details.csv' DELIMITER ','CSV HEADER;
batch_end_time := clock_timestamp();
RAISE NOTICE 'Done bronze.crm_sales_details  | Duration: % milliseconds ', EXTRACT (MILLISECONDS FROM(batch_end_time - batch_start_time));
RAISE NOTICE '--------------------------';

batch_start_time := clock_timestamp();
RAISE NOTICE 'Loading bronze.erp_cust_az12';
TRUNCATE TABLE bronze.erp_cust_az12;
COPY bronze.erp_cust_az12 FROM '/home/shyama/Downloads/sql-data-warehouse-project-main/datasets/source_erp/CUST_AZ12.csv' DELIMITER ','CSV HEADER;
batch_end_time := clock_timestamp();
RAISE NOTICE 'Done Loading bronze.erp_cust_az12  | Duration: % milliseconds ', EXTRACT (MILLISECONDS FROM(batch_end_time - batch_start_time));
RAISE NOTICE '---------------------------';

batch_start_time := clock_timestamp();
RAISE NOTICE 'Loading bronze.erp_loc_a101';
TRUNCATE Table bronze.erp_loc_a101;
COPY bronze.erp_loc_a101 FROM '/home/shyama/Downloads/sql-data-warehouse-project-main/datasets/source_erp/LOC_A101.csv' DELIMITER ','CSV HEADER;
batch_end_time := clock_timestamp();
RAISE NOTICE 'Done Loading bronze.erp_loc_a101  | Duration: % milliseconds ', EXTRACT (MILLISECONDS FROM(batch_end_time - batch_start_time));
RAISE NOTICE '---------------------------';

batch_start_time :=clock_timestamp();
RAISE NOTICE 'Loading bronze.erp_px_cat_glv2';
TRUNCATE Table bronze.erp_px_cat_glv2;
COPY bronze.erp_px_cat_glv2 FROM '/home/shyama/Downloads/sql-data-warehouse-project-main/datasets/source_erp/PX_CAT_G1V2.csv' DELIMITER ','CSV HEADER;
batch_end_time := clock_timestamp();
RAISE NOTICE 'Done Loading bronze.erp_px_cat_glv2 | Duration: % milliseconds ', EXTRACT (MILLISECONDS FROM(batch_end_time - batch_start_time));
RAISE NOTICE '---------------------------';

end_time:= clock_timestamp();
RAISE NOTICE '============================';
RAISE NOTICE 'TOTAL DURATION IN MILLISECONDS % MILLISECONDS',EXTRACT(MILLISECONDS FROM (end_time - start_time));
END;
$$;
CALL bronze.load_bronze()

SELECT * FROM bronze.crm_cust_info;
SELECT * FROM bronze.crm_prd_info

SELECT * FROM bronze.crm_sales_details

SELECT * FROM bronze.erp_cust_az12

SELECT * FROM bronze.erp_loc_a101

SELECT * FROM bronze.erp_px_cat_glv2

