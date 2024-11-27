import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/screens/home/controllers/post_feed_controller.dart';
import 'package:injoy/screens/home/widgets/post_interaction.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class PostModule extends StatelessWidget {
  PostModule({super.key, required this.index});

  final int index;
  final PostFeedController controller = Get.find();



  void _handleDoubleTap() {
    controller.showLottieList[index].value = true;

    Timer(const Duration(seconds: 3), () {
      controller.showLottieList[index].value = false;
    });
  }

    @override
  Widget build(BuildContext context) {
    final width = CFSHelperFunctions.screenWidth();
    return Container(
      height: 380,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: InkWell(
              onDoubleTap: _handleDoubleTap,
              child: Image.asset(
                CFSImages.wallpaper3,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Card(
            elevation: 3,
            color: Colors.transparent,
            shadowColor: CFSColors.myGreyDarkMode,
            child: ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    CFSImages.userIcon,
                    fit: BoxFit.cover,
                    height: 45,
                    width: 45,
                  )),
              title: const Text("Blenderr Art", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white,),),
              subtitle: const Text("8h", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.white,),),
              trailing: const Icon(Icons.more_vert, color: Colors.white,),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
              decoration: BoxDecoration(
                color: CFSColors.myGreyDarkMode,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  PostInteractionWidget(isLiked: false, text: "325", forLikeIcon: true,),
                  PostInteractionWidget(text: "98", icon: Iconsax.messages_3,),
                  PostInteractionWidget(text: "", icon: Iconsax.direct_right,)
                ],
              ),
            ),
          ),

          // Lottie animation
          Obx(() {
            return controller.showLottieList[index].value
                ? Center(
              child: Lottie.asset(
                CFSImages.smallHeartsAnim,
                width: 300,
                height: 220,
                repeat: true,
              ),
            )
                : const SizedBox.shrink(); // Empty widget when Lottie is not shown
          }),
        ],
      ),
    );
  }
}