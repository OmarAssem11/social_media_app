import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/util/routes_manager.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen();

  @override
  Widget build(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
    return const Scaffold();
  }
}
