/*Q36.Write an SQL query to report the distance travelled by each user.
Return the result table ordered by travelled_distance in descending order, if two or more users
travelled the same distance, order them by their name in ascending order.*/
CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO Users (id, name)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Alex'),
    (4, 'Donald'),
    (7, 'Lee'),
    (13, 'Jonathan'),
    (19, 'Elvis');
CREATE TABLE Rides (
    id INT PRIMARY KEY,
    user_id INT,
    distance INT
);
INSERT INTO Rides (id, user_id, distance)
VALUES
    (1, 1, 120),
    (2, 2, 317),
    (3, 3, 222),
    (4, 7, 100),
    (5, 13, 312),
    (6, 19, 50),
    (7, 7, 120),
    (8, 19, 400),
    (9, 7, 230);
SELECT 
    U.name,
    COALESCE(SUM(R.distance), 0) AS travelled_distance
FROM 
    Users U
LEFT JOIN 
    Rides R ON U.id = R.user_id
GROUP BY 
    U.id, U.name
ORDER BY 
    travelled_distance DESC, 
    U.name ASC;
