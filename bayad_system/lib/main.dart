import 'package:bayad_system/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

//* Entry point of the application
Future<void> main() async {
  // Todo: Add widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init local storage
  await GetStorage.init();

  // Todo: Await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize Firebase and Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const App());
}
