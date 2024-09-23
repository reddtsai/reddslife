import '../data/location_service.dart';
import 'package:get/get.dart';

class ExploreNearbyRestaurantController extends GetxController {
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;

  final LocationService locationService;
  ExploreNearbyRestaurantController(this.locationService);

  Future<void> getCurrentLocation() async {
    final (ok, position) = await locationService.getCurrentLocation();
    if (ok) {
      latitude.value = position!.latitude.toString();
      longitude.value = position.longitude.toString();
    }
  }
}
