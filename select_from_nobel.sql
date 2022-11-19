-- 1. nobel Nobel Laureates
-- We continue practicing simple SQL queries on a single table. This tutorial is concerned with a table of Nobel prize winners:

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950



-- 2. 1962 Literature
-- Show who won the 1962 prize for literature.

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature'



-- 3. Albert Einstein

select yr, subject 
from nobel
where winner = 'Albert Einstein'



-- 4. Recent Peace Prizes
-- Give the name of the 'peace' winners since the year 2000, including 2000.

select winner
from nobel
where yr >= 2000 and subject = 'peace'



-- 5. Literature in the 1980's
-- Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

select yr, subject, winner
from nobel
where (yr between 1980 and 1989) and (subject = 'literature')




-- 6. Only Presidents
-- Show all details of the presidential winners:
    -- Theodore Roosevelt
    -- Thomas Woodrow Wilson
    -- Jimmy Carter
    -- Barack Obama

SELECT *
FROM nobel
WHERE winner IN (
        'Theodore Roosevelt',
        'Woodrow Wilson',
        'Jimmy Carter',
        'Barack Obama'
    )



-- 7. John
-- Show the winners with first name John

select winner
from nobel
where winner like 'John%'




-- 8. Chemistry and Physics from different years
-- Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.


select *
from nobel
where (yr = 1980 and subject = 'physics') or (yr = 1984 and subject = 'chemistry')



-- 9. Exclude Chemists and Medics 
-- Show the year, subject, and name of winners for 1980 excluding chemistry and medicine

select *
from nobel
where yr = 1980 and not subject in ('chemistry', 'medicine')



-- 10. Early Medicine, Late Literature
-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)


select yr, subject, winner
from nobel
where (yr < 1910 and subject = 'Medicine') or (yr >= 2004 and subject = 'Literature')




-- 11. Umlaut
-- Find all details of the prize won by PETER GRÜNBERG

SELECT *
FROM nobel
WHERE winner LIKE 'peter gr%nberg'




-- 12. Apostrophe
-- Find all details of the prize won by EUGENE O'NEILL

select * 
from nobel
where winner = 'Eugene O''neill'



-- 13. Knights of the realm
-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.


select winner, yr, subject
from nobel
where winner like 'Sir%'
order by yr DESC, winner



-- 14. Chemistry and Physics last
-- The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1. Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.

SELECT winner, subject
FROM nobel
WHERE yr=1984
order by
case when subject IN ('physics', 'chemistry') then 1 else 0 END,
subject, winner