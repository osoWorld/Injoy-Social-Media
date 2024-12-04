import 'package:flutter/material.dart';
import 'package:injoy/utils/constants/colors.dart';

class PostPopupMenuWidget extends StatelessWidget {
  const PostPopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onSelected: (value) {
          switch (value) {
            case 0:
            // Handle "Save Post"
              print("Save Post tapped for Post ");
              break;
            case 1:
            // Handle "Turn on notifications"
              print("Turn on notifications tapped for Post ");
              break;
            case 2:
            // Handle "Hide Post"
              print("Hide Post tapped for Post ");
              break;
            case 3:
            // Handle "Unfollow"
              print("Unfollow tapped for Post ");
              break;
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 0,
            child: ListTile(
              leading: Icon(Icons.bookmark, color: CFSColors.blue),
              title: Text('Save Post'),
            ),
          ),
          const PopupMenuItem(
            value: 1,
            child: ListTile(
              leading: Icon(Icons.unpublished_outlined),
              title: Text('UnFollow'),
            ),
          ),
        ],
    );
  }
}
