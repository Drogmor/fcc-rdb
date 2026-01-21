#! /bin/bash
set -e

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TEAMS=()
while IFS=, read -r year round winner opponent w_goals o_goals
do
  # check for winner entry
  echo "Checking if the winner exists ($winner)"
  if [[ $($PSQL "SELECT COUNT(*) FROM teams WHERE name='$winner'") -eq 1 ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    echo "$winner was already in the worldcup db. Retrieving with team_id $WINNER_ID"
  elif [[ $($PSQL "SELECT COUNT(*) FROM teams WHERE name='$winner'") -eq 0 ]]
  then
    INSERT_WINNER=$($PSQL "INSERT INTO teams (name) VALUES ('$winner')")    
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    echo "Added $winner to the database with team_id=$WINNER_ID"
  fi
  # check for opponent entry
  echo "Checking if the oppenent exists ($opponent)"
  if [[ $($PSQL "SELECT COUNT(*) FROM teams WHERE name='$opponent'") -eq 1 ]]
  then
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    echo "$opponent was already in the worldcup db. Retrieving with team_id $OPPONENT_ID"
  elif [[ $($PSQL "SELECT COUNT(*) FROM teams WHERE name='$opponent'") -eq 0 ]]
  then
    INSERT_OPPONENT=$($PSQL "INSERT INTO teams (name) VALUES ('$opponent')")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    echo "Added $opponent to the database with team_id=$OPPONENT_ID"
  fi
  echo "Adding game result with values $year,$round,$WINNER_ID,$OPPONENT_ID,$w_goals,$o_goals"
  INSERT_GAME=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($year, '$round', $WINNER_ID, $OPPONENT_ID, $w_goals, $o_goals)")  
done < <(tail -n +2 ./games.csv)
