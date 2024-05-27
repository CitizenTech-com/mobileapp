import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late bool servicePermission = false;
  late LocationPermission permission;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();

    if (!servicePermission) {
      print("Service Disabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  getLocation() async {
    Position currentLocation = await _getCurrentLocation();
    // call api to current location data on server.
  }
}
