import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchWidget extends StatefulWidget {
  static const id = '/searchWidget';
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String? city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text(
          'Search by City',
          style: TextStyle(
            color: Colors.blue.shade900,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (value) => city = value,
            onSubmitted: (data) async {
              city = data;
              WeatherService weatherService = WeatherService();
              Weather? weatherModel =
                  await weatherService.getDailyWeatherCityName(cityName: city!);
              Provider.of<WeatherProvider>(context, listen: false)
                  .setWeatherData = weatherModel;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  city;
              Navigator.pushNamed(context, SearchPage.id);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();

                    Weather? weather =
                        await service.getDailyWeatherCityName(cityName: city!);

                    Provider.of<WeatherProvider>(context, listen: false)
                        .setWeatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = city;

                    Navigator.pushNamed(context, SearchPage.id);
                  },
                  child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              label: const Text('Search'),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}
