-- 1. Introduction
-- Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population 
FROM world



-- 2. Large Countries
-- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name 
FROM world
WHERE population >= 200000000



-- 3. Per capita GDP
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, gdp/population
FROM world 
where population > 200000000



-- 4. South America In millions
-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000
FROM world
where continent = 'South America'




-- 5. France, Germany, Italy
-- Show the name and population for France, Germany, Italy

SELECT name, population 
FROM world
WHERE name IN ('France', 'Germany', 'Italy')



-- 6. United
-- Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE 'United%'



-- 7. Two ways to be big
-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000




-- 8. One or the other (but not both)
-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population and big area, it should be excluded.
-- United Kingdom has a small population and a small area, it should be excluded.


SELECT name, population, area
FROM world
WHERE (area > 3000000 OR population > 250000000) 
AND NOT (area > 3000000 AND population > 250000000)



-- 9. rounding
-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the round function to show the values to two decimal places. For South America show population in millions and GDP in billions both to 2 decimal places.


SELECT name, ROUND(population/1000000,2) AS Population , ROUND(gdp/1000000000, 2) AS GDP
FROM world
WHERE continent = 'South America'



-- 10. Trillion dollar economies
-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). round this value to the nearest 1000. Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, round(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000



-- 11. Name and capital have the same length
-- Greece has capital Athens.
-- Each of the strings 'Greece', and 'Athens' has 6 characters.
-- Show the name and capital where the name and the capital have the same number of characters.
-- You can use the LENGTH function to find the number of characters in a string


SELECT name, capital
FROM world
WHERE length(name) = length(capital)



-- 12. Matching name and capital
-- The capital of Sweden is Stockholm. Both words start with the letter 'S'. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
    -- You can use the function LEFT to isolate the first character.
    -- You can use <> as the not EQUALS operator.


SELECT name, capital 
FROM world
WHERE left(name, 1) = left(capital, 1) xor name = capital



-- 13. All the vowels
-- Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name. Find the country that has all the vowels and no spaces in its name.
    -- You can use the phrase name not like '%a%' to exclude characters from your results.
    -- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'


SELECT name 
FROM world
WHERE name LIKE '%a%' AND 
name  LIKE '%e%' AND 
name  LIKE '%i%' AND 
name  LIKE '%o%' AND 
name  LIKE '%u%' AND 
name NOT LIKE '% %'
