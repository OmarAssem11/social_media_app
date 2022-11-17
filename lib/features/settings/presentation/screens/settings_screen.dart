import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/features/settings/presentation/widgets/locale_drop_down_button.dart';
import 'package:social_media_app/features/settings/presentation/widgets/theme_switch.dart';
import 'package:social_media_app/generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.l),
        child: Column(
          children: const [
            ThemeSwitch(),
            LocaleDropDownButton(),
          ],
        ),
      ),
    );
  }
}
