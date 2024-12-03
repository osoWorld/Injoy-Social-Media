import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/common/widgets/icon_text/icon_text_widget.dart';
import 'package:injoy/common/widgets/image/circular_image.dart';

class PostCommentWidget extends StatelessWidget {
  const PostCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CFSCircularImage(
                  size: 34,
                  radius: 20,
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Blenderr Art",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a laoreet tortor. Pellentesque habitant morbi",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.4)
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconTextWidget(icon: Icons.compare_arrows_rounded, text: "4 replies"),
                            IconTextWidget(icon: Iconsax.clock, text: "5 min ago"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              height: 1,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}