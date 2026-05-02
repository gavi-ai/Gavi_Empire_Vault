use warehouse gavi_compute_wh;

CREATE OR REPLACE TABLE EMPIRE_DB.SILVER_LAYER.CLEAN_WORKFLOW_LOGS AS
SELECT 
    Log_ID,
    UPPER(Agent_Type) AS Agent_Type_Clean, -- Sab kuch CAPITAL mein
    COALESCE(Execution_Status, 'PENDING_REVIEW') AS Final_Status, -- NULL hatake default value daali
    CURRENT_TIMESTAMP() AS Processed_At -- Audit trail ke liye timestamp
FROM EMPIRE_DB.BRONZE_LAYER.RAW_WORKFLOW_LOGS
WHERE Log_ID IS NOT NULL;

ALTER WAREHOUSE GAVI_COMPUTE_WH SUSPEND;