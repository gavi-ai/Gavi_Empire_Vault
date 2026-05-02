create or replace view GAVI_COMPUTE_WH
   with warehouse_size = 'X-SMALL'
   auto_suspend = 60
   auto_resume = true
   initially_suspended = true
   comment = 'primary engine for the empire. shuts down in 60s to save malkins money ';

   create or replace view database emppire_db
   comment = 'the central vault for all assets';

   CREATE OR REPLACE SCHEMA EMPIRE_DB.BRONZE_LAYER
  COMMENT = 'Raw, unpolished data drops here (Like our Parquet files).';

CREATE OR REPLACE SCHEMA EMPIRE_DB.SILVER_LAYER
  COMMENT = 'Cleaned and filtered data (Post-Gavi processing).';

  use warehouse GAVI_COMPUTE_WH;
  use database emppire_db;
  use schema emppire_db.bronze_layer;

  select current_warehouse(), current_database(), current_schema();
  