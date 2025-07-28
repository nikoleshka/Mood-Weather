#Mood-Weather shell scripting project.


#---------Config----------
API-KEY = "347ca835cff44547af150547252607"
CITY="ESFAHAN"
QUOTE_FILE= "quote.txt"


#----------Fetch----------
WEATHER_JSON = $(curl -s "http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$CITY")
CONDITION = $(echo "$WEATHER_JSON" |  jq -r 'current.condition.text')
TEMPR = $(echo "WEATHER_JSON" | jq -r '.current.temp_c')

#---------output weather info---------
echo "📍 $CITY"
echo "🌡️ Temperature: $TEMP°C"
echo "🌤️ Condition: $CONDITION"

#------quotes based on weather--------
