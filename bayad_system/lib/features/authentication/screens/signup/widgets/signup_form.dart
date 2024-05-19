import 'package:bayad_system/features/authentication/controllers/signup/signup_controller.dart';
import 'package:bayad_system/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:bayad_system/utils/validators/validation.dart';
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
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: controller.firstName,
                validator: (value) =>
                    Validator.validateEmptyText('First name', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: Texts.firstName, prefixIcon: Icon(Iconsax.user)),
              )),
              const SizedBox(width: CustomSizes.spaceBetweenInputFields),
              Expanded(
                  child: TextFormField(
                controller: controller.lastName,
                validator: (value) =>
                    Validator.validateEmptyText('Last name', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: Texts.lastName, prefixIcon: Icon(Iconsax.user)),
              )),
            ],
          ),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields),

          //* Username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                Validator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
                labelText: Texts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields),

          //* Email
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: Texts.email, prefixIcon: Icon(Iconsax.direct)),
          ),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields),

          //* Phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => Validator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: Texts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields),

          //* Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => Validator.validatePassword(value),
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

          const SizedBox(height: CustomSizes.spaceBetweenSections),

          //* Terms and conditions checkbox
          TermsAndConditionCheckbox(dark: dark),

          const SizedBox(height: CustomSizes.spaceBetweenSections),

          //* Sign up button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(Texts.createAccount))),
        ],
      ),
    );
  }
}
