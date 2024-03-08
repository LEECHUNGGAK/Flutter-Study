import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  final dynamic weatherData;

  const WeatherPage({super.key, this.weatherData});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late String cityName;
  late double temperature;

  void updateWeatherData(dynamic weatherData) {
    cityName = weatherData['name'];
    temperature = weatherData['main']['temp'];
  }

  @override
  void initState() {
    super.initState();
    updateWeatherData(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityName,
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                temperature.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
