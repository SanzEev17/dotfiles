#!/bin/zsh

# Declare the town as a variable
TOWN="Tilottama"

# Fetch weather data from wttr.in for the specified town
weather_data=$(curl -s "wttr.in/${TOWN}?format=%C+%t")

# Parse weather data
condition=$(echo "$weather_data" | awk '{print $1}')
temperature=$(echo "$weather_data" | awk '{print $NF}' | tr -d '+')

# Weather condition to icon mapping
declare -A WEATHER_ICONS=(
  ["Clear"]="☀️"
  ["Partly"]="⛅️"
  ["Cloudy"]="☁️"
  ["Overcast"]="☁️"
  ["Mist"]="🌫"
  ["Patchy"]="🌦"
  ["Thundery"]="⛈"
  ["Blizzard"]="❄️"
  ["Fog"]="🌫"
  ["Light"]="🌦"
  ["Heavy"]="🌧"
  ["Moderate"]="🌧"
  ["Freezing"]="❄️"
  ["Sunny"]="☀️"
  ["Shower"]="🌧"
  ["Snow"]="❄️"
  ["Drizzle"]="🌦"
  ["Rain"]="🌧"
  ["Ice"]="❄️"
  ["Sleet"]="🌧"
  ["Thunder"]="🌩"
)

# Find matching icon
icon="❓"
for weather in "${!WEATHER_ICONS[@]}"; do
  if [[ "$condition" == *"$weather" ]]; then
    icon="${WEATHER_ICONS[$weather]}"
    break
  fi
done

# Output JSON for Waybar
echo "{\"text\": \"$icon $temperature\"}"
