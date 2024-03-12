import 'package:flutter/material.dart';

import 'package:weather_app/data/my_position.dart';
import 'package:weather_app/data/weather.dart';
import 'package:weather_app/screens/weather_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    super.key,
  });

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  Future<void> fetchData() async {
    MyPosition myPosition = MyPosition();
    await myPosition.getMyPosition();

    Weather weather = Weather(myPosition.myLatitude, myPosition.myLongitude);
    Map<String, dynamic> weatherData = await weather.getWeather();
    Map<String, dynamic> airPollutionData = await weather.getAirPollution();

    print(weatherData);
    print(airPollutionData);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WeatherPage(
          weatherData: weatherData,
          airPollutionData: airPollutionData,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            fetchData();
          },
          child: const Text('Get my location'),
        ),
      ),
    );
  }
}
