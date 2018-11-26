SELECT DISTINCT PL.name, T1.team_name, T1.tallest_height FROM
player PL JOIN season_team SET ON PL.player_id = SET.player_id
JOIN team TT ON TT.team_id = SET.team_id
JOIN 
(SELECT T.name AS team_name, MAX(P.height) AS tallest_height
FROM player P JOIN season_team ST ON P.player_id = ST.player_id
              JOIN team T ON T.team_id = ST.team_id
              JOIN season S ON S.season_id = ST.season_id
WHERE S.year = 2017
GROUP BY T.name) T1 ON T1.team_name = TT.name AND T1.tallest_height = PL.height
