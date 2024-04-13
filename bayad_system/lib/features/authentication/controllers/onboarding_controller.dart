import 'package:bayad_system/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:get_storage/get_storage.dart";

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //? Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //? Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //? Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  //? Update current index & jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      //? Navigate to the next screen
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //? Update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
