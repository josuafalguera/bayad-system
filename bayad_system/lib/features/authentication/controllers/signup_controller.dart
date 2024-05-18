import 'package:bayad_system/common/widgets/loaders/loaders.dart';
import 'package:bayad_system/data/repositories/authentication/authentication_repository.dart';
import 'package:bayad_system/data/repositories/user/user_repository.dart';
import 'package:bayad_system/features/authentication/models/user_model.dart';
import 'package:bayad_system/features/authentication/screens/signup/verify_email.dart';
import 'package:bayad_system/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //* Variables
  final hidePassword = true.obs; //* Observable for hiding/showing password
  final privacyPolicy = true.obs; //* Observable for privacy policy acceptance
  final email = TextEditingController(); //* Controller for email input
  final lastName = TextEditingController(); //* Controller for last name input
  final userName = TextEditingController(); //* Controller for username input
  final password = TextEditingController(); //* Controller for password input
  final firstName = TextEditingController(); //* Controller for first name input
  final phoneNumber =
      TextEditingController(); //* Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //* Form key for form validation

  //* Sign-up
  void signup() async {
    try {
      //* Start loading
      FullScreenLoader.openLoadingDialog(
          'Processing your information...', Images.docerAnimation);

      //* Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //* Remove Loader
        FullScreenLoader.stopLoading();
        return;
      }

      //* Form validation
      if (!signupFormKey.currentState!.validate()) {
        //* Remove Loader
        FullScreenLoader.stopLoading();
        return;
      }

      //* Privacy policy check
      if (!privacyPolicy.value) {
        Loaders.warningScackBar(
            title: 'Privacy Policy',
            message: 'Please accept the privacy policy to continue');
        return;
      }

      //* Register user in Firebase Authentication & save user data in Firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //* Save authenticated user data in Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository =
          UserRepository(); // Assuming UserRepository is singleton or properly managed by GetX
      await userRepository.saveUserRecord(newUser);

      //* Show success message
      Loaders.successSnackBar(
          title: 'Congratulations!',
          message:
              'Your account has been created successfully. Verify your email to continue.');

      //* Move to verify email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //* Remove Loader
      FullScreenLoader.stopLoading();

      //* Show generic error to the user
      Loaders.errorSnackBar(
          title: 'Oops!', message: 'An unexpected error occurred: $e');
    }
  }
}
