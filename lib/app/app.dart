import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/routes_manager.dart';
import 'package:social_media_app/core/presentation/strings_manager.dart';
import 'package:social_media_app/core/presentation/theme_manager.dart';

class MyApp extends StatefulWidget {
  factory MyApp() => instance;

  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
    );
  }
}
