SELECT DISTINCT PL.name, T1.position, T1.games_started
FROM played_in P JOIN positionplayed PP ON P.player_id = PP.player_id
                 JOIN position PO ON PO.position_id = PP.position_id
                 JOIN player PL ON PL.player_id = P.player_id
JOIN
(SELECT POS.position, MAX(PI.games_started) AS Games_Started
FROM played_in PI JOIN positionplayed PPP ON PI.player_id = PPP.player_id
                 JOIN position POS ON POS.position_id = PPP.position_id
                 JOIN player PLA ON PLA.player_id = PI.player_id
GROUP BY POS.position) T1 ON T1.games_started = P.games_started
ORDER BY Position
