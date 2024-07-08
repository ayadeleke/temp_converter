// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/api.dart';
import 'package:flutter_weather_app/weathermodel.dart';
import 'package:flutter_weather_app/weather.dart';
import 'package:flutter_weather_app/temp_converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiResponse? response;
  bool inProgress = false;
  String message = "Please search for a valid location to get weather data";
  bool isCelsius = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lite Weather App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.blue.shade800,
          actions: [
            IconButton(
              iconSize: 30,
              color: Colors.white,
              tooltip: 'swap units',
              splashRadius: 20,
              icon: Icon(Icons.autorenew),
              onPressed: () {
                setState(() {
                  isCelsius = !isCelsius;
                });
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.grey.shade300,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchWidget(),
              const SizedBox(height: 20),
              TemperatureConverter(),
              const SizedBox(height: 20),
              if (inProgress)
                CircularProgressIndicator()
              else
                Expanded(
                  child: SingleChildScrollView(
                    child:
                        WeatherWidget(response: response, isCelsius: isCelsius),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchWidget() {
    return SearchBar(
      hintText: "Search any location",
      onSubmitted: (value) {
        _getWeatherData(value);
      },
    );
  }

  _getWeatherData(String location) async {
    setState(() {
      inProgress = true;
    });

    try {
      response = await WeatherApi().getCurrentWeather(location);
    } catch (e) {
      setState(() {
        message = "Failed to get weather ";
        response = null;
      });
    } finally {
      setState(() {
        inProgress = false;
      });
    }
  }
}
