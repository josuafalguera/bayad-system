import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Title
              Text(Texts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //* Form
              SignupForm(dark: dark),

              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //* Divider
              FormDivider(dividerText: Texts.orSignUpWith, dark: dark),

              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //* Footer
              const SocialButtons(),
            ],
          ),
        ),
      )
    );
  }
}