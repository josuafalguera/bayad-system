import 'package:bayad_system/features/authentication/controllers/onboarding_controller.dart';
import 'package:bayad_system/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import 'package:bayad_system/utils/device/device_utility.dart';
import '../../../../../utils/constants/sizes.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: CustomDeviceUtils.getBottomNavigationHeight() + 25,
      left: CustomSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController, 
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: dark ? CustomColors.light : CustomColors.black, dotHeight: 6),
      ),
    );
  }
}