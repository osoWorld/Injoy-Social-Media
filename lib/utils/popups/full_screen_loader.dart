import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialogue.
class CFSFullScreenLoader {
  /// Open a full-screen loading dialogue with a given text and animation
  /// This method doesn't return anything.
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialogue.
  ///   - animation: The Lottie animation to be shown.

  static void openLoadingDialogue(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
        barrierDismissible: false,  // This dialog can't be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false,  // Disable popping with the back button
            child: Container(
              color: CFSHelperFunctions.isDarkMode(Get.context!) ? CFSColors.dark : CFSColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,),   // Adjust the spacing as needed
                  CFSAnimationLoaderWidget(text: text, animation: animation)
                ],
              ),
            )));
  }

  /// Stop the currently ope loading dialog.
  /// This method does not return anything.
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();  // Close the dialog using the Navigator
  }
}