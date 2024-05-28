import 'package:geolocator/geolocator.dart';

class SplashRepository {
  Future<Position?> getDeviceLocation() async =>
      await Geolocator.getCurrentPosition();

  Future<void> requestLocationPermission() async =>
      await Geolocator.requestPermission();

  Future<bool> isLocationServiceEnabled() async =>
      await Geolocator.isLocationServiceEnabled();

  Future<bool> isLocationPermissionGranted() async {
    final LocationPermission locationPermission =
        await Geolocator.checkPermission();

    return (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse);
  }
}
