import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/utils/constants/image_strings.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CFSHelperFunctions.isDarkMode(context);
    final height = CFSHelperFunctions.screenHeight();
    final width = CFSHelperFunctions.screenWidth();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 38.0, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("I N J O Y", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Inter"),),
                Row(
                  children: [
                    IconButton(onPressed: () => {}, icon: const Icon(Icons.settings)),
                    IconButton(onPressed: () => {}, icon: const Icon(Iconsax.search_normal)),
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.01,),
            SizedBox(
              height: 85,
              child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 6, itemBuilder: (context, index) {
                return index == 0 ?
                    Stack(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: Image.asset(CFSImages.userIcon),
                        ),
                        Positioned(
                          bottom: 8,
                            right: 8,
                            child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CFSColors.blue
                          ),
                          child: const Icon(Icons.add),
                        ))
                      ],
                    )
                  : Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle
                  ),
                  child: Image.asset(CFSImages.userIcon),
                );
              },),
            ),
            SizedBox(height: height * 0.01,),
            ListView.builder(
              itemCount: 8,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: width,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Image.asset(CFSImages.wallpaper1, fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,),
                    Positioned(
                      top: 6,
                        child: ListTile(
                          leading: Image.asset(CFSImages.userIcon, height: 42, width: 42,),
                          title: const Text("Blenderr Art", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                          subtitle: const Text("8h", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          trailing: IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
                        )
                    ),
                  ],
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
  Widget postInteractItem(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon),
        
      ],
    );
  }
}
