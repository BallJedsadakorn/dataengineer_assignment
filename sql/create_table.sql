\connect postgres;

CREATE TABLE IF NOT EXISTS company (
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    district VARCHAR(100),
    province VARCHAR(100),
    phone_no VARCHAR(20),
    effective_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR NULL ,
    updated_by VARCHAR NULL
);

CREATE TABLE IF NOT EXISTS plan (
    plan_id SERIAL PRIMARY KEY,
    description TEXT,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR NULL,
    updated_by VARCHAR NULL
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    plan_id INT NOT NULL,
    gender CHAR(1),
    district VARCHAR(100),
    province VARCHAR(100),
    preferred_hospital VARCHAR(100),
    plan_started_date VARCHAR NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    created_by VARCHAR NULL,
    updated_by VARCHAR NULL,
    loaddt bpchar(12) NULL
);
