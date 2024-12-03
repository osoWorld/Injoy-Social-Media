import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class CFSCircularIcon extends StatelessWidget {
  const CFSCircularIcon({super.key, required this.size, required this.icon, this.onPressed});

  final double size;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = CFSHelperFunctions.isDarkMode(context);
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dark ? CFSColors.myGreyDarkMode : CFSColors.myGreyLightMode
      ),
      child: Center(
        child: IconButton(onPressed: onPressed, icon: Icon(icon, color: dark ? Colors.white : CFSColors.black,)),
      ),
    );
  }
}
