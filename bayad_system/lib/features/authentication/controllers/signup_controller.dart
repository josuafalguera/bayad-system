import 'package:bayad_system/common/widgets/loaders/loaders.dart';
import 'package:bayad_system/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //* Variables
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
  Future<void> signup() async {
    try {
      //* Start loading
      FullScreenLoader.openLoadingDialog(
          'We are processing your information...', Images.docerAnimation);

      //* Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //* Form validation
      if (signupFormKey.currentState!.validate()) return;

      //* Privacy policy check

      //* Register user in the Firebase Authentication & save user data in the Firebase

      //* Save authenticated user daya in the Firebase Firestore

      //* Show success message

      //* Move to verify email screen
    } catch (e) {
      //* Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //* Remove loader
      FullScreenLoader.stopLoading();
    }
  }
}
