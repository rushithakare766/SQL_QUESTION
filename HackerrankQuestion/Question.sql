#Hackerrank SQL Solution 

Q.1 Revising the Select Query I
Query all columns for all American cities in the CITY table with populations larger than 100000.
The CountryCode for America is USA.
Answer->> 
select * from CITY where population>=100000 and COUNTRYCODE="USA";

Q.2 Revising the Select Query II
Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA.
Answer->> 
select name from city where population>=120000 and COUNTRYCODE='USA'; 

Q.3 Select All
Query all columns (attributes) for every row in the CITY table.
answer->>
select * from city; 

Q.4 Select By ID
Query all columns for a city in CITY with the ID 1661.
answer->>
select * from city where ID=1661; 

Q.5 Japanese Cities' Attributes '
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
answer->> 
select * from city where countrycode="JPN"; 

Q.6 Weather Observation Station 1 
Query a list of CITY and STATE from the STATION table. 
answer->>
select city,state from station;

Q.7 Weather Observation Station 3 
Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer.
answer->> 
select distinct city from station where MOD (ID,2)=0; 

Q.8 Weather Observation Station 4
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
The STATION table is described as follows:
answer->> 
select count(city)- count(distinct(city)) from station; 

Q.9 Weather Observation Station 6
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
 Your result cannot contain duplicates.
answer->>
select distinct(city) from station where city Like "a%" or city like "e%" or 
city like "i%" or city like "o%" or city like "u%";

Q.10 Weather Observation Station 7
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
Your result cannot contain duplicates.
answer->> 
select distinct(city) from station where city like "%a" or city like "%e" or city like "%i" 
or city like "%o"  or city like "%u" ; 

Q.11 Weather Observation Station 8
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as 
both their first and last characters. Your result cannot contain duplicates.
answer->> 
SELECT DISTINCT CITY FROM STATION WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 
'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') AND 
(CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');

Q.12 Weather Observation Station 9
Query the list of CITY names from STATION that do not start with vowels. 
Your result cannot contain duplicates
answer->>
select distinct(city) from station where 
not(city like "a%" or city like "e%" or city like "i%" or city like "o%" or city like "u%");

Q.13 Weather Observation Station 10 
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
answer->> 

select distinct(city) from station where 
not(city like "%a" or city like "%e" or city like "%i" or city like "%o" or city like "%u");

Q.14 Weather Observation Station 11
Query the list of CITY names from STATION that either do not start with vowels or 
do not end with vowels. Your result cannot contain duplicates.
answer->> 
select distinct(city) from station where 
not(city like "a%" or city like "e%" or city like "i%" or city like "o%" or city like "u%")
or not (city like "%a" or city like "%e" or city like "%i" or city like "%o" or city like "%u");

Q.15 Weather Observation Station 12
Query the list of CITY names from STATION that do not start with vowels 
and do not end with vowels. Your result cannot contain duplicates.

answer->>
select distinct(city) from station where 
not(city like "a%" or city like "e%" or city like "i%" or city like "o%" or city like "u%")
and not (city like "%a" or city like "%e" or city like "%i" or city like "%o" or city like "%u");

Q.16 Higher Than 75 Marks
Query the Name of any student in STUDENTS who scored higher than  Marks. 
Order your output by the last three characters of each name. If two or
 more students both have names ending in the same last three characters 
 (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

 answer->>
 select name from students where marks>75 order by right(name,3) , ID asc;

 Q.17 Employee Names 
 Write a query that prints a list of employee names (i.e.: the name attribute) 
 from the Employee table in alphabetical order.

 answer->> 
 select name from employee order by name;

 Q.18 Employee Salaries 
 Write a query that prints a list of employee names (i.e.: the name attribute) for 
 employees in Employee having a salary greater than  per month who have been 
 employees for less than  months. Sort your result by ascending employee_id.

 answer->>
 select name from employee where salary>2000 and months<10 order by employee_id ASC;

 Q.19 weather station 5
 Query the two cities in STATION with the shortest and longest CITY names, as well as 
 their respective lengths(i.e.: number of characters in the name). 
 If there is more than one smallest or largest city, choose the one that 
 comes first when ordered alphabetically.
answer->>

 SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY LIMIT 1;

SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1;

Q.20 















