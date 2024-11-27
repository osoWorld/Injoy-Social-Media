import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/back_icon/back_icon.dart';
import '../../utils/helpers/helper_functions.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = CFSHelperFunctions.screenHeight();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CFSAppbarBackPress(),
            SizedBox(
              height: height * 0.1,
            ),
            Text(
              "Forgotten your\nPassword",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Text(
              "Enter your registered email address to get a password reset link",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: height * 0.04,
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
