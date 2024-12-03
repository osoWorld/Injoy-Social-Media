import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../add_post/add_post.dart';
import '../chat/chat.dart';
import '../home/home.dart';
import '../notification/notification.dart';
import '../profile/profile.dart';
import 'controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});

  final DashboardController bottomNavController = Get.put(DashboardController());

   // List of Screens
   final List<Widget> screens = [
     const HomeScreen(),
     const ChatScreen(),
     const AddPostScreen(),
     const NotificationScreen(),
     const ProfileScreen(),
   ];

   @override
  Widget build(BuildContext context) {
    final dark = CFSHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Obx(() {
        // Dynamically switch screens based on selectedIndex
        return screens[bottomNavController.selectedIndex.value];
      }),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: CFSColors.blue,
        buttonBackgroundColor: dark ? Colors.white : CFSColors.black,
        height: 60,
        items: <Widget>[
          Icon(Iconsax.home5, size: 30, color: dark ? CFSColors.black : CFSColors.white),
          Icon(Iconsax.message5, size: 30, color: dark ? CFSColors.black : CFSColors.white),
          Icon(Iconsax.additem5, size: 30, color: dark ? CFSColors.black : CFSColors.white),
          Icon(Iconsax.notification5, size: 30, color: dark ? CFSColors.black : CFSColors.white),
          Icon(Icons.person, size: 30, color: dark ? CFSColors.black : CFSColors.white),
        ],
        onTap: (index) {
          // Update the selected index
          bottomNavController.updateIndex(index);
        },
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
      ),
    );
  }
}
