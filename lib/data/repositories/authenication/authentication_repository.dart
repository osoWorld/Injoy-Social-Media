
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injoy/screens/authentication/signup.dart';
import 'package:injoy/screens/splash/splash_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on App Launch
  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    Get.to(const SignupScreen());
  }
}
