SELECT population FROM world WHERE name = 'Germany';

SELECT name, population FROM world WHERE name IN ('Denmark', 'Norway', 'Sweden');

SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;

/* Find the country that start with Y */
SELECT name FROM world WHERE name LIKE 'Y%';

/* Find the countries that end with y */
SELECT name FROM world WHERE name LIKE '%y';

/* Find the countries that contain the letter x */
SELECT name FROM world WHERE name LIKE '%x%'

/* Find the countries that end with land */
SELECT name FROM world WHERE name LIKE '%land'

/* Find the countries that start with C and end with ia */
SELECT name FROM world WHERE name LIKE 'c%ia'

/* Find the country that has oo in the name */
SELECT name FROM world WHERE name LIKE '%oo%'

/* Find the countries that have three or more a in the name */
SELECT name FROM world WHERE name LIKE '%a%a%a%'

/* Find the countries that have "t" as the second character. */
SELECT name FROM world WHERE name LIKE '_t%' ORDER BY name

/* Find the countries that have two "o" characters separated by two others. */
SELECT name FROM world WHERE name LIKE '%_o__o%'

/* Find the countries that have exactly four characters. */
SELECT name FROM world WHERE name LIKE '____'

/* Find the country where the name is the capital city.* */
SELECT name FROM world WHERE name = capital

/* Find the country where the capital is the country plus "City". */
SELECT name FROM world WHERE capital LIKE concat(name, ' City');

/* Find the capital and the name where the capital includes the name of the country. */

/* Find the capital and the name where the capital is an extension of name of the country. */

/* Show the name and the extension where the capital is an extension of name of the country. */

/* Show the countries that are big by area or big by population. Show name, population and area. */
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000

/* Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area. */
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000

/* For South America show population in millions and GDP in billions both to 2 decimal places. */
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world WHERE continent = 'South America'

/* Show per-capita GDP for the trillion dollar countries to the nearest $1000. */
SELECT name, ROUND(gdp/population, -3) FROM world WHERE gdp > 1000000000000

/* Show the name and capital where the name and the capital have the same number of characters. */
SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital)

/* Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word. */
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;

/* Find the country that has all the vowels and no spaces in its name. */
SELECT name FROM world WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';

/* Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984. */
SELECT * FROM nobel WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984

/* Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine */
SELECT * FROM nobel WHERE yr = 1980 AND NOT subject IN ('Chemistry', 'Medicine')

/* List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order. */
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC

/* Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last. */
SELECT winner, subject FROM nobel WHERE yr = 1984 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner

/* List each country name where the population is larger than that of 'Russia'. */
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')

/* Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. */
SELECT name FROM world WHERE gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom') AND continent = 'Europe'

/* List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. */
SELECT name, continent FROM world WHERE continent = 'Oceania' OR continent = 'South America' ORDER BY name

/* Which country has a population that is more than Canada but less than Poland? Show the name and the population. */
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')

