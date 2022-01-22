class Weather {
  final String weatherStateName;
  final DateTime date;
  final double minTemp;
  final double mixTemp;
  final double temp;
  final double windSpeed;

  Weather({
    required this.weatherStateName,
    required this.date,
    required this.minTemp,
    required this.mixTemp,
    required this.temp,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> jsonData) {
    return Weather(
      weatherStateName: jsonData['weather_state_name'],
      date: DateTime.parse(jsonData['applicable_date'],),
      minTemp: jsonData['min_temp'],
      mixTemp: jsonData['max_temp'],
      temp: jsonData['the_temp'],
      windSpeed: jsonData['wind_speed'],
    );
  }

  @override
  String toString() {
    return 'Weather(weatherStateName: $weatherStateName, date: $date, minTemp: $minTemp, mixTemp: $mixTemp, temp: $temp, windSpeed: $windSpeed)';
  }

  String getImage() {
    if (weatherStateName == 'Clear') {
      return 'assets/images/Clear.png';
    } else if (weatherStateName == 'Light Cloud') {
      return 'assets/images/LightCloud.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/HeavyCloud.png';
    } else if (weatherStateName == 'Showers') {
      return 'assets/images/Showers.png';
    } else if (weatherStateName == 'Light Rain') {
      return 'assets/images/light-rain.png';
    } else if (weatherStateName == 'Heavy Rain') {
      return 'assets/images/heavy-rain.png';
    }else if (weatherStateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    }else if (weatherStateName == 'Hail') {
      return 'assets/images/hail.png';
    }else if (weatherStateName == 'Sleet') {
      return 'assets/images/sleet.png';
    }else if (weatherStateName == 'Snow') {
      return 'assets/images/snow.png';
    }else {
      return 'assets/images/Clear.png';
    }
  }
}
