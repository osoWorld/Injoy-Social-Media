import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  // Function to update the selected index
  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}