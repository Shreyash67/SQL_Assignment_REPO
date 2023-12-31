-- Q.30 Write an SQL query to find the npv of each query of the Queries table.
-- Return the result table in any order.

CREATE TABLE NPV (
    Id INT,
    Year INT,
    Npv INT,
    PRIMARY KEY (Id, Year)
);

CREATE TABLE Queries (
    Id INT,
    Year INT,
    PRIMARY KEY (Id, Year)
);

INSERT INTO NPV (Id, Year, Npv)
VALUES
    (1, 2018, 100),
    (7, 2020, 30),
    (13, 2019, 40),
    (1, 2019, 113),
    (2, 2008, 121),
    (3, 2009, 12),
    (11, 2020, 99),
    (7, 2019, 0);
    
INSERT INTO Queries (Id, Year)
VALUES
    (1, 2019),
    (2, 2008),
    (3, 2009),
    (7, 2018),
    (7, 2019),
    (7, 2020),
    (13, 2019);
    
select q.*, coalesce(n.Npv,0) as Npv 
from Queries q left join NPV n 
on q.Id = n.Id and q.Year = n.Year;