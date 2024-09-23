import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home_page.dart';
import './explore_nearby_restaurant_page.dart';
import './settings_page.dart';
import '../controllers/root_controller.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({super.key});

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
        children: [
          const HomePage(),
          ExploreNearbyRestaurantPage(),
          SettingsPage(),
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
