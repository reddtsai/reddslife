import 'package:get/get.dart';
import './controllers/app_controller.dart';
import './controllers/chats_controller.dart';
import './controllers/explore_nearby_restaurant_controller.dart';
import './controllers/settings_controller.dart';
import './controllers/home_controller.dart';
import './data/location_service.dart';
import './data/local_key_value_storage.dart';
import './data/google_map_service.dart';
import './views/chat_page.dart';

class AppInjections {
  static void dependencies() {
    Get.putAsync<LocationService>(() => GeolocatorService().init());
    Get.putAsync<LocalKeyValueStorage>(() => SharedPreferencesStorage().init());
    Get.putAsync<GoogleService>(() => GoogleApi().init());

    // Controllers
    Get.lazyPut(() => AppController(Get.find()));
    Get.lazyPut(() => HomeController());
    Get.lazyPut(
        () => ExploreNearbyRestaurantController(Get.find(), Get.find()));
    Get.lazyPut(() => ChatsController());
    Get.lazyPut(() => SettingsPageController(Get.find()));
  }

  static List<GetPage> pages() {
    return [
      GetPage(
        name: '/chat/:title',
        page: () => ChatPage(),
        binding: ChatPageBinding(),
      ),
    ];
  }
}
