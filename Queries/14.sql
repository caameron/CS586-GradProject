SELECT TT.name, SE.year, SUM(SET.field_goals) AS Field_Goals
FROM
player PL JOIN season_team SET ON PL.player_id = SET.player_id
JOIN team TT ON TT.team_id = SET.team_id
JOIN season SE ON SE.season_id = SET.season_id
GROUP BY TT.name, SE.year
HAVING SUM(SET.field_goals) = 
(SELECT MAX (t1.field_goals)
FROM
(SELECT T.name, SUM(ST.field_goals) AS field_goals
FROM
player P JOIN season_team ST ON P.player_id = ST.player_id
JOIN team T ON T.team_id = ST.team_id
JOIN season SEA ON SEA.season_id = ST.season_id
GROUP BY T.name, SEA.year) t1)
