import 'package:bayad_system/navigation_menu.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBetweenSections),
      child: Column(
          children: [
            //* Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), 
                labelText: Texts.email
              )
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields),
      
            //* Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: Texts.password, 
                suffixIcon: Icon(Iconsax.eye_slash),
              )
            ),
            const SizedBox(height: CustomSizes.spaceBetweenInputFields/2),
      
            //* Remember me and Forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* Remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(Texts.rememberMe),
                  ],
                ),
      
                //* Forget password
                  TextButton(onPressed: (){}, child: const Text(Texts.forgetPassword)),
              ],
            ),
            const SizedBox(height: CustomSizes.spaceBetweenSections),
      
            //* Sign in button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(Texts.signIn))),
            const SizedBox(height: CustomSizes.spaceBetweenItems),
      
            //* Create account button
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(Texts.createAccount))),
            const SizedBox(height: CustomSizes.spaceBetweenItems),
          ],
        ),
      )
    );
  }
}