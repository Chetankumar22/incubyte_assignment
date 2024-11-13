CREATE TABLE all_customers (
    customer_name VARCHAR(255),
    customer_id VARCHAR(18) PRIMARY KEY,
    open_date DATE,
    last_consulted_date DATE,
    vaccination_id VARCHAR(5),
    dr_name VARCHAR(255),
    state VARCHAR(5),
    country VARCHAR(5),
    post_code INT,
    dob DATE,
    is_active CHAR(1)
);


CREATE TABLE Table_ind (
    customer_id VARCHAR(18) PRIMARY KEY,
    customer_name VARCHAR(255),
    open_date DATE,
    last_consulted_date DATE,
    vaccination_id VARCHAR(5),
    dr_name VARCHAR(255),
    state VARCHAR(5),
    country VARCHAR(5) DEFAULT 'IND'::character varying NOT NULL,
    dob DATE,
    is_active CHAR(1),
    age INT,
    days_since_last_consulted INT
);

CREATE TABLE Table_usa (
    customer_id VARCHAR(18) PRIMARY KEY,
    customer_name VARCHAR(255),
    open_date DATE,
    last_consulted_date DATE,
    vaccination_id VARCHAR(5),
    dr_name VARCHAR(255),
    state VARCHAR(5),
    country VARCHAR(5) DEFAULT 'USA'::character varying NOT NULL,
    dob DATE,
    is_active CHAR(1),
    age INT,
    days_since_last_consulted INT
);

CREATE TABLE Table_aus (
    customer_id VARCHAR(18) PRIMARY KEY,
    customer_name VARCHAR(255),
    open_date DATE,
    last_consulted_date DATE,
    vaccination_id VARCHAR(5),
    dr_name VARCHAR(255),
    state VARCHAR(5),
    country VARCHAR(5) DEFAULT 'NYC'::character varying NOT NULL,
    dob DATE,
    is_active CHAR(1),
    age INT,
    days_since_last_consulted INT
);

CREATE TABLE Table_phl (
    customer_id VARCHAR(18) PRIMARY KEY,
    customer_name VARCHAR(255),
    open_date DATE,
    last_consulted_date DATE,
    vaccination_id VARCHAR(5),
    dr_name VARCHAR(255),
    state VARCHAR(5),
    country VARCHAR(5) DEFAULT 'AUS'::character varying NOT NULL,
    dob DATE,
    is_active CHAR(1),
    age INT,
    days_since_last_consulted INT
);

CREATE TABLE Table_uk (
    customer_id VARCHAR(18) PRIMARY KEY,
    customer_name VARCHAR(255),
    open_date DATE,
    last_consulted_date DATE,
    vaccination_id VARCHAR(5),
    dr_name VARCHAR(255),
    state VARCHAR(5),
    country VARCHAR(5) DEFAULT 'IND'::character varying NOT NULL,
    dob DATE,
    is_active CHAR(1),
    age INT,
    days_since_last_consulted INT
);
CREATE TABLE Table_can (
    customer_id VARCHAR(18) PRIMARY KEY,
    customer_name VARCHAR(255),
    open_date DATE,
    last_consulted_date DATE,
    vaccination_id VARCHAR(5),
    dr_name VARCHAR(255),
    state VARCHAR(5),
    country VARCHAR(5) DEFAULT 'IND'::character varying NOT NULL,
    dob DATE,
    is_active CHAR(1),
    age INT,
    days_since_last_consulted INT
);
CREATE TABLE Table_nz (
    customer_id VARCHAR(18) PRIMARY KEY,
    customer_name VARCHAR(255),
    open_date DATE,
    last_consulted_date DATE,
    vaccination_id VARCHAR(5),
    dr_name VARCHAR(255),
    state VARCHAR(5),
    country VARCHAR(5) DEFAULT 'IND'::character varying NOT NULL,
    dob DATE,
    is_active CHAR(1),
    age INT,
    days_since_last_consulted INT
);