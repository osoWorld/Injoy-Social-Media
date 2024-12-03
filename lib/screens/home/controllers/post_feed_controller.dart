
import 'package:get/get.dart';

class PostFeedController extends GetxController {

  static PostFeedController get instance => Get.find();

  final isLiked = <RxBool>[].obs;
  final showLottieList = <RxBool>[].obs;


  void initializeLottieList(int itemCount) {
    isLiked.value = List.generate(itemCount, (_) => false.obs);
    showLottieList.value = List.generate(itemCount, (_) => false.obs);
  }
}