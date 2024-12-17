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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CFSCircularImage(
                size: 95,
                radius: 40,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Developer Suffian",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "mainsuffian74@gmail.com",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const SizedBox(
                height: 40,
              ),
              const OptionsWidget(icon: Iconsax.user_tick, optionText: "Account"),
              const OptionsWidget(icon: Iconsax.setting_2, optionText: "Preferences"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Iconsax.grid_lock,
                      color: CFSColors.blue,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Account Security",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          const SizedBox(height: 14,),
                          Padding(
                            padding: const EdgeInsets.only(right: 80.0),
                            child: LinearProgressIndicator(
                              backgroundColor: CFSColors.blue.withOpacity(0.4),
                              color: CFSColors.blue,
                              value: 0.6,
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          const SizedBox(height: 14,),
                          const Text(
                            "Excellent",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const OptionsWidget(icon: Icons.help_outline_rounded, optionText: "Customer Support"),
              const OptionsWidget(icon: Iconsax.logout_1, optionText: "Logout")
            ],
          ),
        ),
      ),
    );
  }
}
