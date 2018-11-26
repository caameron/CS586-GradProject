# CS586-GradProject
Grad Project for Intro to Databases

![alt text](https://github.com/caameron/CS586-GradProject/blob/master/ER-Diagram.PNG)

The final ER-Diagram for the project only had one change made during the implementation process. The change was made to the
relationship between the player and college table. Unfortunately I could not find data on how many years or what major each
player had when they attended to college. Therefore, the years attribute of the Attended relationship was removed.

## Create Table Statements
Create Table Statements for the data base can be found at: [CreateTables.sql](https://github.com/caameron/CS586-GradProject/blob/master/CreateTables/CreateTable.sql)

## Populating Database

Source of data can be found at https://www.kaggle.com/drgilermo/nba-players-stats#Seasons_Stats.csv
Or in the CSV files in the Data folder.

The original plan to populate the database was to use the copy command to load the data into a temporary staging table and from
there parse it into the relevant tables. However, during this process I had issues with the copy command which did not end up
getting resolved. I instead used Excel to parse the data in to SQL Insert commands which inserted the data in to staging tables
(the line of code used to parse each row of data can be found in the CreateTable file [CreateTables.sql](https://github.com/caameron/CS586-GradProject/blob/master/CreateTables/CreateTable.sql)). After which the loading process stayed
the same and the data was parsed in to its relevant tables. The specific steps have been outline below.

1. Obtain data from Kaggle in csv/excel format.
2. Create excel code to parse data in to insert statements which will be used to load the staging table.
3. The player, college, positionPlayed, played_for, season, played_in, and season_team tables are then populated using the staging
   tables by parsing the specific data needed using SQL statements. The specific statements used to parse the data can be found in
   the CreateTable file. [CreateTables.sql](https://github.com/caameron/CS586-GradProject/blob/master/CreateTables/CreateTable.sql)
4. The position table had its data loaded in manually by entering in Guard, Forward, and Center
5. The team table also had to be loaded in manually due to the data set only having the abbreviations of each team.
