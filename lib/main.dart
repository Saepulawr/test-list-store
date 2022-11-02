import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'base/base.dart';
import 'base/config/scroll_behavior.dart';
import 'binding_controller.dart';
import 'modules/splash_screen/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //set potrait
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingControllers(),
      theme: BaseThemes(context).light,
      darkTheme: BaseThemes(context).dark,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const BaseConfigScrollBehavior(),
          child: child!,
        );
      },
    );
  }
}
