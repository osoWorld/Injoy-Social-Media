import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/common/widgets/image/circular_image.dart';
import 'package:injoy/screens/home/sub_screens/controllers/story_controller.dart';
import 'package:injoy/utils/constants/colors.dart';
import 'package:injoy/utils/constants/image_strings.dart';

import '../../../../common/widgets/icon/circular_icon.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SeeStoriesScreen extends StatelessWidget {
  SeeStoriesScreen({super.key});

  final storyController = Get.put(StoryController());
  final textController = TextEditingController(); // Manage text input
  String enteredText = "Send Message"; // Default text
  OverlayEntry? overlayEntry; // Reference to the overlay entry
  final focusNode = FocusNode();
  double dragOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final height = CFSHelperFunctions.screenHeight();
    final width = CFSHelperFunctions.screenWidth();
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (overlayEntry != null) {
          closeOverlay();
          return; // Do not go back yet
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: height * 0.035),
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.85,
                  width: width,
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                      child: Stack(
                        children: [
                          Image.asset(
                            CFSImages.wallpaper2,
                            width: width,
                            height: height,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 5,
                            right: 6,
                            left: 6,
                            child: LinearProgressIndicator(
                              value: 0.45,
                              minHeight: 2,
                              backgroundColor: Colors.white.withOpacity(0.4),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                CFSColors.blue,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 20,
                              left: 4,
                              right: 4,
                              child: Card(
                                elevation: 3,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                shadowColor:
                                    CFSColors.myGreyDarkMode.withOpacity(0.5),
                                child: Center(
                                  child: ListTile(
                                    leading: const CFSCircularImage(
                                      size: 45,
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Dev Suffian",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "4h",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                                    .withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: InkWell(
                                      onTap: () => {},
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Row(
                    children: [
                      Obx(
                        () {
                          return IconButton(
                              onPressed: () {
                                storyController.isLiked.value =
                                    !storyController.isLiked.value;
                              },
                              icon: Icon(
                                storyController.isLiked.value
                                    ? Iconsax.heart
                                    : Iconsax.heart5,
                                color: CFSColors.red,
                              ));
                        },
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showOverlayTextField(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border:
                                  Border.all(color: CFSColors.white, width: 1),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                enteredText,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            openPostShareBottomSheet(context);
                          },
                          icon: const Icon(Iconsax.send_2))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openPostShareBottomSheet(BuildContext context) {
    final width = CFSHelperFunctions.screenWidth();
    final dark = CFSHelperFunctions.isDarkMode(context);

    storyController.initializeTappingList(20);

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
                                      storyController.isTapped[index].value =
                                      !storyController
                                          .isTapped[index].value;
                                    },
                                    child: const CFSCircularImage(
                                      size: 65,
                                      radius: 40,
                                    )),
                                Obx(() {
                                  return storyController.isTapped[index].value
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
                  if (storyController.isTapped.any((element) => element.value))
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

  void showOverlayTextField(BuildContext context) {
    final overlay = Overlay.of(context);
    final focusNode = FocusNode();

    final animationController = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: Navigator.of(context)
    );

    final animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () async {
                closeOverlay();
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              left: 10,
              right: 10,
              child: Material(
                color: Colors.transparent,
                child: FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textController,
                            focusNode: focusNode,
                            style: const TextStyle(fontSize: 14),
                            onSubmitted: (value) {
                              enteredText = value.isNotEmpty ? value : "Send Message";
                              closeOverlay();
                            },
                            decoration: InputDecoration(
                                hintText: "Send Message",
                                hintStyle:
                                const TextStyle(fontSize: 14, color: Colors.white),
                                enabledBorder: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(24),
                                    borderSide: const BorderSide(
                                        width: 1, color: CFSColors.white)),
                                focusedBorder: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(24),
                                    borderSide: const BorderSide(
                                        width: 1, color: CFSColors.white))),
                          ),
                        ),
                        IconButton(onPressed: () => {}, icon: const Icon(Iconsax.send_1, color: CFSColors.blue,))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );

    overlay.insert(overlayEntry);
    animationController.forward().then((_) {
      focusNode.requestFocus();
    });

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        if (animationController.isAnimating ||
            animationController.status == AnimationStatus.dismissed) {
          return;
        }
        animationController.reverse().then((_) {
          overlayEntry?.remove();
          animationController.dispose();
        });
      }
    });
  }

  void closeOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
    focusNode.unfocus();
    enteredText = textController.text.isNotEmpty ? textController.text : "Send Message";
  }
}
