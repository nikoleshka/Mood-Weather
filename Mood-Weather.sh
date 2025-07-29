#Mood-Weather shell scripting project.


#---------Config----------
API_KEY="347ca835cff44547af150547252607"
CITY="ESFAHAN"

#----------Fetch----------
WEATHER_JSON=$(curl -s "http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$CITY")
CONDITION=$(echo "$WEATHER_JSON" |  jq -r '.current.condition.text')
TEMPR=$(echo "$WEATHER_JSON" | jq -r '.current.temp_c')

#---------output weather info---------
echo "📍$CITY"
echo "🌡️Temperature: $TEMPR °C"
echo "🌤️Condition: $CONDITION"

#------quotes based on weather--------
QUOTE_FILE=""

 if echo "$CONDITION" | grep -iqE "Rain|Fog|Cloud"; then
	QUOTE_FILE="./gloomy.txt"
 elif echo "$CONDITION" | grep -iqE "Sun|Clear"; then
	QUOTE_FILE="sunny.txt"
 elif echo "$CONDITION" | grep -iqE "Snow|Cold"; then
	QUOTE_FILE="./Cozy.txt"
 else
	QUOTE_FILE="./gloomy.txt"
fi

#------checking and handeling the txt files missing
if [[ -s "$QUOTE_FILE" ]]; then
	QUOTE=$(shuf -n 1 "$QUOTE_FILE")
else
	QUOTE="Just Keep Swimming."
fi
#------- Quote show------------------
  echo "🧾 $QUOTE"
