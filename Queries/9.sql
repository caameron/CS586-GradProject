SELECT DISTINCT PL.name, T1.season, T1.points FROM
player PL JOIN played_IN PIN ON PL.player_id = PIN.player_id
JOIN season SE ON SE.season_id = PIN.season_id
JOIN 
(SELECT S.year AS season, MAX(PI.points) AS points
FROM player P JOIN played_in PI ON P.player_id = PI.player_id
              JOIN season S ON S.season_id = PI.season_id
GROUP BY S.year) T1 ON T1.season = SE.year AND T1.points = PIN.points
ORDER BY T1.season DESC
