/*Q41.Write an SQL query to report the number of cubic feet of volume the inventory occupies in each
warehouse.
Return the result table in any order.
*/
CREATE TABLE Warehouse (
    name VARCHAR(255),
    product_id INT,
    units INT,
    PRIMARY KEY (name, product_id)
);
INSERT INTO Warehouse (name, product_id, units)
VALUES
    ('LCHouse1', 1, 1),
    ('LCHouse1', 2, 10),
    ('LCHouse1', 3, 5),
    ('LCHouse2', 1, 2),
    ('LCHouse2', 2, 2),
    ('LCHouse3', 4, 1);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    Width INT,
    Length INT,
    Height INT
);

INSERT INTO Products 
VALUES
    (1, 'LC-TV', 5, 50, 40),
    (2, 'LC-KeyChain', 5, 5, 5),
    (3, 'LC-Phone', 2, 10, 10),
    (4, 'LC-T-Shirt', 4, 10, 20);
    
select w.name as warehouse_name, sum(p.width*p.length*p.height*w.units) as volume 
from warehouse w left join products p on w.product_id = p.product_id group by w.name order by w.name;    

