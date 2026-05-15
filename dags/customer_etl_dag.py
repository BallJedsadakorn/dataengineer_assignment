from airflow.operators.python import PythonOperator
from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator
from airflow.utils.trigger_rule import TriggerRule
from airflow.models.baseoperator import chain
import pandas as pd, json
from datetime import datetime, timedelta
from pathlib import Path
from airflow.decorators import dag
from airflow.operators.empty import EmptyOperator

# Load configuration from JSON
def load_config(config_path):
    with open(config_path, "r") as file:
        return json.load(file)
        
CONFIG = load_config("./config/test_de_config/variable.json")
CSV_FILE_PATH = "/opt/airflow/dataset/customers.csv"

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

DAG_ID = Path(__file__).stem

@dag(
    dag_id=DAG_ID,
    default_args=default_args,
    schedule="0 1 * * *",
    start_date=datetime(2026, 5, 14),
    catchup=False,
    tags=["author:ball"],
)
def sunnday_customer_etl_dag():
    start = EmptyOperator(task_id="start")
    end = EmptyOperator(task_id="end", trigger_rule=TriggerRule.ALL_SUCCESS)

    def connect_postgres_engine(connection_id):
        from sqlalchemy import create_engine
        from airflow.hooks.base_hook import BaseHook

        airflow_conn = BaseHook.get_connection(connection_id)
        conn_string = (
            f"postgresql+psycopg2://{airflow_conn.login}:"
            f"{airflow_conn.password}@{airflow_conn.host}:"
            f"{airflow_conn.port}/{airflow_conn.schema}"
        )
        return create_engine(conn_string)

    def read_sql(file_path):
        """Read SQL file content and return as a string."""
        with open(file_path, "r") as file:
            return file.read()

    def csv_to_postgresql():
        """Query the Postgres database and insert results into a table."""
        try:
            df = pd.read_csv(CSV_FILE_PATH)
            if df.empty:
                print("No data returned from the query.")
                return

            engine = connect_postgres_engine(CONFIG["conn_id"])

            print(df)

            df.to_sql(
                name=CONFIG["table_name"],
                con=engine,
                schema=CONFIG["schema_name"],
                if_exists='append',
                index=False,
                chunksize=CONFIG["chunksize"]
            )
            print("Data inserted successfully.")
        except Exception as e:
            print("An error occurred:", e)
        finally:
            engine.dispose()

    create_view_query = read_sql(CONFIG["sql_file_paths"]["create_view"])

    csv_to_table = PythonOperator(
        task_id='query_postgres_task',
        python_callable=csv_to_postgresql,
    )

    create_view_sql = SQLExecuteQueryOperator(
        task_id="create_view_task",
        conn_id=CONFIG["conn_id"],
        sql=create_view_query
    )

    # Define task dependencies
    chain(start, csv_to_table, create_view_sql, end)

# Instantiate the DAG
sunnday_customer_etl_dag()