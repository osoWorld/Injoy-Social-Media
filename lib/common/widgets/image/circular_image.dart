import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';

class CFSCircularImage extends StatelessWidget {
  const CFSCircularImage(
      {super.key,
      this.size = 45,
      this.radius = 16,
      this.image = CFSImages.userIcon});

  final double size, radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: size,
        width: size,
      ),
    );
  }
}
