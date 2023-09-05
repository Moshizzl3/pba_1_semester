-- Exercises Lecture 3.

-- Excercise 1 --

-- Query customers (all columns) whose address contains ‘trail’ or ‘avenue’ and first name starts with ‘D’ in ascending order of the first name.
USE sql_store;

SELECT * 
FROM customers 
WHERE (address LIKE '%trail%' or address LIKE '%avenue%')
AND first_name LIKE 'D%'
ORDER BY first_name ASC;

-- Excercise 2 --
-- Query customers (all columns) who did not fill their phone number (in ascending order). Implement pagination – a page contains 50 records. Show the records for the third page.

USE sql_store;

SELECT * 
FROM customers 
WHERE phone IS NULL
ORDER BY first_name ASC
LIMIT 50 OFFSET 100;

-- Excercise 3 --
-- Give chosen customers a 100 points bonus. Requirement for the bonus is: Customers must be born between 1. January 1970 and 1. January 1990. 
-- And they must live in a city which starts with ‘C’. And they must have registered their phone number.

USE sql_store;

UPDATE customers	
SET points = points + 100
WHERE birth_date BETWEEN '1970-01-01' AND '1990-01-01' 
AND CITY LIKE 'C%'
AND phone IS NOT NULL;


-- 4. From sql_store database, query customer_id, last name, order_id, order status, shipper name. 
-- We want to only see all records with customers that have placed at least 1 order.

USE sql_store;

SELECT c.customer_id, c.last_name, o.order_id, os.name AS order_status, s.name AS shipper_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_statuses os ON o.status = os.order_status_id
LEFT JOIN shippers s ON o.shipper_id = s.shipper_id;

-- 5. Query data from sql_hr database. First generate the ERD. Show employee id, last name, job title and an extra column called 
-- Manager where you show the last name of the employees’ manager.

USE sql_hr;

SELECT e.employee_id, e.last_name, e.job_title, d.last_name as manager
FROM employees e
LEFT JOIN employees d ON e.reports_to = d.employee_id;

-- 6. Query data from sql_invoicing database. First generate the ERD of the database to gain the better understanding of the database structure. 
-- We want to show following information: payment id, payment date, payment, invoice id, invoice total payment, client name, payment method. 
-- We want to see the records for all payments.

USE sql_invoicing;

SELECT p.payment_id, p.date as payment_date, p.amount, i.invoice_id, total_payment, c.client_name, pm.payment_method
FROM payments p
LEFT JOIN invoices i ON p.invoice_id = i.invoice_id
LEFT JOIN clients c ON p.client_id = c.client_id
INNER JOIN payment_methods pm ON p.payment_method = pm.payment_method_id 




-- 7. Look at the sql_store ERD. Identify tables where data inconsistency can appear. Try to insert some inconsistent data. Fix the ERD and synchronize the database with the changed ERD. You might have to delete the inconsistent records first before you can synchronize. Now confirm that you cannot anymore put the inconsistent data (for example non-existing IDs from a related table).
-- 8. After completing task 7, try to query all the orders that contain an item that has a note. Show following data: order_id, product_id, quantity, unit_price, total price, order status, product name, note text. pic
-- 9. On Fronter in the source_code/mysql/for lecture 5/mysql_hr there is a sql file for generating a sample mysql_hr database. The file is not generating the foreign keys properly. After you create the database open the ERD file where the relations are fixed. Then you need to synchronize this ERD with the database. There are exercises for this database here: https://www.w3resource.com/mysql-exercises/
-- 10. On Fronter in the source_code/mysql/for lecture 5/northwind there is a sql file for generating a sample northwind database. There is another file containing the ERD of that database. You can either execute the sql file or you can open the ERD file in the MySQL Workbench and forward engineer the database from the ERD. Look at the diagram and try query some data out of it. You can use it for your training as it provides a good level of complexity.
-- 11. From sql_store, query products that have never been ordered.
-- 12. From sql_store, query all the info about orders and add an extra column “status” which will say “active” for the orders that are not older than one year. Otherwise it will say “archived”.
-- 13. From sql_invoicing you want to query following: highest invoice, lowest invoice, average invoice, sum of the invoices, number of invoices, number of paid invoices, number of clients.
-- 14. Query payment date, payment method and sum of payments – based on date and payment method - from sql_invoicing database, payment table.
-- 15. From sql_invoicing query 2 columns: payment method, payment sum for that payment method. Add an extra row which will show the sum of all the payments. Something like this: 

-- 16. Query this from sql_invoicing database: -- (Numbers can be different in your database, that is fine).
