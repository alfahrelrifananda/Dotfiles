#!/usr/bin/env python3
import json
import requests
from datetime import datetime

CITY = "Surakarta"
API_KEY = "eb235674bb746629cb773fb77ba13c75"
UNITS = "metric"
LANG = "en"

url = f"https://api.openweathermap.org/data/2.5/weather?q={CITY}&appid={API_KEY}&units={UNITS}&lang={LANG}"

try:
    weather = requests.get(url, timeout=5).json()

    temp = round(weather["main"]["temp"])
    feels = round(weather["main"]["feels_like"])
    desc = weather["weather"][0]["description"].capitalize()
    icon = weather["weather"][0]["icon"]

    ICONS = {
        "01d": "☀️", "01n": "🌙",
        "02d": "⛅", "02n": "☁️",
        "03d": "☁️", "03n": "☁️",
        "04d": "☁️", "04n": "☁️",
        "09d": "🌧️", "09n": "🌧️",
        "10d": "🌦️", "10n": "🌧️",
        "11d": "⛈️", "11n": "🌩️",
        "13d": "❄️", "13n": "❄️",
        "50d": "🌫️", "50n": "🌫️",
    }

    emoji = ICONS.get(icon, "🌈")

    tooltip = (
        f"<b>{CITY}</b>\n"
        f"{desc}\n"
        f"Temp: {temp}°C (feels {feels}°C)\n"
        f"Humidity: {weather['main']['humidity']}%\n"
        f"Wind: {weather['wind']['speed']} m/s"
    )

    data = {
        "text": f"{emoji} {temp}°",
        "tooltip": tooltip
    }

except Exception as e:
    data = {"text": "null", "tooltip": str(e)}

print(json.dumps(data))

