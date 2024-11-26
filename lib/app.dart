import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injoy/utils/constants/colors.dart';
import 'package:injoy/utils/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: CFSAppTheme.lightTheme,
      darkTheme: CFSAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,

      ///  Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(
          backgroundColor: CFSColors.primary,
          body: Center(
            child: CircularProgressIndicator(
                color: CFSColors.white),
          )),
    );
  }
}
