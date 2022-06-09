import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/color_manager.dart';

ThemeData getAppTheme() => ThemeData(
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
    );
