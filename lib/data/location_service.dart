import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

abstract class LocationService extends GetxService {
  Future<(bool, Position?)> getCurrentLocation();
}

class GeolocatorService extends GetxService implements LocationService {
  late GeolocatorPlatform geolocatorPlatform;

  Future<GeolocatorService> init() async {
    geolocatorPlatform = GeolocatorPlatform.instance;
    return this;
  }

  @override
  Future<(bool, Position?)> getCurrentLocation() async {
    Position position;
    final (ok, msg) = await handlePermission();
    if (ok) {
      position = await geolocatorPlatform.getCurrentPosition();
      return (true, position);
    }

    // TODO: Handle error
    return (false, null);
  }

  Future<(bool, String)> handlePermission() async {
    bool isServiceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return (false, 'Location services are disabled.');
    }

    LocationPermission permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return (false, 'Location permissions denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return (false, 'Location permissions denied forever');
    }

    return (true, '');
  }
}
