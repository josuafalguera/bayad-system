import 'package:bayad_system/common/widgets/loaders/loaders.dart';
import 'package:bayad_system/data/repositories/authentication/authentication_repository.dart';
import 'package:bayad_system/utils/constants/image_strings.dart';
import 'package:bayad_system/utils/helpers/network_manager.dart';
import 'package:bayad_system/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// -- Email and Password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'Logging you in...', Images.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Validate form
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save email and password if remember me is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login User using Email and Password Authentication
      final userCredentials =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Stop loading
      FullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
