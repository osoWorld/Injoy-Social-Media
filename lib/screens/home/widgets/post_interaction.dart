import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/utils/constants/colors.dart';

class PostInteractionWidget extends StatelessWidget {
  const PostInteractionWidget(
      {super.key,
      this.isLiked = false,
      this.forLikeIcon = false,
      required this.text,
      this.icon = Iconsax.heart,
     });

  final bool isLiked, forLikeIcon;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          forLikeIcon ?
          isLiked
              ? const Icon(
            Iconsax.heart5,
            color: CFSColors.red,
            size: 28,
          )
              : const Icon(
            Iconsax.heart,
            color: CFSColors.red,
            size: 28,
          ) :
           Icon(
                  icon,
                  color: CFSColors.white,
                  size: 28,
                ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
          )
        ],
      ),
    );
  }
}
