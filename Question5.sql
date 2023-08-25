#Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION)
VALUES (1661, 'Tokyo', 'JPN', 'Kanto', 13929286);

select * from city where countrycode="JPN";