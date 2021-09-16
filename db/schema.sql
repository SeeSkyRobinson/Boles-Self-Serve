CREATE DATABASE project2;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE receipts (
    id SERIAL PRIMARY KEY,
    session_id TEXT,
    user_id INTEGER,
    product_id INTEGER,
    product_name TEXT,
    unit_cost INTEGER,
    unit_type TEXT,
    quantity INTEGER,
    creation_time TIMESTAMP     
);

CREATE TABLE groceries (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    image_url TEXT,
    unit_cost INTEGER,
    unit_type TEXT,
    quantity INTEGER,
    department TEXT,
    popularity INTEGER
);

