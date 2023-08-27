/* Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end
with vowels. Your result cannot contain duplicates.
Input Format */

use q1;

select distinct city from station
where not (city like "%a" or city like "%e" or city like "%i" or city like "%o" or city like "%u")
or not(city like "a%" or city like "e%" or city like "i%" or city like "o%" or city like "u%");
