SELECT S.year AS Season, SUM(PI.three_point_attempts) AS Three_Pointers_Shot
FROM player P JOIN played_in PI ON P.player_id = PI.player_id
              JOIN season S ON PI.season_id = S.season_id
GROUP BY S.year
HAVING SUM(PI.three_point_attempts) = 
(SELECT MAX(T1.three_point_attempts)
FROM
(SELECT SUM(PIN.three_point_attempts) AS Three_point_attempts
FROM player PL JOIN played_in PIN ON PL.player_id = PIN.player_id
              JOIN season SE ON PIN.season_id = SE.season_id
GROUP BY SE.year) T1)
