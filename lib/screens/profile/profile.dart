import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/common/widgets/icon/options.dart';
import 'package:injoy/common/widgets/image/circular_image.dart';
import 'package:injoy/utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, fontFamily: "Inter"),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CFSCircularImage(
                size: 95,
                radius: 40,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Developer Suffian",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "mainsuffian74@gmail.com",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                height: 40,
              ),
              OptionsWidget(icon: Iconsax.setting_2, optionText: "Preferences"),
            ],
          ),
        ),
      ),
    );
  }
}
