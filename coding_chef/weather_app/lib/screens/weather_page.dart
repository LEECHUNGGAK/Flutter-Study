import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:io';

class WeatherPage extends StatefulWidget {
  final Map<String, dynamic> weatherData;
  final Map<String, dynamic> airPollutionData;

  const WeatherPage({
    super.key,
    required this.weatherData,
    required this.airPollutionData,
  });

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late String cityName;
  late double temperature;
  late int weatherId;
  late String weatherDescription;
  late int aqi;
  late double pm2_5;
  late double pm10;
  final localeName = Platform.localeName;

  void updateWeatherData(
    Map<String, dynamic> weatherData,
    Map<String, dynamic> airPollutionData,
  ) {
    cityName = weatherData['name'];
    temperature = weatherData['main']['temp'];
    weatherId = weatherData['weather'][0]['id'];
    weatherDescription = weatherData['weather'][0]['description'];
    aqi = airPollutionData['list'][0]['main']['aqi'];
    pm2_5 = airPollutionData['list'][0]['components']['pm2_5'];
    pm10 = airPollutionData['list'][0]['components']['pm10'];
  }

  String getCurrentDateTime() {
    return DateFormat.yMMMMEEEEd(localeName).add_jm().format(DateTime.now());
  }

  @override
  void initState() {
    super.initState();

    updateWeatherData(
      widget.weatherData,
      widget.airPollutionData,
    );

    initializeDateFormatting(localeName);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.near_me),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_searching),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 150.0,
            ),
            Text(
              cityName,
              style: textTheme.displayMedium!.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              getCurrentDateTime(),
              style: textTheme.displaySmall!.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 150.0,
            ),
            Text(
              '$temperature\u2103',
              style: textTheme.displayLarge!.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            Row(
              children: [
                getWeatherIcon(weatherId),
                Text(weatherDescription),
              ],
            ),
            const Divider(
              height: 15.0,
              thickness: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'AQI(대기질지수)',
                      style: textTheme.titleMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    getAQIImage(aqi),
                    Text(
                      getAQIDescription(aqi),
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '미세먼지',
                      style: textTheme.titleMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '$pm10',
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'PM-10',
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '초미세먼지',
                      style: textTheme.titleMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '$pm2_5',
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'PM-2.5',
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget getWeatherIcon(int weatherId) {
  String svgPath;

  if (weatherId < 300) {
    svgPath = 'assets/svg/climacon-cloud_lightning.svg';
  } else if (weatherId < 600) {
    svgPath = 'assets/svg/climacon-cloud_snow_alt.svg';
  } else if (weatherId == 800) {
    svgPath = 'assets/svg/climacon-sun.svg';
  } else {
    svgPath = 'assets/svg/climacon-cloud_sun.svg';
  }

  return SvgPicture.asset(
    svgPath,
    colorFilter: ColorFilter.mode(
      Colors.black87,
      BlendMode.srcIn,
    ),
  );
}

Widget getAQIImage(int aqi) {
  String imagePath;

  switch (aqi) {
    case 1:
      imagePath = 'assets/images/good.png';
      break;
    case 2:
      imagePath = 'assets/images/fair.png';
      break;
    case 3:
      imagePath = 'assets/images/moderate.png';
      break;
    case 4:
      imagePath = 'assets/images/poor.png';
      break;
    case 5:
      imagePath = 'assets/images/bad.png';
      break;
    default:
      throw UnimplementedError('no image for AQI $aqi');
  }

  return Image.asset(
    imagePath,
    width: 38.0,
    height: 35.0,
  );
}

String getAQIDescription(int aqi) {
  String description;

  switch (aqi) {
    case 1:
      description = '매우 좋음';
      break;
    case 2:
      description = '좋음';
      break;
    case 3:
      description = '보통';
      break;
    case 4:
      description = '나쁨';
      break;
    case 5:
      description = '매우 나쁨';
      break;
    default:
      throw UnimplementedError('no description for AQI $aqi');
  }

  return description;
}

