-- Q 25. Write an SQL query to report the device that is first logged in for each player. Return the result table
--  in any order.

select t.player_id, t.device_id 
from (select player_id, device_id, row_number() over(partition by player_id order by event_date) as num 
from activity)t where t.num = 1;