SELECT *
FROM 
(SELECT TT.name, COUNT(DISTINCT SET.player_id) AS Centers
FROM
season_team SET JOIN team TT ON TT.team_id = SET.team_id
JOIN season SE ON SE.season_id = SET.season_id
JOIN positionplayed PP ON PP.player_id = SET.player_id
JOIN position P ON P.position_id = PP.position_id
WHERE SE.year = 2017 AND P.position = 'Center'
GROUP BY TT.name) T1
WHERE T1.centers > 4
