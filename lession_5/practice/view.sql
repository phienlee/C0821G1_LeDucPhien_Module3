
USE `classicmodels`;	

CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;

DELIMITER //

select * from customer_views;

-- Cập nhật lại view
CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';

select * from customer_views;

-- Xóa view
DROP VIEW customer_views;
