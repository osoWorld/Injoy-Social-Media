import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class StoryController extends GetxController with SingleGetTickerProviderMixin {
  static StoryController get instance => Get.find();

  final isTapped = <RxBool>[].obs;
  final isLiked = false.obs;
  var dragOffset = 0.0.obs; // Reactive drag offset
  final double dismissThreshold = 200.0; // Drag distance to dismiss the screen

  late AnimationController animationController;
  late Animation animation;
  var progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 6));

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)..addListener(() {
      progress.value = animation.value;
    },);

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void initializeTappingList(int itemCount) {
    isTapped.value = List.generate(itemCount, (_) => false.obs);
  }

  void updateDragOffset(double delta, double height) {
    dragOffset.value = (dragOffset.value + delta).clamp(0.0, height);
  }

  void handleDragEnd() {
    if (dragOffset.value > dismissThreshold) {
      Get.back(); // Dismiss the screen
    } else {
      dragOffset.value = 0.0; // Reset offset
    }
  }

// void openPostShareBottomSheet(BuildContext context) {
  //   final width = CFSHelperFunctions.screenWidth();
  //   final dark = CFSHelperFunctions.isDarkMode(context);
  //
  //   storyController.initializeTappingList(20);
  //
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
  //         child: Obx(
  //               () {
  //             return Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                   height: 45,
  //                   child: TextField(
  //                     style: const TextStyle(fontSize: 14),
  //                     decoration: InputDecoration(
  //                         hintText: "Search",
  //                         hintStyle: TextStyle(
  //                             color: dark
  //                                 ? Colors.white.withOpacity(0.4)
  //                                 : Colors.black.withOpacity(0.4),
  //                             fontSize: 14),
  //                         prefixIcon: const Icon(
  //                           Iconsax.search_normal,
  //                           size: 15,
  //                         )),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 16,
  //                 ),
  //                 Expanded(
  //                   child: GridView.builder(
  //                     itemCount: 20,
  //                     gridDelegate:
  //                     const SliverGridDelegateWithFixedCrossAxisCount(
  //                         crossAxisCount: 3,
  //                         mainAxisSpacing: 16,
  //                         crossAxisSpacing: 16),
  //                     itemBuilder: (context, index) {
  //                       return Column(
  //                         children: [
  //                           Stack(
  //                             children: [
  //                               GestureDetector(
  //                                   onTap: () {
  //                                     storyController.isTapped[index].value =
  //                                     !storyController
  //                                         .isTapped[index].value;
  //                                   },
  //                                   child: const CFSCircularImage(
  //                                     size: 65,
  //                                     radius: 40,
  //                                   )),
  //                               Obx(() {
  //                                 return storyController.isTapped[index].value
  //                                     ? const Positioned(
  //                                   bottom: 1,
  //                                   right: 1,
  //                                   child: Icon(
  //                                     Iconsax.tick_circle5,
  //                                     color: CFSColors.blue,
  //                                   ),
  //                                 )
  //                                     : const SizedBox.shrink();
  //                               })
  //                             ],
  //                           ),
  //                           const SizedBox(
  //                             height: 8,
  //                           ),
  //                           const Text(
  //                             "Dev Suffian",
  //                             style: TextStyle(
  //                                 fontSize: 13.5,
  //                                 overflow: TextOverflow.ellipsis),
  //                             maxLines: 1,
  //                           )
  //                         ],
  //                       );
  //                     },
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 12,
  //                 ),
  //                 if (storyController.isTapped.any((element) => element.value))
  //                   SizedBox(
  //                     width: width * 0.75,
  //                     child: ElevatedButton(
  //                       onPressed: () {
  //                         // Perform your action here
  //                       },
  //                       child: const Text("Send to Dev Suffian"),
  //                     ),
  //                   )
  //                 else
  //                   const Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       CFSCircularIcon(size: 48, icon: Icons.share),
  //                       CFSCircularIcon(size: 48, icon: Iconsax.link),
  //                       CFSCircularIcon(size: 48, icon: Iconsax.story),
  //                     ],
  //                   )
  //               ],
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
}