/*Query all columns for all American cities in the CITY table with populations larger 
than 100000.The CountryCode for America is USA.*/
create database q1;
use q1;

create table city(
id int,
name varchar(17),
countrycode varchar(3),
district varchar(20),
population int
);

INSERT INTO city (id, name, countrycode, district, population)
VALUES
    (1, 'New York', 'USA', 'New York', 200000),
    (2, 'Los Angeles', 'USA', 'California', 90000),
    (3, 'Chicago', 'USA', 'Illinois', 300000),
    (4, 'Houston', 'USA', 'Texas', 98000),
    (5, 'Phoenix', 'USA', 'Arizona', 102550);
    
select * from city
where population>100000 and countrycode="USA";
