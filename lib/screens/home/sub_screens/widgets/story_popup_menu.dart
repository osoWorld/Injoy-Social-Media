import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/utils/constants/colors.dart';

class StoryPopupMenuWidget extends StatelessWidget {
  const StoryPopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: (value) {
        switch (value) {
          case 0:
            print("Report the story");
            break;
          case 1:
            print("Mute the story");
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 0,
          child: ListTile(
            leading: Icon(Icons.report_gmailerrorred_rounded, color: CFSColors.error,),
            title: Text('Report'),
          ),
        ),

        const PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Iconsax.volume_mute,),
            title: Text("Mute"),
          ),
        ),
      ],
    );
  }
}
