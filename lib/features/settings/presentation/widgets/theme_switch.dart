import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/color_manager.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:social_media_app/generated/l10n.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.s),
      child: Row(
        children: [
          const CircleAvatar(
            radius: Sizes.s16,
            backgroundColor: ColorManager.blueGray,
            child: Icon(
              Icons.dark_mode,
              size: Sizes.s28,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: Sizes.s16),
          Text(
            S.current.darkMode,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Switch.adaptive(
            value: cubit.isDark,
            onChanged: (_) => cubit.switchTheme(),
            activeColor: ColorManager.lightBlue,
          ),
        ],
      ),
    );
  }
}
