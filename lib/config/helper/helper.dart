class Helper {
  static String getWeatherEmoji(String? main) {
    switch (main) {
      case 'Clear':
        return '☀️';
      case 'Clouds':
        return '☁️';
      case 'Rain':
        return '🌧️';
      case 'Drizzle':
        return '🌦️';
      case 'Thunderstorm':
        return '⛈️';
      case 'Snow':
        return '❄️';
      case 'Mist':
      case 'Fog':
        return '🌫️';
      case 'Haze':
        return '🌁';
      case 'Smoke':
        return '🚬';
      case 'Dust':
      case 'Sand':
        return '💨';
      case 'Ash':
        return '🌋';
      case 'Squall':
        return '🌬️';
      case 'Tornado':
        return '🌪️';
      default:
        return '🌈'; // fallback emoji
    }
  }
}
