import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'widgets/login_header.dart';
import 'widgets/login_form.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //* Logo, Title, and Subtitle
              LoginHeader(dark: dark),

              //* Form
              const LoginForm(),

              //* Divider
              FormDivider(dividerText: Texts.orSignInWith, dark: dark),

              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //* Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
