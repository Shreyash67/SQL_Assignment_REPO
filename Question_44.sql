/*Q44.Write an SQL query to report the managers with at least five direct reports.
Return the result table in any order*/
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);

INSERT INTO Employee (id, name, department, managerId)
VALUES
    (101, 'John', 'A', NULL),
    (102, 'Dan', 'A', 101),
    (103, 'James', 'A', 101),
    (104, 'Amy', 'A', 101),
    (105, 'Anne', 'A', 101),
    (106, 'Ron', 'B', 101);
SELECT e1.name
FROM Employee e1
WHERE (
    SELECT COUNT(*)
    FROM Employee e2
    WHERE e2.managerId = e1.id
) >= 5;
