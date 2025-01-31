#!/bin/bash

# Variable to query the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt player for username
echo -e "\nEnter your username:"
read USERNAME

# Get user id
USER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")

# If player is not found
if [[ -z $USER_ID ]]; then
  # Greet player and add to database
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO players(username) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'") # Retrieve new user_id
else
  # Fetch game statistics
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")

  # Handle case where player has not played any games
  if [[ -z $BEST_GAME ]]; then
    BEST_GAME="N/A"
  fi

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Variable to store number of guesses
GUESS_COUNT=0

# Prompt first guess
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

# Loop until correct guess
until [[ $USER_GUESS -eq $SECRET_NUMBER ]]; do
  # Validate input
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]; then
    echo -e "\nThat is not an integer, guess again:"
  elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi

  # Read next guess and increment count
  read USER_GUESS
  ((GUESS_COUNT++))
done

# Increment one last time for the correct guess
((GUESS_COUNT++))

# Insert game record
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES ($USER_ID, $SECRET_NUMBER, $GUESS_COUNT)")

# Winning message
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"\
