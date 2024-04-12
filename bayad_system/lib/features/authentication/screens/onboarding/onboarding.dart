import 'package:bayad_system/features/authentication/controllers/onboarding_controller.dart';
import 'package:bayad_system/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';
import '../../../../utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //? Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: Images.digitalLedgers,
                  title: Texts.onBoardingTitle1,
                  subTitle: Texts.onBoardingSubtitle1),
              OnBoardingPage(
                  image: Images.offlinePOS,
                  title: Texts.onBoardingTitle2,
                  subTitle: Texts.onBoardingSubtitle2),
              OnBoardingPage(
                  image: Images.tailored,
                  title: Texts.onBoardingTitle3,
                  subTitle: Texts.onBoardingSubtitle3),
            ],
          ),

          //? Skip Button
          const OnBoardingSkip(),

          //? Dot Navigation Indicator
          const OnBoardingDotNavigation(),

          //? Circulatr Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
