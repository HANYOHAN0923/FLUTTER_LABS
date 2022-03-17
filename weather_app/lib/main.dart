import 'package:flutter/material.dart';
import './util/weather.dart';
import './util/weather_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [Weather(), WeatherImage()],
    )));
  }
}
