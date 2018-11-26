SELECT *
FROM
(SELECT P.name, COUNT(DISTINCT SET.season_id) AS Seasons_Played_for
FROM
season_team SET JOIN player P ON P.player_id = SET.player_id
GROUP BY P.name) T1
WHERE T1.Seasons_Played_for = 
(SELECT MAX(T2.Seasons_Played_for)
FROM
(SELECT PL.name, COUNT(DISTINCT SETS.Season_id) AS Seasons_Played_for
FROM
season_team SETS JOIN player PL ON PL.player_id = SETS.player_id
GROUP BY PL.name) T2)
