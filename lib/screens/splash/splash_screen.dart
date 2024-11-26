import 'package:flutter/material.dart';
import 'package:injoy/utils/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CFSColors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
            Color(0xFF1A1A2E), // Darker color at the edges
            Color(0xFF2D2D44), // Slightly lighter at the center
          ], center: Alignment.center,
            radius: 0.8
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(), // Pushes the content to the center
            const Text(
              'INJOY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontFamily: "Inter"
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(), // Pushes the bottom text down
            Column(
              children: [
                Divider(
                  color: Colors.white,
                  thickness: 2,
                  indent: MediaQuery.of(context).size.width * 0.4,
                  endIndent: MediaQuery.of(context).size.width * 0.4,
                ),
                const SizedBox(height: 8),
                const Text(
                  'FROM INJOY',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24), // Bottom padding
          ],
        ),
      ),
    );
  }
}
