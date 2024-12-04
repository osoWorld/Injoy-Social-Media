import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/common/widgets/icon/circular_icon.dart';
import 'package:injoy/common/widgets/image/circular_image.dart';
import 'package:injoy/screens/home/controllers/post_feed_controller.dart';
import 'package:injoy/screens/home/widgets/post_comment.dart';
import 'package:injoy/screens/home/widgets/post_interaction.dart';
import 'package:injoy/screens/home/widgets/post_popup_menu.dart';
import 'package:lottie/lottie.dart';

import '../../../common/widgets/share/share.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class PostModule extends StatelessWidget {
  PostModule({super.key, required this.index});

  final int index;
  final PostFeedController controller = Get.find();

  void _handleDoubleTap() {
    controller.showLottieList[index].value = true;
    controller.isLiked[index].value = !controller.isLiked[index].value;

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
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
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
          const Card(
            elevation: 3,
            color: Colors.transparent,
            shadowColor: CFSColors.myGreyDarkMode,
            child: ListTile(
              leading: CFSCircularImage(),
              title: Text(
                "Blenderr Art",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "8h",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: Colors.white,
                ),
              ),
              trailing: PostPopupMenuWidget(),
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
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _handleDoubleTap();
                    },
                    child: Obx(
                      () {
                        return PostInteractionWidget(
                          isLiked: controller.isLiked[index].value,
                          text: "325",
                          forLikeIcon: true,
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        openCommentBottomSheet(context);
                      },
                      child: const PostInteractionWidget(
                        text: "98",
                        icon: Iconsax.messages_3,
                      )),
                  GestureDetector(
                    onTap: () {
                      openPostShareBottomSheet(context);
                    },
                    child: const PostInteractionWidget(
                      text: "",
                      icon: Iconsax.share,
                    ),
                  )
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
                : const SizedBox
                    .shrink(); // Empty widget when Lottie is not shown
          }),
        ],
      ),
    );
  }

  void openCommentBottomSheet(BuildContext context) {
    final dark = CFSHelperFunctions.isDarkMode(context);
    FocusNode commentFocusNode = FocusNode();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
          child: Column(
            children: [
              const Text(
                "Comments",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Inter"),
              ),
              const SizedBox(
                height: 22,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return const PostCommentWidget();
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          focusNode: commentFocusNode,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                              hintText: "Type Comment",
                              hintStyle: TextStyle(
                                  color: dark
                                      ? Colors.white.withOpacity(0.4)
                                      : Colors.black.withOpacity(0.4),
                                  fontSize: 14)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Iconsax.send_1,
                          color: CFSColors.blue,
                        )),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void openPostShareBottomSheet(BuildContext context) {
    final width = CFSHelperFunctions.screenWidth();
    final dark = CFSHelperFunctions.isDarkMode(context);

    controller.initializeTappingList(20);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Obx(
            () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    child: TextField(
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: dark
                                  ? Colors.white.withOpacity(0.4)
                                  : Colors.black.withOpacity(0.4),
                              fontSize: 14),
                          prefixIcon: const Icon(
                            Iconsax.search_normal,
                            size: 15,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      controller.isTapped[index].value =
                                          !controller.isTapped[index].value;
                                    },
                                    child: const CFSCircularImage(
                                      size: 65,
                                      radius: 40,
                                    )),
                                Obx(() {
                                  return controller.isTapped[index].value
                                      ? const Positioned(
                                          bottom: 1,
                                          right: 1,
                                          child: Icon(
                                            Iconsax.tick_circle5,
                                            color: CFSColors.blue,
                                          ),
                                        )
                                      : const SizedBox.shrink();
                                })
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Dev Suffian",
                              style: TextStyle(
                                  fontSize: 13.5,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (controller.isTapped.any((element) => element.value))
                    SizedBox(
                      width: width * 0.75,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform your action here
                        },
                        child: const Text("Send to Dev Suffian"),
                      ),
                    )
                  else
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CFSCircularIcon(size: 48, icon: Icons.share),
                        CFSCircularIcon(size: 48, icon: Iconsax.link),
                        CFSCircularIcon(size: 48, icon: Iconsax.story),
                      ],
                    )
                ],
              );
            },
          ),
        );
      },
    );
  }

  void postShareBottomSheet(BuildContext context, RxList<RxBool> isTapped) {
    final width = CFSHelperFunctions.screenWidth();
    final dark = CFSHelperFunctions.isDarkMode(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ShareBottomSheetWidget(
          isTapped: isTapped,
          isDarkMode: dark,
          screenWidth: width,
          onSendButtonPressed: () {
            // Handle send button action
            print("Send button pressed");
          },
          onGridItemTapped: (index) {
            isTapped[index].value = !isTapped[index].value;
          },
        );
      },
    );
  }
}
