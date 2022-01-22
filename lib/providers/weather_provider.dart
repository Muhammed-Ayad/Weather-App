import 'package:flutter/foundation.dart';
import 'package:weather/models/weather.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weatherData;
  String? cityName;
  set setWeatherData(Weather? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  Weather? get getWeatherData => _weatherData;
}
