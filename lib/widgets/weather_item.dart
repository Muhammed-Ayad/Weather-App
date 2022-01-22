import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:weather/models/weather.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(5, 5),
                spreadRadius: 10,
                blurRadius: 10,
              )
            ]),
            child: Card(
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      weather.weatherStateName,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    FittedBox(
                      child: Text(
                        DateFormat.EEEE().format(weather.date),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Temp   ${weather.minTemp.toStringAsFixed(1)}° : ${weather.mixTemp.toStringAsFixed(1)}°',
                      style: const TextStyle(
                        color: Colors.pink,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Wind Speed :  ${weather.windSpeed.toStringAsFixed(1)}',
                      style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -70,
            right: 45,
            child: Image.asset(
              weather.getImage(),
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
