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

## 20 Questions

1. What is the average amount of points scored for each position?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/1.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result1.csv)
2. What is the average height and weight of all players in 2017-18?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/2.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result2.csv)
3. What is the average height and weight of all players across all seasons?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/3.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result3.csv)
4. How many players played each season?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/4.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result4.csv)
5. Who is the tallest player/players on each team currently?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/5.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result5.csv) <br />
   (Note: Many teams have multiple people with the tallest height so there will be multiple entries per team.
   In addition players switch between teams during the season and will show up for multiple teams.) <br />
   *Original Question: Who is the tallest player on each team?*
   *I changed the wording of the question to be more specific too give a better query result.* <br />
   *The original result contained many the same results for each team*
6. What is the most common position between all players?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/6.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result6.csv)
7. What college has the most guards come from?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/7.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result7.csv) <br />
   *Original Question: What state has the most point guards come from?* <br />
   *Question was changed to college because the state data for each player was not obtained*
8. What is the name of the player who plays the most minutes on each team?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/8.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result8.csv)
9. Who is the player with the most points for each season?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/9.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result9.csv) <br />
   (Note: this is total points scored, not points per game)
10. What is the number of players from each college
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/10.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result10.csv) <br />
   *Original Question: What is the number of players from each state?* <br />
   *Question was changed to college because the state data for each player was not obtained*
11. What team has the most amount of assists?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/11.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result11.csv)
12. How many players were born after 1990?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/12.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result12.csv)
13. How many players went to college?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/13.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result13.csv)
14. What team has made the most field goals in one season?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/14.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result14.csv) <br />
   *Original Question: What team has made the most fouls in one season?* <br />
   *Question was changed to field goals because the data for the amount of fouls for each player was not obtained*
15. What player started the most games for each position?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/15.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result15.csv) <br />
   (Note: There are multiple players that started each game of the season so there are many rows returned for this query)
16. In what season did players shoot the most three pointers?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/16.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result16.csv)
17. What are the name of the teams that have more than 2 centers?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/17.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result17.csv)
18. What player has played for the most teams?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/18.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result18.csv)
19. What team has had the most amount of different players?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/19.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result19.csv)
20. What player has played the most amount of seasons?
   [Query](https://github.com/caameron/CS586-GradProject/blob/master/Queries/20.sql)
   [Result](https://github.com/caameron/CS586-GradProject/blob/master/Query_Results/Result20.csv) <br />
   (Note: Due to my data not containing many seasons many players are returned because they have all played the past 7 seasons)
   
   
