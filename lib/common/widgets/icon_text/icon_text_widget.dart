import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Icon(icon, size: 20,),
            const SizedBox(width: 6,),
            Text(text, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w400),)
          ],
        ),
      );
  }
}
