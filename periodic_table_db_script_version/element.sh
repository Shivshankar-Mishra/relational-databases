#!/bin/bash

# PSQL variable
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if argument is provided
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Determine if input is a number or string
if [[ $1 =~ ^[0-9]+$ ]]; then
  QUERY_CONDITION="atomic_number = $1"
else
  QUERY_CONDITION="symbol = '$1' OR name = '$1'"
fi

# Fetch element details
ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
                      FROM elements 
                      JOIN properties USING(atomic_number) 
                      JOIN types USING(type_id) 
                      WHERE $QUERY_CONDITION")

# Handle missing elements
if [[ -z $ELEMENT_INFO ]]; then
  echo "I could not find that element in the database."
else
  IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING <<< "$ELEMENT_INFO"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
fi
