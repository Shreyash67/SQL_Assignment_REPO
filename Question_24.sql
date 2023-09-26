-- Q24. Write an SQL query to report the first login date for each player.
-- Return the result table in any order.

use q1;
create table Activity(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id , event_date));
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

select t.player_id, event_date as first_login 
from (select player_id, event_date, row_number() over(partition by player_id 
order by event_date) as num 
from activity)t where t.num = 1;    
    
