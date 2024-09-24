import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/explore_nearby_restaurant_controller.dart';

class ExploreNearbyRestaurantView
    extends GetView<ExploreNearbyRestaurantController> {
  const ExploreNearbyRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: controller.exploreNearbyRestaurant,
            ),
            Obx(() => Text(controller.location)),
          ],
        ),
        Expanded(
            child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.nearbyRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = controller.nearbyRestaurants[index];
                    return ListTile(
                      title: Text(restaurant.name),
                      subtitle: Text(restaurant.rating.toString()),
                    );
                  },
                ))),
      ],
    );
  }
}
