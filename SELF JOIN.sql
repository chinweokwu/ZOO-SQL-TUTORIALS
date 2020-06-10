--Question 1
SELECT COUNT(*) FROM stops;

--Question 2
SELECT id FROM stops WHERE name = 'Craiglockhart'

--Question 3
SELECT id, name 
FROM stops 
JOIN route 
ON route.stop = stops.id
WHERE route.num = '4' 
AND route.company = 'LRT';

--Question 4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) >= 2;

--Question 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
AND b.stop = 149;

--Question 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' 
AND stopb.name = 'London Road';

--Question 7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON a.company=b.company AND a.num=b.num
WHERE a.stop=115 AND b.stop = 137 OR b.stop=115 AND b.stop = 137;

--Question 8
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops ax ON ax.id = a.stop
JOIN stops bs ON bs.id = b.stop
WHERE ax.name = 'Craiglockhart' AND bs.name = 'Tollcross' OR bs.name = 'Craiglockhart' AND ax.name = 'Tollcross';

--Question 9
SELECT sb.name, a.company, a.num FROM route a
  JOIN route b ON a.company = b.company AND a.num = b.num
  JOIN stops ON a.stop = stops.id
  JOIN stops sb ON b.stop = sb.id
  WHERE stops.name = 'Craiglockhart';

--Question 10

