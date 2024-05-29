import 'package:Citizen.Tech/modules/splash_module/repo/splash.repo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final SplashRepository repo;
  RxBool isLocationServiceEnabled = false.obs;
  RxBool isLocationPermissionGranted = false.obs;
  Rx<Position?> deviceLocation = null.obs;
  SplashController({required this.repo});

  @override
  void onInit() async {
    super.onInit();
    isLocationServiceEnabled(await repo.isLocationServiceEnabled());
    isLocationPermissionGranted(await repo.isLocationPermissionGranted());

    if (isLocationServiceEnabled.isTrue && isLocationPermissionGranted.isTrue) {
      deviceLocation(await repo.getDeviceLocation());
    } else {
      // deviceLocation(null);
      requestLocationPermission();
    }
  }

  Future<void> requestLocationPermission() async =>
      await repo.requestLocationPermission();
}
