import 'dart:async';

import 'package:bayad_system/common/widgets/loaders/loaders.dart';
import 'package:bayad_system/common/widgets/success_screen/success_screen.dart';
import 'package:bayad_system/data/repositories/authentication/authentication_repository.dart';
import 'package:bayad_system/utils/constants/image_strings.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen Appears & Set Timer For Auto Redirect.
  @override
  void onInit() {
    sendEmailVerificationLink();
    setTimeForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerificationLink() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: 'Email Sent!',
          message: 'Please check your email to verify your account.');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimeForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: Images.verifySucces,
            title: Texts.yourAccountCreatedTitle,
            subtitle: Texts.yourAccountCreatedSubtitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manually check if email verified
  checkEmailVerifiedStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: Images.verifySucces,
          title: Texts.yourAccountCreatedTitle,
          subtitle: Texts.yourAccountCreatedSubtitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
