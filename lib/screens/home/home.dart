import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injoy/screens/home/sub_screens/stories/see_stories.dart';
import 'package:injoy/screens/home/widgets/post_feed.dart';
import 'package:injoy/utils/constants/image_strings.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import 'controllers/post_feed_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = CFSHelperFunctions.screenHeight();
    final width = CFSHelperFunctions.screenWidth();
    final controller = Get.put(PostFeedController());

    controller.initializeLottieList(10);

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
          IconButton(onPressed: () => {}, icon: const Icon(Icons.settings)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () => {},
                icon: const Icon(
                  CupertinoIcons.search,
                )),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.15,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child:
                                              Image.asset(CFSImages.userIcon),
                                        ),
                                        Positioned(
                                            bottom: 8,
                                            right: 8,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: CFSColors.blue),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Your Story",
                                      style: TextStyle(fontSize: width * 0.028),
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Get.to(() =>  SeeStoriesScreen());
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 75,
                                        width: 75,
                                        padding: const EdgeInsets.all(1),
                                        margin: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: CFSColors.blue,
                                                width: 3.5)),
                                        child: Image.asset(CFSImages.userIcon),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Dev Suffian".length > 10
                                            ? "Dev Suffian".substring(0, 10)
                                            : "Dev Suffian",
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PostModule(index: index);
              },
              childCount: 10,
            ))
          ],
        ),
      ),
    );
  }
}
