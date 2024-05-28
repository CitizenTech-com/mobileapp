import 'package:geolocator/geolocator.dart';

class SplashRepository {
  Future<Position?> getDeviceLocation() async {
    final bool isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();

    if (isLocationServiceEnabled) {
      final LocationPermission locationPermission =
          await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.always ||
          locationPermission == LocationPermission.whileInUse) {
        return await Geolocator.getCurrentPosition();
      }
    }

    return null;

    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    // }
    // return await Geolocator.getCurrentPosition();
  }

  Future<void> requestLocationPermission() async =>
      await Geolocator.requestPermission();
}
