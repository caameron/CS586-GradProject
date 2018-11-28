<html>
<head>
    <title>MyApp</title>
</head>
<body>

    <h1>CS586 Intro to Databases Grad Project</h1>
    Select the values from the drop down menus to specify which players stats you want to see for the 2017 season
    <!--Create a drop down for what position and team the user would like to know about -->
    <form method="post">
    <select name="positionSelect">
    <option selected = "selected">Choose one</option>
    <?php
    //Positions array for selection
    $positions = array("Guard", "Forward", "Center");
    //Create dropdown from the array
    foreach($positions as $position){
    ?>
        <option value="<?php echo strtolower($position); ?>"><?php echo $position;?></option>
    <?php
    }
    ?>
        
    </select>
    <select name="teamSelect">
    <option selected = "selected">Choose one</option>
    <?php
    //Team array for selection
    $teams = array("ATL", "BOS",  "CHI","CLE","DAL","DEN","DET","GSW","HOU","IND","LAC","LAL","MEM","MIA","MIL","MIN","NJN","NOP","NYK","ORL","PHI","PHO","POR","SAS","SAC","OKC","TOR","UTA","WAS",);
    //Create dropdown from the array
    foreach($teams as $team){
    ?>
        <option value="<?php echo strtolower($team); ?>"><?php echo $team;?></option>
    <?php
    }
    ?>
    </select>
    
    <input type="submit" name="submit">
    </form>
 
    <!-- Grab values from the drop down and place them into query to grab the amount of players with those values-->
    <?php
    if(isset($_POST['submit'])){
        $selectedPosition = $_POST['positionSelect'];
        $selectedTeam = $_POST['teamSelect'];
        $queryPosition = ucfirst($selectedPosition);
        $queryTeam = strtoupper($selectedTeam);
        echo "POSITION SELECTED: $selectedPosition<br/>\n";
        echo "TEAM SELECTED: $selectedTeam<br/n>\n";
        $query = "SELECT * 
FROM \"Grad_Project\".player P JOIN \"Grad_Project\".season_team ST ON P.player_id = ST.player_id
              JOIN \"Grad_Project\".team T ON T.team_id = ST.team_id 
              JOIN \"Grad_Project\".season S ON S.season_id = ST.season_id 
              JOIN \"Grad_Project\".positionplayed PP ON PP.player_id = P.player_id 
              JOIN \"Grad_Project\".position PO ON PO.position_id = PP.position_id 
WHERE S.year = 2017 AND T.abbreviation = '$queryTeam' AND PO.position = '$queryPosition'";
    ?>

    <div> 
    <?php
    $username = "f18wdb31";
    $password = "bauJu99c+b";
    $databasename = "f18wdb31";
    $hostname = "dbclass.cs.pdx.edu";
   
    $connection =
    pg_connect("host=$hostname dbname=$databasename user=$username password=$password")
    or die ("Could not connect");
        
    //$query = "SELECT * FROM \"Grad_Project\".player;";
    $result = pg_query($connection, $query)
        or die("QUERY ERROR: " . pg_last_error()); 
    $row = 0;
    echo "<strong>" . pg_num_rows($result) . "rows returned </strong>\n";
    echo "<br> \r\n";
    echo "<table border=1 cellspacing=0 cellpading=0>
    <tr> <td>ID</td> <td>NAME</td> <td>REBOUNDS</td> <td>ASSISTS</td> <td>STEALS</td> <td>BLOCKS</td> <td>POINTS</td></tr>";
    while($row = pg_fetch_row($result)) {
    echo "<tr><td>$row[0]</td><td>$row[1]</td><td>$row[18]</td><td>$row[19]</td><td>$row[20]</td><td>$row[21]</td><td>$row[22]</td></tr>";
    }
    echo "</table>";
    pg_close($connection);?>
    </div>
    <?php
     }
    ?>

</body>
</html>