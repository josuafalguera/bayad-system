import "package:bayad_system/features/authentication/screens/login/login.dart";
import "package:bayad_system/features/authentication/screens/onboarding/onboarding.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/services.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //* Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //* Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //* Function to show relevant screen
  screenRedirect() async {
    //Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
  /* --------------------------------- [Email & Password Sign in] --------------------------------- */
  //* [EmailAuthentication] - SignIn

  //* [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw 'There is an error in the formatting';
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //* [ReAuthenticate] - ReAuthenticate User

  //* [EmailVerication] - Mail Verification

  //* [EmailAuthentication] - Forget Password

  /* --------------------------------- [Federated identity & social sign-in] --------------------------------- */
  //* [GoogleAuthentication] - GOOGLE

  //* [FacebookAuthentication] - FACEBOOK

  /*--------------------------------- [.end Federated identity & social sign-in] --------------------------------- */
  //* [LogoutUser] - Valid for any authentication

  //* [DeleteUser] - Remove user Auth and Firestore account
}
