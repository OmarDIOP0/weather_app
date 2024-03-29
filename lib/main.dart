import 'package:flutter/material.dart';
import 'package:weather_application/screens/home_page.dart';
import 'package:weather_application/screens/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WEATHER APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const WeatherPage()
    );
  }
}

