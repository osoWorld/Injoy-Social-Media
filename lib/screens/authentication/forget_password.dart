import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/back_icon/back_icon.dart';
import '../../utils/helpers/helper_functions.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = CFSHelperFunctions.screenHeight();
    final width = CFSHelperFunctions.screenWidth();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            const CFSAppbarBackPress(),
            SizedBox(
              height: height * 0.08,
            ),
            Text(
              "Forgotten your\nPassword",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: height * 0.018,
            ),
            Text(
              "Enter your registered email address to get a password reset link",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: width * 0.030
              ),
            ),
            SizedBox(
              height: height * 0.055,
            ),
            Form(
                child: Column(
                  children: [
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: "Enter Your Email",
                          prefixIcon: Icon(Iconsax.direct)),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => {}, child: const Text("Send Reset Link"))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
