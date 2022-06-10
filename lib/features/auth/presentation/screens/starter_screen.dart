import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/routes_manager.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen();

  @override
  Widget build(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    return const Scaffold();
  }
}
