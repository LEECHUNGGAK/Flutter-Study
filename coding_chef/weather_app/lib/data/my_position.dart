import 'package:geolocator/geolocator.dart';

class MyPosition {
  late double myLatitude;
  late double myLongitude;

  Future<void> getMyPosition() async {
    LocationPermission permission = await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      myLatitude = position.latitude;
      myLongitude = position.longitude;
    } catch (e) {
      print('There was a problem with the internet connection.');
    }
  }
}