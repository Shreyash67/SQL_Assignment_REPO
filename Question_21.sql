/* Q21. Write an SQL query to find the team size of each of the employees.
Return result table in any order. */

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    team_id INT
);

INSERT INTO Employee (employee_id, team_id) VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

select employee_id,(select count(*) from employee where team_id=e.team_id) as team_size from employee e;