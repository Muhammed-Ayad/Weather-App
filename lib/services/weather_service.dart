import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:weather/helpers/api.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/geolocator_service.dart';

class WeatherService {
  final baseUrl = 'https://www.metaweather.com';

  Future<int> getCityId({required String cityName}) async {
    List<dynamic> data =
        await API.get(url: '$baseUrl/api/location/search/?query=$cityName');

    int cityId = data[0]["woeid"];
    log(cityId.toString());
    return cityId;
  }

  Future<int> getLocation() async {
    GeolocatorService geolocator = GeolocatorService();
    Position? position = await geolocator.determinePosition();
    List<dynamic> data = await API.get(
        url:
            '$baseUrl/api/location/search/?lattlong=${position!.latitude.toStringAsFixed(4)},${position.longitude.toStringAsFixed(4)}');

    int cityId = data[0]["woeid"];
    log(cityId.toString());
    return cityId;
  }

  Future<List<Weather>?> getDailyWeatherLocation() async {
    int cityIdLocation = await getLocation();

    List<Weather>? weatherList = [];

    Map<String, dynamic> jsonData =
        await API.get(url: '$baseUrl/api/location/$cityIdLocation/');

    List<dynamic> dailyWeatherList = jsonData['consolidated_weather'];

    for (var data in dailyWeatherList) {
      weatherList.add(Weather.fromJson(data));
    }
    log(weatherList.toString());
    return weatherList;
  }

  Future<Weather?> getDailyWeatherCityName({required String cityName}) async {
    int cityId = await getCityId(cityName: cityName);

    Map<String, dynamic> jsonData =
        await API.get(url: '$baseUrl/api/location/$cityId/');
    Map<String, dynamic> data = jsonData['consolidated_weather'][0];

    Weather? weatherData = Weather.fromJson(data);

    log(weatherData.toString());
    return weatherData;
  }
}
