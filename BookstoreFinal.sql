/*CREATING DATABASE*/
CREATE DATABASE BOOKSTORE1;
USE BOOKSTORE1;


/*CREATING TABLES*/
CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(15),
    email VARCHAR(255) UNIQUE
);

CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher_id INT,
    genre VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    publication_year INT,
    stock_quantity INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(15),
    registration_date DATE
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    status VARCHAR(50),
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
    order_id INT,
    ISBN VARCHAR(13),
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, ISBN),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(255),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13),
    customer_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


/*INSERTING VALUES*/
INSERT INTO Publishers (name, address, contact_number, email) VALUES
('Marvel Comics', '135 W 50th St, New York, NY', '212-576-4000', 'info@marvel.com'),
('DC Comics', '1700 Broadway, New York, NY', '212-636-5400', 'info@dccomics.com'),
('Image Comics', '2701 Harbor Bay Parkway, Alameda, CA', '510-644-4980', 'info@imagecomics.com'),
('Dark Horse Comics', '10956 SE Main St, Milwaukie, OR', '503-652-8815', 'info@darkhorse.com'),
('IDW Publishing', '2765 Truxtun Rd, San Diego, CA', '858-270-1315', 'info@idwpublishing.com'),
('Boom! Studios', '5126 Clareton Dr #180, Agoura Hills, CA', '818-889-2666', 'info@boom-studios.com'),
('Archie Comics', '325 Fayette Ave, Mamaroneck, NY', '914-381-5155', 'info@archiecomics.com'),
('Valiant Comics', '424 Madison Ave, New York, NY', '646-216-9785', 'info@valiantcomics.com'),
('Dynamite Entertainment', '555 8th Ave, New York, NY', '212-695-4300', 'info@dynamite.com'),
('Oni Press', '933 SE Oak St, Portland, OR', '503-233-6545', 'info@onipress.com');

INSERT INTO Books (ISBN, title, author, publisher_id, genre, price, publication_year, stock_quantity) VALUES
('9780785167899', 'Avengers: Infinity War', 'Jim Starlin', 1, 'Superhero', 19.99, 2018, 50),
('9781401238964', 'Batman: The Dark Knight Returns', 'Frank Miller', 2, 'Superhero', 24.99, 1986, 30),
('9781534306320', 'Saga: Volume 1', 'Brian K. Vaughan', 3, 'Sci-Fi', 9.99, 2012, 40),
('9781616557678', 'Hellboy: Seed of Destruction', 'Mike Mignola', 4, 'Horror', 17.99, 1994, 25),
('9781631403998', 'Transformers: The IDW Collection', 'Various', 5, 'Action', 49.99, 2015, 15),
('9781608862904', 'Lumberjanes: Volume 1', 'Noelle Stevenson', 6, 'Adventure', 14.99, 2014, 35),
('9781936975488', 'The Best of Archie Comics: Deluxe Edition', 'Various', 7, 'Humor', 29.99, 2011, 20),
('9781939346186', 'X-O Manowar: Enter Ninjak', 'Robert Venditti', 8, 'Action', 16.99, 2013, 10),
('9781606906617', 'Red Sonja: She-Devil with a Sword', 'Gail Simone', 9, 'Fantasy', 19.99, 2014, 12),
('9781934964385', 'Scott Pilgrim: Precious Little Life', 'Bryan Lee O\'Malley', 10, 'Comedy', 11.99, 2004, 45);

INSERT INTO Customers (name, address, email, phone_number, registration_date) VALUES
('John Doe', '123 Main St, Springfield, IL', 'johndoe@example.com', '217-555-1234', '2023-01-15'),
('Jane Smith', '456 Oak St, Springfield, IL', 'janesmith@example.com', '217-555-5678', '2023-02-10'),
('Alice Johnson', '789 Pine St, Springfield, IL', 'alicej@example.com', '217-555-9012', '2023-03-05'),
('Bob Brown', '101 Maple St, Springfield, IL', 'bobbrown@example.com', '217-555-3456', '2023-04-01'),
('Carol White', '202 Birch St, Springfield, IL', 'carolwhite@example.com', '217-555-7890', '2023-05-20'),
('David Wilson', '303 Cedar St, Springfield, IL', 'davidwilson@example.com', '217-555-2345', '2023-06-15'),
('Eve Davis', '404 Walnut St, Springfield, IL', 'evedavis@example.com', '217-555-6789', '2023-07-10'),
('Frank Moore', '505 Hickory St, Springfield, IL', 'frankmoore@example.com', '217-555-0123', '2023-08-05'),
('Grace Taylor', '606 Poplar St, Springfield, IL', 'gracetaylor@example.com', '217-555-4567', '2023-09-01'),
('Hank Martin', '707 Elm St, Springfield, IL', 'hankmartin@example.com', '217-555-8901', '2023-10-25');

INSERT INTO Orders (customer_id, order_date, status, total_amount) VALUES
(1, '2023-02-01', 'Shipped', 39.98),
(2, '2023-02-15', 'Processing', 24.99),
(3, '2023-03-10', 'Delivered', 49.99),
(4, '2023-04-05', 'Cancelled', 17.99),
(5, '2023-05-25', 'Shipped', 9.99),
(6, '2023-06-20', 'Processing', 14.99),
(7, '2023-07-15', 'Delivered', 29.99),
(8, '2023-08-10', 'Shipped', 16.99),
(9, '2023-09-05', 'Delivered', 19.99),
(10, '2023-10-30', 'Processing', 11.99);

INSERT INTO Order_Details (order_id, ISBN, quantity, price) VALUES
(1, '9780785167899', 2, 19.99),
(2, '9781401238964', 1, 24.99),
(3, '9781534306320', 5, 9.99),
(4, '9781616557678', 1, 17.99),
(5, '9781631403998', 1, 9.99),
(6, '9781608862904', 1, 14.99),
(7, '9781936975488', 1, 29.99),
(8, '9781939346186', 1, 16.99),
(9, '9781606906617', 1, 19.99),
(10, '9781934964385', 1, 11.99);

INSERT INTO Employees (name, position, hire_date, salary) VALUES
('Paul Walker', 'Manager', '2022-01-01', 55000.00),
('Linda Green', 'Cashier', '2022-03-15', 30000.00),
('Mark Brown', 'Stock Clerk', '2022-05-20', 25000.00),
('Emily White', 'Assistant Manager', '2022-07-10', 45000.00),
('James Black', 'Customer Service', '2022-09-25', 28000.00),
('Natalie Grey', 'Sales Associate', '2022-11-30', 32000.00),
('Chris Red', 'Inventory Specialist', '2023-01-12', 37000.00),
('Amanda Blue', 'Marketing Coordinator', '2023-03-05', 40000.00),
('Michael Yellow', 'Security', '2023-05-22', 27000.00),
('Sophia Purple', 'Janitor', '2023-07-18', 22000.00);

INSERT INTO Categories (category_name, description) VALUES
('Superhero', 'Comic books featuring superheroes and their adventures'),
('Sci-Fi', 'Science fiction comic books exploring futuristic concepts and technologies'),
('Horror', 'Comic books designed to frighten and invoke fear'),
('Action', 'Comic books with intense action sequences and physical feats'),
('Adventure', 'Comic books with exciting journeys and explorations'),
('Humor', 'Comic books intended to be humorous and entertaining'),
('Fantasy', 'Comic books with magical and supernatural elements'),
('Comedy', 'Comic books with humorous and comedic storylines'),
('Drama', 'Comic books with serious and intense storylines'),
('Romance', 'Comic books focused on romantic relationships and love stories');

INSERT INTO Reviews (ISBN, customer_id, rating, review_text, review_date) VALUES
('9780785167899', 1, 5, 'Amazing story and artwork!', '2023-02-02'),
('9781401238964', 2, 4, 'A classic must-read for any Batman fan.', '2023-02-16'),
('9781534306320', 3, 5, 'An incredible start to a fantastic series.', '2023-03-11'),
('9781616557678', 4, 3, 'Good but not great.', '2023-04-06'),
('9781631403998', 5, 4, 'A solid collection of Transformers stories.', '2023-05-26'),
('9781608862904', 6, 5, 'Fun and entertaining!', '2023-06-21'),
('9781936975488', 7, 4, 'Great compilation of Archie stories.', '2023-07-16'),
('9781939346186', 8, 4, 'Entertaining action-packed comic.', '2023-08-11'),
('9781606906617', 9, 5, 'Red Sonja at her best!', '2023-09-06'),
('9781934964385', 10, 4, 'Funny and relatable.', '2023-10-31');


/*TABLE STRUCTURES*/
DESC Publishers;
DESC Books;
DESC Customers;
DESC Orders;
DESC Order_Details;
DESC Categories;
DESC Employees;
DESC Reviews;


/*TABLE CONTENT*/
SELECT * FROM Publishers;
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_Details;
SELECT * FROM Categories;
SELECT * FROM Employees;
SELECT * FROM Reviews;

/*DQL QUERIES*/
SELECT * FROM BOOKS WHERE AUTHOR LIKE 'FRANK MILLER';
SELECT TITLE, AUTHOR, GENRE, PUBLICATION_YEAR FROM BOOKS WHERE AUTHOR LIKE 'B%';

SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, SUM(Total_Amount) AS Total_Sales
FROM Orders WHERE Status = 'Shipped' OR Status = 'Delivered' GROUP BY DATE_FORMAT(Order_Date, '%Y-%m') ORDER BY Month;

SELECT CUSTOMERS.NAME, ORDERS.CUSTOMER_ID, ORDERS.TOTAL_AMOUNT FROM CUSTOMERS JOIN ORDERS 
ON CUSTOMERS.CUSTOMER_ID= ORDERS.CUSTOMER_ID WHERE TOTAL_AMOUNT> 20;

SELECT BOOKS.TITLE, BOOKS.AUTHOR, REVIEWS.RATING FROM BOOKS JOIN REVIEWS 
ON BOOKS.ISBN = REVIEWS.ISBN WHERE REVIEWS.RATING=5;


SELECT * FROM ORDERS WHERE STATUS = 'PROCESSING';


/*SUBQUERIES*/

SELECT * FROM ORDERS WHERE TOTAL_AMOUNT>(SELECT TOTAL_AMOUNT FROM ORDERS WHERE CUSTOMER_ID=9);

SELECT * FROM BOOKS WHERE ISBN NOT IN(SELECT ISBN FROM ORDER_DETAILS);


/*JOINS*/

SELECT ORDERS.ORDER_ID AS ORDER_ID, CUSTOMERS.CUSTOMER_ID AS CUSTOMER_ID, CUSTOMERS.NAME AS CUSTOMER_NAME, CUSTOMERS.PHONE_NUMBER AS CUSTOMER_CONTACT, 
ORDERS.ORDER_DATE AS ORDER_DATE, ORDERS.TOTAL_AMOUNT AS CART_VALUE, ORDERS.STATUS AS ORDER_STATUS FROM ORDERS JOIN CUSTOMERS 
ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID;

SELECT BOOKS.TITLE AS TITLE, BOOKS.AUTHOR AS AUTHOR, BOOKS.GENRE AS GENRE, PUBLISHERS.PUBLISHER_ID AS PUBLISHER_ID, PUBLISHERS.NAME AS PUBLISHER,
PUBLISHERS.EMAIL AS PUBLISHER_EMAIL FROM BOOKS JOIN PUBLISHERS ON BOOKS.PUBLISHER_ID = PUBLISHERS.PUBLISHER_ID;

/*VIEWS*/

CREATE VIEW CUSTOMER_ORDER_DETAILS AS (SELECT ORDERS.ORDER_ID AS ORDER_ID, CUSTOMERS.CUSTOMER_ID AS CUSTOMER_ID, CUSTOMERS.NAME AS CUSTOMER_NAME, 
CUSTOMERS.PHONE_NUMBER AS CUSTOMER_CONTACT, CUSTOMERS.EMAIL AS CUSTOMER_EMAIL, ORDERS.ORDER_DATE AS ORDER_DATE, ORDERS.TOTAL_AMOUNT AS CART_VALUE, 
ORDERS.STATUS AS ORDER_STATUS FROM ORDERS JOIN CUSTOMERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID);

SELECT * FROM CUSTOMER_ORDER_DETAILS;

CREATE VIEW INVENTORY AS (SELECT BOOKS.TITLE AS TITLE, BOOKS.AUTHOR AS AUTHOR, BOOKS.GENRE AS GENRE, BOOKS.PUBLICATION_YEAR AS PUBLICATION_YEAR, 
BOOKS.PRICE AS PRICE, REVIEWS.RATING AS RATING, BOOKS.STOCK_QUANTITY AS STOCK_QUANTITY FROM BOOKS JOIN REVIEWS ON BOOKS.ISBN = REVIEWS.ISBN WHERE 
STOCK_QUANTITY>0);

SELECT * FROM INVENTORY;

SELECT CUSTOMERS.CUSTOMER_ID,CUSTOMERS.NAME,CUSTOMERS.EMAIL,ORDERS.ORDER_ID,ORDERS.ORDER_DATE,ORDERS.STATUS FROM CUSTOMERS JOIN ORDERS 
ON CUSTOMERS.CUSTOMER_ID =ORDERS.CUSTOMER_ID;

SELECT BOOKS.TITLE,BOOKS.AUTHOR,BOOKS.PUBLISHER_ID,PUBLISHERS.PUBLISHER_ID,PUBLISHERS.NAME,PUBLISHERS.EMAIL FROM BOOKS JOIN PUBLISHERS ON 
BOOKS.PUBLISHER_ID = PUBLISHERS.PUBLISHER_ID;

CREATE VIEW CUSTOMER_ORDER_DETAILS1 AS 
(SELECT CUSTOMERS.CUSTOMER_ID,CUSTOMERS.NAME,CUSTOMERS.EMAIL,ORDERS.ORDER_ID,ORDERS.ORDER_DATE,ORDERS.STATUS,ORDERS.TOTAL_AMOUNT FROM CUSTOMERS JOIN ORDERS 
ON CUSTOMERS.CUSTOMER_ID =ORDERS.CUSTOMER_ID);

SELECT * FROM CUSTOMER_ORDER_DETAILS1;

CREATE VIEW STOCK AS
(SELECT TITLE,AUTHOR,STOCK_QUANTITY FROM BOOKS);
SELECT * FROM STOCK