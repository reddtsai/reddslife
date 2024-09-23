import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RootController extends GetxController {
  late Rx<PageController> _pageController;
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  PageController get pageController => _pageController.value;

  @override
  void onInit() {
    _pageController = PageController(initialPage: currentIndex).obs;
    super.onInit();
  }

  void onTap(int index) {
    _currentIndex.value = index;
    _pageController.value.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
