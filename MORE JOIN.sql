--Question 1
SELECT id, title
 FROM movie
 WHERE yr=1962;
 
--Question 2
SELECT yr FROM movie
  WHERE title = 'Citizen Kane';
  
--Question 3
SELECT id, title, yr FROM movie
  WHERE title LIKE '%Star Trek%'
  ORDER BY yr;
  
--Question 4
SELECT id FROM actor
  WHERE name = 'Glenn Close';
  
--Question 5
SELECT id FROM movie
  WHERE title = 'Casablanca';
  
--Question 6
SELECT name FROM actor
  JOIN casting ON actor.id = casting.actorid
  WHERE casting.movieid = 11768;

--Question 7
SELECT name FROM actor
  JOIN casting ON actor.id = casting.actorid
  WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Alien');
  
--Question 8
SELECT title FROM movie
  JOIN casting ON casting.movieid = movie.id
  WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford');
  
--Question 9
SELECT title FROM movie
  JOIN casting ON movie.id = casting.movieid
  WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')
    AND
      casting.ord != 1;
      
--Question 10
SELECT title, name FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actor.id = casting.actorid
  WHERE yr = 1962 AND casting.ord = 1;
  
--Question 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

--Question 12
SELECT DISTINCT title, name FROM casting x
  JOIN movie ON movie.id = x.movieid
  JOIN actor ON actor.id = x.actorid
WHERE 'Julie Andrews' IN (SELECT name FROM actor JOIN casting y ON y.actorid = actor.id WHERE x.movieid = y.movieid) AND x.ord = 1;

--Question 13
SELECT name FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY casting.actorid
HAVING COUNT(casting.actorid) >=15
ORDER BY name;

--Question 14
SELECT title, COUNT(DISTINCT casting.actorid) FROM movie
JOIN casting ON casting.movieid = movie.id
WHERE yr = 1978
GROUP BY casting.movieid
ORDER BY COUNT(DISTINCT casting.actorid) DESC, title;

--Question 15
SELECT name
FROM actor
JOIN casting ON id = casting.actorid
WHERE movieid IN (SELECT movieid FROM casting
WHERE actorid = (SELECT id FROM actor
WHERE name = 'Art Garfunkel'))
AND name <> 'Art Garfunkel'
ORDER BY name