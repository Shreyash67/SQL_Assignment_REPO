-- Q. 48 : Write an SQL query that reports the books that have sold less than 10 copies in the last year, excluding books 
-- that have been available for less than one month from today. Assume today is 2019-06-23.

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    Name VARCHAR(255),
    available_from DATE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    dispatch_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Books 
VALUES
    (1, 'Kalila And Demna', '2010-01-01'),
    (2, '28 Letters', '2012-05-12'),
    (3, 'The Hobbit', '2019-06-10'),
    (4, '13 Reasons Why', '2019-06-01'),
    (5, 'The Hunger Games', '2008-09-21');
    
INSERT INTO Orders (order_id, book_id, quantity, dispatch_date)
VALUES
    (1, 1, 2, '2018-07-26'),
    (2, 1, 1, '2018-11-05'),
    (3, 3, 8, '2019-06-11'),
    (4, 4, 6, '2019-06-05'),
    (5, 4, 5, '2019-06-20'),
    (6, 5, 9, '2009-02-02'),
    (7, 5, 8, '2010-04-13');
    
select t1.book_id, t1.name 
from ( (select book_id, name from Books where available_from < '2019-05-23') t1 
left join (select book_id, sum(quantity) as quantity from Orders 
where dispatch_date > '2018-06-23' and dispatch_date<= '2019-06-23' group by book_id having quantity < 10) t2 
on t1.book_id = t2.book_id );    
    


