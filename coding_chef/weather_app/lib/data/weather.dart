import 'package:dio/dio.dart';

import 'package:weather_app/config.dart';

class Weather {
  final dio = Dio();
  final double latitude;
  final double longitude;

  Weather(this.latitude, this.longitude);

  // Future<dynamic> getWeather() async {
  Future<Map<String, dynamic>?> getWeather() async {
    Response response =
        await dio.get('https://api.openweathermap.org/data/2.5/weather'
            '?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    if (response.statusCode == 200) {
      return response.data;
      print(response.data);
    } else {
      return null;
    }
  }
}
