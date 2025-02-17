#!/bin/bash

# Connect to PostgreSQL
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

# Check if user exists
USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  
  # Insert new user and get their user_id
  INSERTED_DATA=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$USERNAME', 0, NULL)")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  
  GAMES_PLAYED=0
  BEST_GAME="N/A"
else
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_INFO"

  # Ensure BEST_GAME is set properly
  if [[ -z $BEST_GAME || $BEST_GAME == "NULL" ]]; then
    BEST_GAME="N/A"
  fi

  echo Welcome back, $USERNAME\! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

# Start guessing game
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

while true; do
  read GUESS

  # Check if input is a valid integer
  if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job\!
    break
  fi
done

# Update user stats
((GAMES_PLAYED++))
$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE user_id = $USER_ID")

# Update best_game only if it's NULL or greater than the current game's guess count
if [[ $BEST_GAME == "N/A" || $GUESS_COUNT -lt $BEST_GAME ]]; then
  UPDATE_USER_BEST=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE user_id = $USER_ID")
fi
