import json

import requests

TOWN = "Tilottama"


def get_weather(town):
    url = f"http://wttr.in/{town}?format=1"
    response = requests.get(url, timeout=5)
    weather_data = response.text.strip()

    icon = weather_data.split()[0]
    temperature = weather_data.split()[-1].replace("+", "")

    return {"text": f"{icon} {temperature}"}


if __name__ == "__main__":
    weather_info = get_weather(TOWN)
    print(json.dumps(weather_info))
