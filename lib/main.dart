import 'package:akit_weather/weather/WeatherPage.dart';
import 'package:akit_weather/weather/model/Weather.dart';
import 'package:akit_weather/weather/WeatherApi.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherPage(title: 'Home Page'),
    );
  }
}
