CREATE DATABASE IF NOT EXISTS demo1;
USE demo1;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(20) NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(10, 2) NOT NULL,
    productAmount INT DEFAULT 0,
    productDescription TEXT,
    productStatus BIT DEFAULT 1 -- 1: Active, 0: Inactive
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
('P001', 'iPhone 15 Pro Max', 29990000, 15, 'Flagship smartphone from Apple', 1),
('P002', 'Samsung Galaxy S24 Ultra', 26990000, 10, 'Flagship smartphone from Samsung', 1),
('P003', 'MacBook Air M3', 27990000, 8, 'Apple laptop with M3 chip', 1),
('P004', 'Sony WH-1000XM5', 6500000, 25, 'Active noise-canceling headphones', 1),
('P005', 'Dell XPS 13', 32000000, 5, 'Premium ultrabook from Dell', 0);

CREATE UNIQUE INDEX idx_product_code ON Products(productCode);

CREATE INDEX idx_name_price ON Products(productName, productPrice);

EXPLAIN SELECT * FROM Products WHERE productDescription LIKE 'Apple%';

EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';

CREATE VIEW v_product_summary AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
SELECT * FROM v_product_summary;

CREATE OR REPLACE VIEW v_product_summary AS
SELECT productCode, productName, productPrice, productAmount, productStatus
FROM Products;
SELECT * FROM v_product_summary;

DROP VIEW IF EXISTS v_product_summary;

DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

CALL GetAllProducts();

DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_code VARCHAR(20),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10, 2),
    IN p_amount INT,
    IN p_desc TEXT,
    IN p_status BIT
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_code, p_name, p_price, p_amount, p_desc, p_status);
END //
DELIMITER ;

CALL AddProduct('P006', 'iPad Pro M4', 28990000, 12, 'Ultra thin iPad with Tandem OLED', 1);

DELIMITER //
CREATE PROCEDURE UpdateProductById(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10, 2),
    IN p_amount INT,
    IN p_desc TEXT,
    IN p_status BIT
)
BEGIN
    UPDATE Products 
    SET productName = p_name,
        productPrice = p_price,
        productAmount = p_amount,
        productDescription = p_desc,
        productStatus = p_status
    WHERE Id = p_id;
END //
DELIMITER ;

CALL UpdateProductById(1, 'iPhone 15 Pro Max (Sửa đổi)', 28500000, 20, 'Updated description', 1);

DELIMITER //
CREATE PROCEDURE DeleteProductById(
    IN p_id INT
)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //
DELIMITER ;

CALL DeleteProductById(5);