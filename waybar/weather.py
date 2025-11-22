#!/usr/bin/env python3
import json
import urllib.request
import urllib.error

# Configuration
API_KEY = "eb235674bb746629cb773fb77ba13c75"  # Get free API key from https://openweathermap.org/api
CITY = "Surakarta"  # Your city name
COUNTRY_CODE = "IDN"  # Optional: country code for more accuracy

# Weather icons mapping
WEATHER_ICONS = {
    "01d": "☀️",  # clear sky day
    "01n": "🌙",  # clear sky night
    "02d": "⛅",  # few clouds day
    "02n": "☁️",  # few clouds night
    "03d": "☁️",  # scattered clouds
    "03n": "☁️",
    "04d": "☁️",  # broken clouds
    "04n": "☁️",
    "09d": "🌧️",  # shower rain
    "09n": "🌧️",
    "10d": "🌦️",  # rain day
    "10n": "🌧️",  # rain night
    "11d": "⛈️",  # thunderstorm
    "11n": "⛈️",
    "13d": "❄️",  # snow
    "13n": "❄️",
    "50d": "🌫️",  # mist
    "50n": "🌫️",
}

def get_weather():
    """Fetch weather data from OpenWeatherMap API"""
    try:
        url = f"https://api.openweathermap.org/data/2.5/weather?q={CITY},{COUNTRY_CODE}&appid={API_KEY}&units=metric"
        
        with urllib.request.urlopen(url, timeout=10) as response:
            data = json.loads(response.read().decode())
            
        temp = round(data['main']['temp'])
        feels_like = round(data['main']['feels_like'])
        description = data['weather'][0]['description'].capitalize()
        icon_code = data['weather'][0]['icon']
        icon = WEATHER_ICONS.get(icon_code, "🌡️")
        humidity = data['main']['humidity']
        wind_speed = data['wind']['speed']
        
        # Format output
        text = f"{icon} {temp}°C"
        tooltip = f"{description}\n"
        tooltip += f"Temperature: {temp}°C\n"
        tooltip += f"Feels like: {feels_like}°C\n"
        tooltip += f"Humidity: {humidity}%\n"
        tooltip += f"Wind: {wind_speed} m/s"
        
        output = {
            "text": text,
            "tooltip": tooltip,
            "class": "weather"
        }
        
        print(json.dumps(output))
        
    except urllib.error.URLError as e:
        # Network error - signal Waybar to retry sooner
        output = {
            "text": "🌡️ --°C",
            "tooltip": "No internet connection. Retrying...",
            "class": "weather-error"
        }
        print(json.dumps(output))
        exit(1)  # Exit with error code to trigger faster retry
        
    except Exception as e:
        # Other errors
        output = {
            "text": "🌡️ --°C",
            "tooltip": f"Error: {str(e)}",
            "class": "weather-error"
        }
        print(json.dumps(output))
        exit(1)  # Exit with error code to trigger faster retry

if __name__ == "__main__":
    get_weather()
