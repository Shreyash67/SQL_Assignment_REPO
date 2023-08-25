# Q7. Query a list of CITY and STATE from the STATION table.

CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(255),
    STATE VARCHAR(255),
    LAT_N INT,
    LONG_W INT
);

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W)
VALUES
    (1, 'New York City', 'New York', 40, -74),
    (2, 'Los Angeles', 'California', 34, -118),
    (3, 'Chicago', 'Illinois', 41, -87),
    (4, 'Houston', 'Texas', 29, -95),
    (5, 'Miami', 'Florida', 25, -80);

select city,state from station;
