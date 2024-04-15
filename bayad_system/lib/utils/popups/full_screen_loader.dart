import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

//* A utility class for managing a full-screen loading dialog
class FullScreenLoader {
  /*
  Open a fullscreen loading dialog with a given text and animation.
  This method does not return anything.

  Parameters:
  - [String] text: The text to be displayed in the loading dialog.
  - [Lottie] animation: The animation to be displayed in the loading dialog.
  */

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!)
              ? CustomColors.dark
              : CustomColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250), //? Adjust as needed
              AnimationLoaderWidget(
                text: text,
                animation: animation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //* Stop the currently open loading dialog.
  //* This method does not return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); //? Close the dialog using the navigator
  }
}
