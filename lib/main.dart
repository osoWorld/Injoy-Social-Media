import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/repositories/authenication/authentication_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  Get.put(AuthenticationRepository());

  runApp(const App());
}
