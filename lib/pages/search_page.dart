import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  static const id = '/SearchPage';
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context).getWeatherData;
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: Text(
            Provider.of<WeatherProvider>(context).cityName!.toUpperCase(),
            style: TextStyle(
              color: Colors.blue.shade900,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[300],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                Provider.of<WeatherProvider>(context).cityName!,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                DateFormat.EEEE().format(weatherData!.date),
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              Image.asset(
                weatherData.getImage(),
                height: 200,
                width: 200,
              ),
              const Spacer(),
              Text(
                'Temp   ${weatherData.minTemp.toStringAsFixed(1)}° : ${weatherData.mixTemp.toStringAsFixed(1)}°',
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 26,
                ),
              ),
              const Spacer(),
              Text(
                'Wind Speed :  ${weatherData.windSpeed.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 25,
                ),
              ),
              const Spacer(),
              Text(
                weatherData.weatherStateName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ));
  }
}
