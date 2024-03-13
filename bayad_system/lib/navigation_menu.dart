import 'package:bayad_system/utils/helpers/helper_functions.dart';
import 'package:bayad_system/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu
({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? CustomColors.black : CustomColors.white,
          indicatorColor: darkMode ? CustomColors.white.withOpacity(0.2) : CustomColors.black.withOpacity(0.2),
        
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.box), label: 'Inventory'),
            NavigationDestination(icon: Icon(Iconsax.menu_board), label: 'Products'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          ],
        ),
      ),
      
      body:Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
  ];


}