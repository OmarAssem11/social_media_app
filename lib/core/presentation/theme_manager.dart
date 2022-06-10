import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/color_manager.dart';
import 'package:social_media_app/core/presentation/font_manager.dart';
import 'package:social_media_app/core/presentation/styles_manager.dart';
import 'package:social_media_app/core/presentation/values_manager.dart';

ThemeData getAppTheme() => ThemeData(
      //Colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
      //Card
      cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),
      //AppBar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getRegularTextStyle(
          fontSize: FontSizeManager.s16,
          color: ColorManager.white,
        ),
      ),
      //Button
      buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary,
      ),
      //ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.s18,
          ),
          primary: ColorManager.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
          ),
        ),
      ),
      //Text
      textTheme: TextTheme(
        titleLarge: getLightTextStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s22,
        ),
        bodyLarge: getSemiBoldTextStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSizeManager.s16,
        ),
        bodyMedium: getMediumTextStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSizeManager.s14,
        ),
        bodySmall: getRegularTextStyle(
          color: ColorManager.grey,
        ),
      ),
      //InputDecoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularTextStyle(
          color: ColorManager.grey,
          fontSize: FontSizeManager.s14,
        ),
        labelStyle: getMediumTextStyle(
          color: ColorManager.grey,
          fontSize: FontSizeManager.s14,
        ),
        errorStyle: getRegularTextStyle(
          color: ColorManager.error,
          fontSize: FontSizeManager.s14,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
      ),
    );
