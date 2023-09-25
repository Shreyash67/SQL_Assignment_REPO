/* Q20. Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a
tie. */

use q1;

CREATE TABLE Ads (
    ad_id int,
    user_id int,
    action enum("Clicked","Viewed","Ignored")
);

INSERT INTO Ads (ad_id, user_id, action) VALUES
(1, 1, 'Clicked'),
(2, 2, 'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Ignored'),
(2, 7, 'Viewed'),
(3, 5, 'Clicked'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Clicked');

select ad_id ,case when sum(action="Clicked") = 0 then 0
else round((sum(action="Clicked")/(sum(action="Clicked") + sum(action="Viewed")))*100,2) end as ctr from ads
group by ad_id
order by ad_id asc,ctr desc;