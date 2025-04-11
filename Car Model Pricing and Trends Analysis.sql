-- 1. Create Database
CREATE DATABASE model_car_dealership;
USE model_car_dealership;

-- 2. Create Tables
CREATE TABLE brands (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

CREATE TABLE car_models (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(255) NOT NULL,
    brand_id INT,
    scale VARCHAR(10),
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    model_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (model_id) REFERENCES car_models(model_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 3. Insert Sample Data
INSERT INTO brands (brand_name) VALUES 
('Ferrari'), ('Lamborghini'), ('Porsche');

INSERT INTO car_models (model_name, brand_id, scale, price, stock_quantity) VALUES
('Ferrari F40', 1, '1:18', 120.00, 10),
('Lamborghini Aventador', 2, '1:24', 80.00, 15),
('Porsche 911 Carrera', 3, '1:18', 110.00, 8);

INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO sales (model_id, customer_id, sale_date, quantity) VALUES
(1, 1, '2025-04-01', 2),
(2, 2, '2025-04-02', 1),
(3, 1, '2025-04-03', 1);

-- 4. Sample Queries for Analysis

-- a) Total Sales Revenue
SELECT SUM(c.price * s.quantity) AS total_revenue
FROM sales s
JOIN car_models c ON s.model_id = c.model_id;

-- b) Best-Selling Car Models
SELECT c.model_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN car_models c ON s.model_id = c.model_id
GROUP BY c.model_name
ORDER BY total_sold DESC;

-- c) Top Customers
SELECT cu.first_name, cu.last_name, COUNT(s.sale_id) AS purchases
FROM sales s
JOIN customers cu ON s.customer_id = cu.customer_id
GROUP BY cu.customer_id
ORDER BY purchases DESC;

-- d) Current Inventory Status
SELECT model_name, stock_quantity
FROM car_models;
