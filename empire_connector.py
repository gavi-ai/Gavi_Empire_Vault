import time

print("Starting Empire Connector...")
time.sleep(1)

def send_sql_to_snowflake(sql_query, step_name):
    print(f"\n🚀 [NETWORK]: Executing -> {step_name}")
    print(f"📄 [QUERY RAW]: \n{sql_query.strip()}")
    time.sleep(1.5) # Simulating network delay
    print("✅ [RESPONSE]: Acknowledged by Cloud Engine!")
    
start_engine_sql = """
use warehouse gavi_compute_wh;
"""
send_sql_to_snowflake(start_engine_sql, "Start Compute Engine")
create_table_sql = """
CREATE TABLE EMPIRE_DB.BRONZE_LAYER.RAW_WORKFLOW_LOGS (
    Log_ID INT,
    Agent_Type VARCHAR(50),
    Execution_Status VARCHAR(20)
);
"""
send_sql_to_snowflake(create_table_sql, "Create Raw Workflow Logs Table")
print("\nEmpire Connector setup complete! Ready to ingest data into the vault.")

