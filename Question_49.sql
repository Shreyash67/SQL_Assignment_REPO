/*Q49.Write a SQL query to find the highest grade with its corresponding course for each student. In case of
a tie, you should find the course with the smallest course_id*/
CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    grade INT,
    PRIMARY KEY (student_id, course_id)
);
INSERT INTO Enrollments (student_id, course_id, grade)
VALUES
    (2, 2, 95),
    (2, 3, 95),
    (1, 1, 90),
    (1, 2, 99),
    (3, 1, 80),
    (3, 2, 75),
    (3, 3, 82);
WITH RankedEnrollments AS (
    SELECT
        student_id,
        course_id,
        grade,
        ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS rn
    FROM
        Enrollments
)

SELECT
    student_id,
    course_id,
    grade
FROM
    RankedEnrollments
WHERE
    rn = 1;
