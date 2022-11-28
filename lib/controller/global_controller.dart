import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
//variables
  final RxBool _isloading = true.obs;
  final RxDouble _latitud = 1.0.obs;
  final RxDouble _longitud = 1.0.obs;
  RxBool checkLoading() => _isloading;
  RxDouble getLatitude() => _latitud;
  RxDouble getlongitude() => _longitud;
  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("GPS no disponible");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("La aplicación nunca tendrá los permisos");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("La aplicación no tiene los permisos");
      }
    }

    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((value) => {
              _latitud.value = value.latitude,
              _longitud.value = value.longitude,
              _isloading.value = false,
              _latitud.refresh(),
              _longitud.refresh(),
              _isloading.refresh()
            });
  }
}
