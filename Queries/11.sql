SELECT TT.name, SUM(SET.assists) AS assists
FROM
player PL JOIN season_team SET ON PL.player_id = SET.player_id
JOIN team TT ON TT.team_id = SET.team_id
JOIN season SE ON SE.season_id = SET.season_id
WHERE SE.year = 2015
GROUP BY TT.name
HAVING SUM(SET.assists) = 
(SELECT MAX (t1.assists)
FROM
(SELECT T.name, SUM(ST.assists) AS assists
FROM
player P JOIN season_team ST ON P.player_id = ST.player_id
JOIN team T ON T.team_id = ST.team_id
JOIN season SEA ON SEA.season_id = ST.season_id
WHERE SEA.year = 2015
GROUP BY T.name) t1)
