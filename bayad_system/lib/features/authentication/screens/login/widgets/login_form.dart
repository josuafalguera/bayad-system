import 'package:bayad_system/features/authentication/controllers/login/login_controller.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/validators/validation.dart';
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
    final controller = Get.put(LoginController());

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.spaceBetweenSections),
          child: Column(
            children: [
              //* Email
              TextFormField(
                  controller: controller.email,
                  validator: (value) => Validator.validateEmail(value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: Texts.email)),
              const SizedBox(height: CustomSizes.spaceBetweenInputFields),

              //* Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) =>
                      Validator.validateEmptyText('Password', value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: Texts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                      )),
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBetweenInputFields / 2),

              //* Remember me and Forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Remember me
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) {}),
                      ),
                      const Text(Texts.rememberMe),
                    ],
                  ),

                  //* Forget password
                  TextButton(
                      onPressed: () {},
                      child: const Text(Texts.forgetPassword)),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //* Sign in button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      child: const Text(Texts.signIn))),
              const SizedBox(height: CustomSizes.spaceBetweenItems),

              //* Create account button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => const SignupScreen()),
                      child: const Text(Texts.createAccount))),
              const SizedBox(height: CustomSizes.spaceBetweenItems),
            ],
          ),
        ));
  }
}
