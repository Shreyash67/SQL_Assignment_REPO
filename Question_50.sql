/*Q50.The winner in each group is the player who scored the maximum total points within the group. In the
case of a tie, the lowest player_id wins.
Write an SQL query to find the winner in each group.*/
-- drop table Matches;
use test;
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    first_player INT,
    second_player INT,
    first_score INT,
    second_score INT
);
-- drop table Matches;
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    group_id VARCHAR(255)
);

INSERT INTO Players (player_id,group_id )
VALUES
    (15, 1),
    (25, 1),
    (30, 1),
    (45, 1),
    (10, 2),
    (35, 2),
    (50, 2),
    (20, 3),
    (40, 3);

INSERT INTO Matches (match_id, first_player, second_player, first_score, second_score)
VALUES
    (1, 15, 45, 3, 0),
    (2, 30, 25, 1, 2),
    (3, 30, 15, 2, 0),
    (4, 40, 20, 5, 2),
    (5, 35, 50, 1, 1);
    
select t2.group_id, t2.player_id 
from ( select t1.group_id, t1.player_id, dense_rank() over(partition 
by group_id order by score desc, player_id) as r 
from ( select p.*, case when p.player_id = m.first_player 
then m.first_score when p.player_id = m.second_player 
then m.second_score end as score from Players p, Matches m 
where player_id in (first_player, second_player) ) t1 ) t2 where r = 1;    

