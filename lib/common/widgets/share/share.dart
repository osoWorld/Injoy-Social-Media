import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ShareBottomSheetWidget extends StatelessWidget {
  const ShareBottomSheetWidget(
      {super.key,
      required this.isTapped,
      required this.isDarkMode,
      required this.screenWidth,
      required this.onSendButtonPressed,
      required this.onGridItemTapped});

  final RxList<RxBool> isTapped; // Controller list of tapped states
  final bool isDarkMode;
  final double screenWidth;

  final void Function() onSendButtonPressed; // Action for the Send button
  final void Function(int index)
      onGridItemTapped; // Action for each grid item tap

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: Obx(
            () {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Search TextField
              SizedBox(
                height: 45,
                child: TextField(
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.4)
                          : Colors.black.withOpacity(0.4),
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(Icons.search, size: 15),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // GridView
              Expanded(
                child: GridView.builder(
                  itemCount: isTapped.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () => onGridItemTapped(index),
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                    'assets/placeholder_user.png'),
                              ),
                            ),
                            Obx(() {
                              return isTapped[index].value
                                  ? const Positioned(
                                bottom: 1,
                                right: 1,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                ),
                              )
                                  : const SizedBox.shrink();
                            }),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Dev Suffian",
                          style: TextStyle(
                            fontSize: 13.5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              // Action Buttons
              if (isTapped.any((element) => element.value))
                SizedBox(
                  width: screenWidth * 0.75,
                  child: ElevatedButton(
                    onPressed: onSendButtonPressed,
                    child: const Text("Send to Dev Suffian"),
                  ),
                )
              else
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.share, size: 48),
                    Icon(Icons.link, size: 48),
                    Icon(Iconsax.story, size: 48),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
