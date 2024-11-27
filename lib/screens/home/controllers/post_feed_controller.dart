import 'dart:async';

import 'package:get/get.dart';

class PostFeedController extends GetxController {

  static PostFeedController get instance => Get.find();

  var showLottie = false.obs;

  final showLottieList = <RxBool>[].obs;

  void initializeLottieList(int itemCount) {
    showLottieList.value = List.generate(itemCount, (_) => false.obs);
  }
}