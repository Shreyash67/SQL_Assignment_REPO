/*Q47.Write an SQL query that reports the most experienced employees in each project. In case of a tie,
report all employees with the maximum number of experience years.
Return the result table in any order.
*/

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    experience_years INT
);
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO Employee (employee_id, name, experience_years)
VALUES
    (1, 'Khaled', 3),
    (2, 'Ali', 2),
    (3, 'John', 3),
    (4, 'Doe', 2);
INSERT INTO Project (project_id, employee_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4);
WITH MaxExperience AS (
    SELECT
        p.project_id,
        MAX(e.experience_years) AS max_experience
    FROM
        Project p
    JOIN
        Employee e ON p.employee_id = e.employee_id
    GROUP BY
        p.project_id
)

SELECT
    p.project_id,
    e.employee_id
FROM
    Project p
JOIN
    Employee e ON p.employee_id = e.employee_id
JOIN
    MaxExperience me ON p.project_id = me.project_id
WHERE
    e.experience_years = me.max_experience;
