#!/bin/bash
# A program to add customer appointment and contact data to a database

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=salontest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
fi
PHONE_VALIDATION_PATTERN="^(([[:digit:]]{3,4})(-?)){3}$"
SERVICE_IDS=($($PSQL "SELECT service_id FROM services ORDER BY service_id ASC")) # Select ids into array always wrap with ()

function CHECK_SELECTION() {
  local selection=$1

  [[ -z "$selection" ]] && return 1

  for i in "${SERVICE_IDS[@]}";
  do
    if [[ $i -eq $selection ]]; then
      return 0
    fi
  done
  # If we reach here, no match was found after checking the whole array
  echo "WRONG INPUT: $selection not found in SERVICE_IDS"
  return 1
}

echo -e "~~ Hair Salon Scheduler ~~\n"
echo "Please select a service from the list:"
while true; do
  if CHECK_SELECTION $SERVICE_ID_SELECTED; then
    break
  else
    for i in ${SERVICE_IDS[@]}
    do
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$i")
      echo "$i) $SERVICE_NAME"
    done
  fi
  read SERVICE_ID_SELECTED
done
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

echo "What is your phone number?"
read CUSTOMER_PHONE

 if [[ $($PSQL "SELECT COUNT(*) FROM customers WHERE phone='$CUSTOMER_PHONE'") -eq 0 ]]; then
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
else
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
fi

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
echo "What time would you like your $SERVICE_NAME $CUSTOMER_NAME?"
read SERVICE_TIME
NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
exit 0
# declare -p SERVICE_IDS # for debugging