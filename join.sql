SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'


SELECT id,stadium,team1,team2
  FROM game
where id = 1012



SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
where teamid = 'GER'


SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
where player like 'Mario%'



SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10


select mdate, teamname
from game JOIN eteam ON (team1=eteam.id)
where coach = 'Fernando Santos'


select player
from goal JOIN game on (matchid = id)
where stadium = 'National Stadium, Warsaw'



SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1 = 'GER' or team2 = 'GER')
    AND teamid != 'GER'


SELECT teamname, COUNT(*) as goals_scored
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname



SELECT stadium, COUNT(*)as goals FROM goal
  JOIN game ON (matchid = id)
  GROUP BY stadium


SELECT matchid, mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY mdate,matchid
order by matchid asc -- PR



SELECT matchid, mdate, COUNT(*) FROM goal
  JOIN game ON (matchid=id)
  WHERE teamid = 'GER'
  GROUP BY matchid, mdate



SELECT DISTINCT mdate, team1,
	SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
    team2,
    SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY id, mdate, team1, team2
ORDER BY mdate, matchid, team1, team2
