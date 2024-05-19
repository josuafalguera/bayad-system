import 'package:bayad_system/data/repositories/authentication/authentication_repository.dart';
import 'package:bayad_system/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:bayad_system/utils/constants/image_strings.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'package:bayad_system/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
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
              Text(email ?? '',
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
                      onPressed: () => controller.checkEmailVerifiedStatus(),
                      child: const Text(Texts.econtinue))),
              const SizedBox(height: CustomSizes.spaceBetweenItems),
              TextButton(
                  onPressed: () => controller.sendEmailVerificationLink(),
                  child: Text(Texts.resendEmail,
                      style: Theme.of(context).textTheme.labelMedium)),
            ],
          ),
        ),
      ),
    );
  }
}
