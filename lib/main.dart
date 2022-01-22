import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/grid_card_page.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/widgets/search_widget.dart';
import 'package:weather/providers/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<WeatherProvider>(
      create: (context) {
        return WeatherProvider();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        SearchWidget.id: (context) => const SearchWidget(),
        SearchPage.id: (context) => const SearchPage(),
        GridCardPage.id:(context)=>const GridCardPage(),
      },
    );
  }
}
