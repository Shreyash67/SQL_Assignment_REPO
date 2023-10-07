-- Q. 29 Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020. 
-- Return the result table in any order.

CREATE TABLE Content (
    content_id VARCHAR(255) PRIMARY KEY,
    Title VARCHAR(255),
    Kids_content ENUM('Yes', 'No'),
    content_type VARCHAR(255)
);
CREATE TABLE TVProgram (
    program_date DATE,
    content_id INT,
    channel VARCHAR(255),
    PRIMARY KEY (program_date, content_id)
);
INSERT INTO Content (content_id, Title, Kids_content, content_type)
VALUES
    ('1', 'Leetcode Movie', 'No', 'Movies'),
    ('2', 'Alg. for Kids', 'Yes', 'Series'),
    ('3', 'Database Sols', 'No', 'Series'),
    ('4', 'Aladdin', 'Yes', 'Movies'),
    ('5', 'Cinderella', 'Yes', 'Movies');
INSERT INTO TVProgram (program_date, content_id, channel)
VALUES
    ('2020-06-10 08:00', 1, 'LC-Channel'),
    ('2020-05-11 12:00', 2, 'LC-Channel'),
    ('2020-05-12 12:00', 3, 'LC-Channel'),
    ('2020-05-3 14:00', 4, 'Disney Ch'),
    ('2020-06-8 14:00', 4, 'Disney Ch'),
    ('2020-07-5 16:00', 5, 'Disney Ch');
    
select c.Title from 
Content c left join TVProgram t 
on c.content_id = t.content_id 
where c.Kids_content = 'Yes' and c.content_type = 'Movies' and 
month(t.program_date) = 6 and year(t.program_date) = 2020;
