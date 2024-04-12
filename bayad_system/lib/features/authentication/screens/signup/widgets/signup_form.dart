import 'package:bayad_system/features/authentication/screens/signup/verify_email.dart';
import 'package:bayad_system/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: Texts.firstName, prefixIcon: Icon(Iconsax.user)),
              )),
              const SizedBox(width: CustomSizes.spaceBetweenInputFields),
              Expanded(
                  child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: Texts.lastName, prefixIcon: Icon(Iconsax.user)),
              )),
            ],
          ),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields),

          //* Username
          TextFormField(
            decoration: const InputDecoration(
                labelText: Texts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields),

          //* Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: Texts.email, prefixIcon: Icon(Iconsax.direct)),
          ),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields),

          //* Phone number
          TextFormField(
            decoration: const InputDecoration(
                labelText: Texts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields),

          //* Password
          TextFormField(
            decoration: const InputDecoration(
                labelText: Texts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),

          const SizedBox(height: CustomSizes.spaceBetweenSections),

          //* Terms and conditions checkbox
          TermsAndConditionCheckbox(dark: dark),

          const SizedBox(height: CustomSizes.spaceBetweenSections),

          //* Sign up button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const VerifyEmailScreen()),
                  child: const Text(Texts.createAccount))),
        ],
      ),
    );
  }
}
