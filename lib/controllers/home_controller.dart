import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  late PageController pageController;
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex);
    super.onInit();
  }

  void onTap(int index) {
    _currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
