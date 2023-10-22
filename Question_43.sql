/*Q43.Write an SQL query to report the fraction of players that logged in again on the day after the day they
first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
that logged in for at least two consecutive days starting from their first login date, then divide that
number by the total number of players.
The query result format is in the following example.
*/
use q1;
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-03-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);
WITH FirstLogin AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM
        Activity
    GROUP BY
        player_id
),
SubsequentLogins AS (
    SELECT
        a.player_id,
        a.event_date AS login_date,
        DATE_ADD(fl.first_login_date, INTERVAL 1 DAY) AS next_day
    FROM
        Activity a
    JOIN
        FirstLogin fl ON a.player_id = fl.player_id
    WHERE
        a.event_date = DATE_ADD(fl.first_login_date, INTERVAL 1 DAY)
)
SELECT
    ROUND(COUNT(DISTINCT sl.player_id) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM
    Activity a
LEFT JOIN
    SubsequentLogins sl ON a.player_id = sl.player_id;
