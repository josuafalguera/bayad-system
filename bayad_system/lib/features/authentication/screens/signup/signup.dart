import 'package:bayad_system/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../login/login.dart';

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
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(labelText: Texts.firstName, prefixIcon: Icon(Iconsax.user)),
                          )
                        ),
                        const SizedBox(width: CustomSizes.spaceBetweenInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(labelText: Texts.lastName, prefixIcon: Icon(Iconsax.user)),
                          )
                        ),
                      ],
                    ),

                    const SizedBox(height: CustomSizes.spaceBetweenInputFields),
                    
                    //* Username
                    TextFormField(
                      decoration: const InputDecoration(labelText: Texts.username, prefixIcon: Icon(Iconsax.user_edit)),
                    ),

                    const SizedBox(height: CustomSizes.spaceBetweenInputFields),

                    //* Email
                    TextFormField(
                      decoration: const InputDecoration(labelText: Texts.email, prefixIcon: Icon(Iconsax.direct)),
                    ),

                    const SizedBox(height: CustomSizes.spaceBetweenInputFields),

                    //* Phone number
                    TextFormField(
                      decoration: const InputDecoration(labelText: Texts.phoneNo, prefixIcon: Icon(Iconsax.call)),
                    ),

                    const SizedBox(height: CustomSizes.spaceBetweenInputFields),

                    //* Password
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: Texts.password, 
                        prefixIcon: Icon(Iconsax.password_check), 
                        suffixIcon: Icon(Iconsax.eye_slash)
                      ),
                    ),

                    const SizedBox(height: CustomSizes.spaceBetweenSections),

                    //* Terms and conditions checkbox
                    Row(
                      children: [
                        SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value) {})),
                        const SizedBox(width: CustomSizes.spaceBetweenItems),
                        Text.rich(
                          TextSpan( children: [
                            TextSpan(text: '${Texts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(text: Texts.privacyPolicy, 
                              style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark? CustomColors.white : CustomColors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: dark? CustomColors.white : CustomColors.primaryColor,
                            )),
                            TextSpan(text: ' ${Texts.and} ', style: Theme.of(context).textTheme.bodySmall), 
                            TextSpan(text: Texts.termsOfUse, 
                              style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark? CustomColors.white : CustomColors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: dark? CustomColors.white : CustomColors.primaryColor,
                            )),
                            ],               
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: CustomSizes.spaceBetweenSections),

                    //* Sign up button
                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text(Texts.createAccount))),
                  ],
                ),
              ),

              //* Back to Login Form
              const SizedBox(height: CustomSizes.spaceBetweenItems),
              SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(Texts.signIn))),
              
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