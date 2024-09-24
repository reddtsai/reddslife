import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './main_view.dart';
import './explore_nearby_restaurant_view.dart';
import './settings_view.dart';
import '../controllers/root_controller.dart';

class HomePage extends GetView<RootController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Redds Life App'), Icon(Icons.notifications)],
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MainView(),
          ExploreNearbyRestaurantView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.onTap(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '主頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            activeIcon: Icon(Icons.fastfood),
            label: '覓食',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.stacked_line_chart_outlined),
          //   activeIcon: Icon(Icons.stacked_line_chart),
          //   label: '錢錢',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
      ),
    );
  }
}
