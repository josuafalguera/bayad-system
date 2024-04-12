import 'package:bayad_system/features/authentication/controllers/onboarding_controller.dart';
import 'package:bayad_system/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:bayad_system/utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/sizes.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: CustomDeviceUtils.getBottomNavigationHeight(),
      right: CustomSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? CustomColors.primaryColor : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
