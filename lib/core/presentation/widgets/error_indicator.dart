import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/resources/strings_manager.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.somethingWentWrong,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
