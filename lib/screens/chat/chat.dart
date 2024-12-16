import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injoy/common/widgets/image/circular_image.dart';
import 'package:injoy/screens/chat/sub_screens/chat_details.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = CFSHelperFunctions.screenHeight();
    final width = CFSHelperFunctions.screenWidth();
    final dark = CFSHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "I N J O Y",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.048,
                fontFamily: "Inter"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () => {}, icon: const Icon(Icons.settings)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Text(
                  "Dev Suffian",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter"),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                decoration: InputDecoration(
                    hintText: "Search Chat User",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: dark
                            ? Colors.white.withOpacity(0.4)
                            : Colors.black.withOpacity(0.4)),
                    prefixIcon: const Icon(CupertinoIcons.search),
                    enabledBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: CFSColors.white))),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => ChatDetailsScreen()),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: const CFSCircularImage(size: 56,),
                          title: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dev Suffian",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              Text(
                                "Liked a message",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "8h",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: dark
                                    ? Colors.white.withOpacity(0.4)
                                    : Colors.black.withOpacity(0.4)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
