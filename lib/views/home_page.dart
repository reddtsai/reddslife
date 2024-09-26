import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.homePageTitle),
            const Icon(Icons.notifications)
          ],
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.mainView,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.fastfood_outlined),
            activeIcon: const Icon(Icons.fastfood),
            label: AppLocalizations.of(context)!.exploreNearbyRestaurantView,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.stacked_line_chart_outlined),
          //   activeIcon: Icon(Icons.stacked_line_chart),
          //   label: '錢錢',
          // ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settingsView,
          ),
        ],
      ),
    );
  }
}
