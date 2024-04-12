import 'package:bayad_system/common/widgets/success_screen/success_screen.dart';
import 'package:bayad_system/features/authentication/screens/login/login.dart';
import 'package:bayad_system/utils/constants/image_strings.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'package:bayad_system/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        //? Padding to Give Default Equal Space on all sides in all screens
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              //? Image
              Image(
                  image: const AssetImage(Images.verifyEmail),
                  width: HelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //? Title & Subtitle
              Text(Texts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBetweenItems),
              Text('sample.gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBetweenItems),
              Text(Texts.confirmEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //? Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(
                            () => const SuccessScreen(
                              image: Images.verifySucces,
                              title: Texts.yourAccountCreatedTitle,
                              subtitle: Texts.yourAccountCreatedSubtitle,
                            ),
                          ),
                      child: const Text(Texts.econtinue))),
              const SizedBox(height: CustomSizes.spaceBetweenItems),
              TextButton(
                  onPressed: () {},
                  child: Text(Texts.resendEmail,
                      style: Theme.of(context).textTheme.labelMedium)),
            ],
          ),
        ),
      ),
    );
  }
}
