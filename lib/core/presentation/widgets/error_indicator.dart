import 'package:flutter/material.dart';
import 'package:social_media_app/generated/l10n.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.current.somethingWentWrong,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
