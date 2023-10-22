/*Q35.Write an SQL query to:
● Find the name of the user who has rated the greatest number of movies. In case of a tie,
return the lexicographically smaller user name.
● Find the movie name with the highest average rating in February 2020. In case of a tie, return
the lexicographically smaller movie name.
The query result format is in the following example.*/
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255)
);
 INSERT INTO Movies (movie_id, title)
VALUES
    (1, 'Avengers'),
    (2, 'Frozen 2'),
    (3, 'Joker');
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO Users (user_id, name)
VALUES
    (1, 'Daniel'),
    (2, 'Monica'),
    (3, 'Maria'),
    (4, 'James');
CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,
    PRIMARY KEY (movie_id, user_id)
);
INSERT INTO MovieRating (movie_id, user_id, rating, created_at)
VALUES
    (1, 1, 3, '2020-01-12'),
    (1, 2, 4, '2020-02-11'),
    (1, 3, 2, '2020-02-12'),
    (1, 4, 1, '2020-01-01'),
    (2, 1, 5, '2020-02-17'),
    (2, 2, 2, '2020-02-01'),
    (2, 3, 2, '2020-03-01'),
    (3, 1, 3, '2020-02-22'),
    (3, 2, 4, '2020-02-25');

SELECT Results
FROM (
    SELECT name AS Results, COUNT(movie_id) AS rating_count, name
    FROM (
        SELECT U.name, M.movie_id
        FROM Users U
        LEFT JOIN MovieRating M ON U.user_id = M.user_id
    ) subquery1
    GROUP BY name
    ORDER BY rating_count DESC, name
    LIMIT 1
) t1
UNION
SELECT Results
FROM (
    SELECT title AS Results, AVG(rating) AS avg_rating, title
    FROM (
        SELECT M.title, R.rating
        FROM Movies M
        LEFT JOIN MovieRating R ON M.movie_id = R.movie_id
        WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2
    ) subquery2
    GROUP BY title
    ORDER BY avg_rating DESC, title
    LIMIT 1
) t2;





