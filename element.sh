#!/bin/bash
# A program that provides information about elements from a periodic table database

PSQL="psql -U freecodecamp periodic_table -t --no-align -c"

CHECK_DIGIT_PATTERN="^([[:digit:]])+$"
CHECK_TEXT_PATTERN="^[a-zA-Z]+$"
BASE_QUERY="SELECT e.atomic_number, e.name, e.symbol, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM properties p LEFT JOIN elements e ON p.atomic_number = e.atomic_number LEFT JOIN types t ON p.type_id = t.type_id"

if ! [[ -z $1 ]]; then
  SELECTED_ELEMENT=$1
else
  echo "Please provide an element as an argument."
  exit 0
fi

if [[ $SELECTED_ELEMENT =~ $CHECK_DIGIT_PATTERN ]]; then
    FOUND_ELEMENT=$($PSQL "$BASE_QUERY WHERE e.atomic_number =  $SELECTED_ELEMENT")
elif [[ $SELECTED_ELEMENT =~ $CHECK_TEXT_PATTERN ]]; then
  FOUND_ELEMENT=$($PSQL "$BASE_QUERY WHERE symbol = '$SELECTED_ELEMENT' OR name = '$SELECTED_ELEMENT'")
fi

if [[ -z $FOUND_ELEMENT ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

echo $FOUND_ELEMENT | while IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE;
do 
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius." ;
done