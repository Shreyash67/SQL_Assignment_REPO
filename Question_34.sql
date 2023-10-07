-- Q.34 Write an SQL query to get the names of products that have at least 100 units ordered in February 2020 and 
-- their amount.Return result table in any order.

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(255)
);

CREATE TABLE Orders (
    product_id INT,
    order_date DATE,
    Unit INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name, product_category)
VALUES
    (1, 'Leetcode Solutions', 'Book'),
    (2, 'Jewels of Stringology', 'Book'),
    (3, 'HP', 'Laptop'),
    (4, 'Lenovo', 'Laptop'),
    (5, 'Leetcode Kit', 'T-shirt');

INSERT INTO Orders (product_id, order_date, Unit)
VALUES
    (1, '2020-02-05', 60),
    (1, '2020-02-10', 70),
    (2, '2020-01-18', 30),
    (2, '2020-02-11', 80),
    (3, '2020-02-17', 2),
    (3, '2020-02-24', 3),
    (4, '2020-03-01', 20),
    (4, '2020-03-04', 30),
    (4, '2020-03-04', 60),
    (5, '2020-02-25', 50),
    (5, '2020-02-27', 50),
    (5, '2020-03-01', 50);
    
select p.product_name, sum(o.unit) as unit 
from Products p left join Orders o 
on p.product_id = o.product_id where month(o.order_date) = 2 and 
year(o.order_date) = 2020 group by p.product_id having unit >= 100;    
