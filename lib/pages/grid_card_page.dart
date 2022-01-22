import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/widgets/weather_item.dart';

class GridCardPage extends StatelessWidget {
  static const id ='/GridCardPage';
  const GridCardPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Weather>?>(
        future: WeatherService().getDailyWeatherLocation(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Weather> weather = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(top:100,right: 6,left: 6),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 80,
                  childAspectRatio: 1.3,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return WeatherItem(weather: weather[index]);
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
  }
}