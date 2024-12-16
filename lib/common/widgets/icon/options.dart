import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget(
      {super.key,
      required this.icon,
      this.color = CFSColors.blue,
      required this.optionText});

  final IconData icon;
  final Color color;
  final String optionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              optionText,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 22,)
        ],
      ),
    );
  }
}
