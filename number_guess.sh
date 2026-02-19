#!/bin/bash
# A script that generates a random number between 1 and 1000 for users to guess

PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"
SECRET_NUMBER=$(( $RANDOM % 1000 + 1))

echo "Enter your username:"
read USERNAME

# check if username has played a game before
EXISTING_USER=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
# username exists
if [[ -z $EXISTING_USER ]]; then
  # add new user
  ADD_NEW_USER_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  # greet new user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN users USING (user_id) WHERE username = '$EXISTING_USER'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games INNER JOIN users USING (user_id) WHERE username = '$EXISTING_USER'")
  echo "Welcome back, $EXISTING_USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
NUMBER_OF_GUESSES=1

echo "Guess the secret number between 1 and 1000:"
read GUESS

# check if $GUESS is a number
while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS
done

while [[ $GUESS -ne $SECRET_NUMBER ]]
do
  let "NUMBER_OF_GUESSES++"
  if [[ $GUESS -gt $SECRET_NUMBER ]]; then
    # if guess is lower than secret
    echo "It's lower than that, guess again:"
    read GUESS
  elif [[ $GUESS -lt $SECRET_NUMBER ]]; then
    # if guess is higher than secret
    echo "It's higher than that, guess again:"
    read GUESS
  fi
done
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, guesses, secret_number) VALUES ($USER_ID, $NUMBER_OF_GUESSES, $SECRET_NUMBER)")
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"