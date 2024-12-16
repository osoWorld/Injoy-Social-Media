import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/common/widgets/icon/circular_icon.dart';
import 'package:injoy/common/widgets/image/circular_image.dart';
import 'package:injoy/screens/chat/sub_screens/controllers/chat_details_controller.dart';
import 'package:injoy/utils/constants/colors.dart';
import 'package:injoy/utils/constants/image_strings.dart';

import '../../../utils/helpers/helper_functions.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({super.key});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800)
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatDetailsController());
    final height = CFSHelperFunctions.screenHeight();
    final width = CFSHelperFunctions.screenWidth();
    final dark = CFSHelperFunctions.isDarkMode(context);

    void scrollToBottom() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        //     duration: const Duration(milliseconds: 45),
        //     curve: Curves.elasticOut);
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
    }

    // Scroll to the bottom when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.asset(
                CFSImages.wallpaper3,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Opacity(
                        opacity: _scaleAnimation.value,
                        child: Container(
                          height: height * 0.1,
                          width: width,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              color: dark
                                  ? CFSColors.darkContainer.withOpacity(0.1)
                                  : CFSColors.lightContainer.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const ListTile(
                                  leading: CFSCircularImage(),
                                  title: Text(
                                    "Dev Suffian",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "Online",
                                    style: TextStyle(
                                        fontSize: 13, fontWeight: FontWeight.w400),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CFSCircularIcon(size: 45, icon: Icons.call),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      CFSCircularIcon(size: 45, icon: Iconsax.video5)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: chatController.chatDummyList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment:
                              chatController.chatDummyList[index].isSender
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: Container(
                            width: width * 0.85,
                            decoration: BoxDecoration(
                                color: chatController
                                        .chatDummyList[index].isSender
                                    ? CFSColors.chatSend.withOpacity(0.93)
                                    : CFSColors.chatReceive.withOpacity(0.93),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                chatController.chatDummyList[index].message,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: dark ? Colors.white : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.elasticOut,
                  padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            color: dark
                                ? CFSColors.myGreyDarkMode
                                : CFSColors.myGreyLightMode),
                        child: IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Iconsax.more_2,
                              color: CFSColors.blue,
                            )),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            color: dark
                                ? CFSColors.myGreyDarkMode
                                : CFSColors.myGreyLightMode),
                        child: GestureDetector(
                          child: const Icon(
                            Iconsax.microphone_2,
                            color: CFSColors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Expanded(
                        child: TextField(),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            color: dark
                                ? CFSColors.myGreyDarkMode
                                : CFSColors.myGreyLightMode),
                        child: IconButton(
                            onPressed: () {
                              scrollToBottom();
                            },
                            icon: const Icon(
                              Iconsax.send_1,
                              color: CFSColors.blue,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingCard(bool dark, BuildContext context) {
    final height = CFSHelperFunctions.screenHeight();
    final width = CFSHelperFunctions.screenWidth();
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      color: dark ? CFSColors.blue.withOpacity(0.8) : Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Container(
          width: width * 0.9,
          height: height * 0.45,
          decoration: BoxDecoration(

          ),
        ),
      ),
    );
  }
}
