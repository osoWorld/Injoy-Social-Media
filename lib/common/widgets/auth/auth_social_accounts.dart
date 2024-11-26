import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class AuthSocialAccounts extends StatelessWidget {
  const AuthSocialAccounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CFSHelperFunctions.isDarkMode(context);
    final height = CFSHelperFunctions.screenHeight();
    final width = CFSHelperFunctions.screenWidth();
    return Column(
      children: [
        Text(
          "Continue with Accounts",
          style: TextStyle(
              color: dark ? CFSColors.white : CFSColors.black,
              fontSize: width * 0.048,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: height * 0.030,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: width * 0.40,
              height: height * 0.08,
              decoration: BoxDecoration(
                color: CFSColors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Image.asset(
                    CFSImages.googleIcon,
                    height: 28,
                    width: 28,
                    color: CFSColors.blue,
                  )),
            ),
            Container(
              width: width * 0.40,
              height: height * 0.08,
              decoration: BoxDecoration(
                color: CFSColors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Image.asset(
                    CFSImages.facebookIcon,
                    height: 32,
                    width: 32,
                    color: CFSColors.blue,
                  )),
            ),
          ],
        )
      ],
    );
  }
}