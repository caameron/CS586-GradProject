SELECT *
FROM
(SELECT T.name, COUNT(DISTINCT SET.player_id) AS different_players
FROM season_team SET JOIN team T ON T.team_id = SET.team_id
GROUP BY T.name) T1
WHERE T1.different_players= 
(SELECT MAX(T2.different_players)
FROM 
(SELECT TT.name, COUNT(DISTINCT SETS.player_id) AS different_players
FROM season_team SETS JOIN team TT ON TT.team_id = SETS.team_id
GROUP BY TT.name) T2)
