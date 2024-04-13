import 'package:flutter/material.dart';
import 'package:bayad_system/app.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:get/get.dart';
import 'firebase_options.dart';

//* Entry point of the application
Future<void> main() async {
  // Todo: Add widgets binding
  // Todo: Init local storage
  // Todo: Await native splash
  // Todo: Initialize Firebase

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Todo: Initialize Authentication

  runApp(const App());
}
