import 'package:bayad_system/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme, 
      darkTheme: AppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}