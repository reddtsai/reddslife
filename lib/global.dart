import 'package:get/get.dart';
import './controllers/app_controller.dart';
import './controllers/explore_nearby_restaurant_controller.dart';
import './controllers/settings_controller.dart';
import './controllers/root_controller.dart';
import './data/location_service.dart';
import './data/local_key_value_storage.dart';

class AppInjections {
  static void dependencies() {
    Get.putAsync<LocationService>(() => GeolocatorService().conn());
    Get.putAsync<LocalKeyValueStorage>(() => SharedPreferencesStorage().conn());

    // Controllers
    Get.lazyPut(() => AppController(Get.find()));
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => ExploreNearbyRestaurantController(Get.find()));
    Get.lazyPut(() => SettingsPageController(Get.find()));
  }
}
