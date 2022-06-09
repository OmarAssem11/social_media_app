import 'package:flutter/material.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
