import 'package:bayad_system/common/styles/spacing_styles.dart';
import 'package:bayad_system/features/authentication/screens/login/login.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'package:bayad_system/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle});

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //? Image
              Image(image: AssetImage(image), width: HelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //? Title & Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBetweenItems),
              Text(Texts.yourAccountCreatedSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //? Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(Texts.econtinue))),
            ],
          ),
        ),
      ),
    );
  }
}