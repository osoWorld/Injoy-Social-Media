import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class CFSAppbarBackPress extends StatelessWidget {
  const CFSAppbarBackPress({
    super.key,
    this.onBackPressed,
  });

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    final dark = CFSHelperFunctions.isDarkMode(context);
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: CFSColors.white,
          boxShadow: [
            BoxShadow(
              color: dark
                  ? CFSColors.black.withOpacity(0.3)
                  : CFSColors.white.withOpacity(0.3), // Shadow color
              blurRadius: 20, // Spread of the shadow
              offset: const Offset(0, 10), // Position of the shadow
            ),
            BoxShadow(
              color: dark
                  ? CFSColors.white.withOpacity(0.05)
                  : CFSColors.black.withOpacity(0.05),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ]),
      child: IconButton(
          onPressed: onBackPressed,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: CFSColors.black,
          )),
    );
  }
}