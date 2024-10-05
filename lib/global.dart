import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import './controllers/app_controller.dart';
import './controllers/chats_controller.dart';
import './controllers/explore_nearby_restaurant_controller.dart';
import './controllers/settings_controller.dart';
import './controllers/home_controller.dart';
import './services/location_service.dart';
import './services/local_key_value_storage.dart';
import './services/google_map_service.dart';
import './services/firebase_service.dart';
import './views/chat_page.dart';

class Global {
  static void dependencies() {
    // TODO: Auth
    String userID = '1';

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseMessaging firemessage = FirebaseMessaging.instance;
    Get.put(FirebaseService(firestore, firemessage, userID));
    Get.putAsync<LocationService>(() => GeolocatorService().init());
    Get.putAsync<LocalKeyValueStorage>(() => SharedPreferencesStorage().init());
    Get.putAsync<GoogleService>(() => GoogleApi().init());

    // Controllers
    Get.lazyPut(() => AppController(Get.find()));
    Get.lazyPut(() => HomeController());
    Get.lazyPut(
        () => ExploreNearbyRestaurantController(Get.find(), Get.find()));
    Get.lazyPut(() => ChatsController(Get.find()));
    Get.lazyPut(() => SettingsPageController(Get.find()));
  }

  static List<GetPage> pages() {
    // TODO: Auth
    String userID = '1';

    return [
      GetPage(
        name: '/chat/:id/:name',
        page: () => ChatPage(),
        binding: ChatPageBinding(userID),
      ),
    ];
  }
}
