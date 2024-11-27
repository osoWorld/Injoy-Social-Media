import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:injoy/screens/authentication/login.dart';
import 'package:injoy/screens/dashboard/dashboard.dart';

import '../../common/widgets/auth/auth_social_accounts.dart';
import '../../common/widgets/back_icon/back_icon.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CFSHelperFunctions.isDarkMode(context);
    final height = CFSHelperFunctions.screenHeight();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 38),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CFSAppbarBackPress(),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Text(
                    "Create your\nAccount",
                    style: Theme.of(context).textTheme.headlineLarge,
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
                            labelText: "Full Name",
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: "Enter Your Email",
                            prefixIcon: Icon(Iconsax.direct)),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        expands: false,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                                onPressed: () => {},
                                icon: const Icon(Iconsax.eye_slash))),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => DashboardScreen()), child: const Text("Register"))),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Already Have An Account?",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                       InkWell(
                         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                         child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: CFSColors.blue,
                              fontSize: 21,
                              fontWeight: FontWeight.w600),
                         ),
                       ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                ],
              ),
            ),
            Divider(
              color: dark ? CFSColors.white : CFSColors.myGreyDarkMode,
              thickness: 1,
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 38),
              child: AuthSocialAccounts(),
            ),
          ],
        ),
      ),
    );
  }
}

