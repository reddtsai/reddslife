import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/explore_nearby_restaurant_controller.dart';

class ExploreNearbyRestaurantPage
    extends GetView<ExploreNearbyRestaurantController> {
  const ExploreNearbyRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Latitude: ${controller.latitude.value}'),
            Text('Longitude: ${controller.longitude.value}'),
            ElevatedButton(
              onPressed: () {
                controller.getCurrentLocation();
              },
              child: const Text('Get Current Location'),
            ),
          ],
        ),
      ),
    );
  }
}
