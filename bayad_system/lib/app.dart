import 'package:bayad_system/bindings/general_bindings.dart';
import 'package:bayad_system/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        home: const Scaffold(
            backgroundColor: CustomColors.primaryColor,
            body: Center(
                child: CircularProgressIndicator(
              color: CustomColors.white,
            ))));
  }
}
