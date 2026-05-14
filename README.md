# Data Engineer - Assignment

An Apache Airflow-based ETL pipeline that extracts  csv files into table customers.

---

## 📁 Project Structure

```
├── config/
│   ├── sunday_de/sql/
│   │   └── report_script.sql       # SQL script for reporting
│   └── sunday_de_config/
│       └── variable.json           # Airflow variable configurations
├── dags/
│   └── sunnday_customer_etl_dag.py # Main Airflow DAG definition
├── dataset/
│   └── customers.csv               # Source customer data
├── logs/                           # Airflow task logs
├── plugins/                        # Custom Airflow plugins
├── sql/
│   ├── create_table.sql            # DDL for target tables
│   └── mock_data.sql               # Mock data for local testing
├── docker-compose.yaml             # Docker services configuration
├── Dockerfile                      # Custom Airflow image
├── er_diagram.png                  # Entity-relationship diagram
└── requirements.txt                # Python dependencies
```

---

## ⚙️ Prerequisites

- [Docker](https://www.docker.com/) & Docker Compose
- Python 3.8+
- Apache Airflow 2.x
- Dbeaver

---
## 📊 ER Diagram

![ER Diagram](er_diagram.png)

---

## Get Started

### 1. Download folder "Assignment_DE"
 
```bash
git clone <your-repo-url>
cd <project-folder>
```

```bash
psql -U <user> -d <database> -f sql/mock_data.sql
```