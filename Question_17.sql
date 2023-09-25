-- Q.17 Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
-- between 2019-01-01 and 2019-03-31 inclusive.
-- Return the result table in any order.

use q1;

(select p.product_id, p.product_name FROM
Product p INNER JOIN Sales s 
on p.product_id = s.product_id 
where s.sale_date >= '2019-01-01' and s.sale_date <= '2019-03-31')
EXCEPT
(select p.product_id, p.product_name 
FROM Product p INNER JOIN Sales s 
on p.product_id = s.product_id 
where s.sale_date < '2019-01-01' OR s.sale_date > '2019-03-31')