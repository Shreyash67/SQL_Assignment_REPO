/*Q28.Write an SQL query to report the customer_id and customer_name of customers who have spent at
least $100 in each month of June and July 2020.*/
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    Name VARCHAR(255),
    Country VARCHAR(255)
);
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    description VARCHAR(255),
    price INT(255)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    Quantity INT
);
INSERT INTO Customers (customer_id, Name, Country)
VALUES
    (1, 'Winston', 'USA'),
    (2, 'Jonathan', 'Peru'),
    (3, 'Moustafa', 'Egypt');
INSERT INTO Product (product_id,description,price)
VALUES
    (10, 'LC Phone', 300),
    (20, 'LC T-Shirt', 10),
    (30, 'LC Book', 45),
    (40, 'LC Keychain', 2);
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity)
VALUES
    (1, 1, 10, '2020-06-10', 1),
    (2, 1, 20, '2020-07-01', 1),
    (3, 1, 30, '2020-07-08', 2),
    (4, 2, 10, '2020-06-15', 2),
    (5, 2, 40, '2020-07-01', 10),
    (6, 3, 20, '2020-06-24', 2),
    (7, 3, 30, '2020-06-25', 2),
    (9, 3, 30, '2020-05-08', 3);
    
select t.customer_id, t.name from
(select c.customer_id, c.name, 
sum(case when month(o.order_date) = 6 and year(o.order_date) = 2020 then
p.price*o.quantity else 0 end) as june_spent,
sum(case when month(o.order_date) = 7 and year(o.order_date) = 2020 then
p.price*o.quantity else 0 end) as july_spent
from
Orders o
left join
Product p
on o.product_id = p.product_id
left join
Customers c
on o.customer_id = c.customer_id
group by c.customer_id) t
where june_spent >= 100 and july_spent >= 100;

