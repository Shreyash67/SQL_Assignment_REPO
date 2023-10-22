-- Q 42 : Write an SQL query to report the difference between the number of apples and oranges sold each day. 
-- Return the result table ordered by sale_date.

CREATE TABLE Sales (
    sale_date DATE,
    Fruit varchar(10),
    sold_num INT,
    PRIMARY KEY (sale_date, Fruit)
);

INSERT INTO Sales 
VALUES
    ('2020-05-01', 'apples', 10),
    ('2020-05-01', 'oranges', 8),
    ('2020-05-02', 'apples', 15),
    ('2020-05-02', 'oranges', 15),
    ('2020-05-03', 'apples', 20),
    ('2020-05-03', 'oranges', 0),
    ('2020-05-04', 'apples', 15),
    ('2020-05-04', 'oranges', 16);
    
select t.sale_date, (t.apples_sold - t.oranges_sold) as diff 
from (select sale_date, max(CASE WHEN fruit = 'apples' 
THEN sold_num ELSE 0 END )as apples_sold, max(CASE WHEN fruit = 'oranges' 
THEN sold_num ELSE 0 END )as oranges_sold FROM sales group by sale_date) t ORDER BY t.sale_date;    

