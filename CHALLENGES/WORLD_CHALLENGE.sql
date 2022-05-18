USE world;

-- Question 1 - Using COUNT, get the number of cities in the USA.

SELECT count(name) FROM city WHERE countrycode = "usa";

-- Question 2 - Find out the population and life expectancy for people in Argentina.

SELECT population, lifeexpectancy FROM country WHERE code = "ARG";

-- Question 3 - Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

SELECT name, lifeexpectancy FROM country WHERE lifeexpectancy IS NOT NULL
 ORDER BY lifeexpectancy DESC 
 LIMIT 1;
 
 -- Question 4 - Using JOIN ... ON, find the capital city of Spain.
 
 SELECT co.name AS countryname, co.capital, ci.id AS cityid, ci.name AS cityname
 FROM country co 
 JOIN city ci ON co.capital=ci.id WHERE co.name = "Spain";
 
-- Question 5 - Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.

SELECT co.region, col.language
FROM country co 
JOIN countrylanguage col ON co.code=col.countrycode WHERE co.region = "Southeast Asia";

-- Question 6 - Using a single query, list 25 cities around the world that start with the letter F

SELECT * FROM city WHERE name LIKE "F%"
LIMIT 25;

-- Question 7 - Using COUNT and JOIN ... ON, get the number of cities in China.

SELECT COUNT(ci.`name`) AS city_count, co.name
FROM country co 
JOIN city ci ON co.code=ci.countrycode WHERE co.name = "China";

-- Question 8 - Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.

SELECT name, population FROM country WHERE population IS NOT NULL && population > 0 
 ORDER BY population ASC 
 LIMIT 1;
 
 -- Question 9 - Using aggregate functions, return the number of countries the database contains.
 
 SELECT COUNT(name) AS total_countries FROM country;
 
 -- Question 10 - What are the top ten largest countries by area?
 
 SELECT name, SurfaceArea FROM country 
 ORDER BY SurfaceArea DESC 
 LIMIT 10;
 
 -- Question 11 - List the five largest cities by population in Japan.
 
 SELECT name AS city_name, population, countrycode FROM city WHERE countrycode = "JPN"
 ORDER BY population DESC
 LIMIT 5;
 
 -- Question 12 - List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
 
 SELECT name, code, HeadOfState FROM country WHERE HeadOfState = "Elisabeth II";
 
 -- Question 13 - List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
 
 SELECT name, population/surfacearea FROM country WHERE population/surfacearea IS NOT NULL && population/surfacearea > 0 
 ORDER BY population/surfacearea ASC
 LIMIT 10;
 
 -- Question 14 - List every unique world language.
 
 SELECT DISTINCT language FROM countrylanguage;
 
 -- Question 15 - List the names and GNP of the world's top 10 richest countries.
 
 SELECT name, GNP FROM country
 ORDER BY GNP DESC
 LIMIT 10;
 
 -- Question 16 - List the names of, and number of languages spoken by, the top ten most multilingual countries.
 
 -- Question 17 - List every country where over 50% of its population can speak German.
 
SELECT co.name AS country_name, language, percentage 
FROM country co 
JOIN countrylanguage cl ON co.code=cl.countrycode
WHERE language = "german" && percentage > 50;

-- Question 18 - Which country has the worst life expectancy? Discard zero or null values.

SELECT name, lifeexpectancy FROM country WHERE lifeexpectancy IS NOT NULL && lifeexpectancy > 0 
ORDER BY lifeexpectancy ASC 
LIMIT 1;

-- Question 19 - List the top three most common government forms.

SELECT COUNT(`name`), governmentform FROM country 
GROUP BY governmentform
ORDER BY COUNT(`NAME`) DESC
LIMIT 3;

-- Question 20 - How many countries have gained independence since records began?

SELECT COUNT(`INDEPYEAR`) FROM country WHERE indepyear IS NOT NULL;


 
 
 
 









