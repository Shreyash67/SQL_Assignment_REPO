/*Q38.Write an SQL query to find the id and the name of all students who are enrolled in departments that no
longer exist.
Return the result table in any order.
The query result format is in the following example.*/
CREATE TABLE Departments (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO Departments (id, name)
VALUES
    (1, 'Electrical Engineering'),
    (7, 'Computer Engineering'),
    (13, 'Business Administration');
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department_id INT
);

INSERT INTO Students (id, name, department_id)
VALUES
    (23, 'Alice', 1),
    (1, 'Bob', 7),
    (5, 'Jennifer', 13),
    (2, 'John', 14),
    (4, 'Jasmine', 77),
    (3, 'Steve', 74),
    (6, 'Luis', 1),
    (8, 'Jonathan', 7),
    (7, 'Daiana', 33),
    (11, 'Madelynn', 1);
SELECT S.id, S.name
FROM Students S
LEFT JOIN Departments D ON S.department_id = D.id
WHERE D.id IS NULL;
