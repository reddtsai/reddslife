import 'package:get/get.dart';
import '../services/location_service.dart';
import '../services/google_map_service.dart';
import '../models/nearby_restaurant_model.dart';

class ExploreNearbyRestaurantController extends GetxController {
  final _nearbyRestaurants = <NearbyRestaurantModel>[].obs;
  List<NearbyRestaurantModel> get nearbyRestaurants =>
      _nearbyRestaurants.toList();
  final _location = ''.obs;
  String get location => _location.value;

  final LocationService locationService;
  final GoogleService googleService;
  ExploreNearbyRestaurantController(this.locationService, this.googleService);

  Future<void> exploreNearbyRestaurant() async {
    final (ok, position) = await locationService.getCurrentLocation();
    if (ok && position != null) {
      _location.value =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';

      final response = await googleService.getNearbyRestaurants(
        position.latitude,
        position.longitude,
      );
      if (response.status == 'OK') {
        _nearbyRestaurants.value = response.results!
            .map((result) =>
                NearbyRestaurantModel(result.name ?? '', result.rating ?? 0.0))
            .toList();
      }
    }
  }
}
