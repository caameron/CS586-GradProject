SELECT position, CAST(AVG(P.points) AS DECIMAL(10,2)) AS Average_Points_Total
FROM played_in P JOIN positionplayed PP ON P.player_id = PP.player_id
                 JOIN position PO ON PO.position_id = PP.position_id
GROUP BY position
