import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/data/constants/key_constants.dart';
import 'package:social_media_app/core/data/datasources/cache_helper.dart';
import 'package:social_media_app/core/presentation/bloc/utility_cubit/utility_state.dart';
import 'package:social_media_app/di/injector.dart';

class UtilityCubit extends Cubit<UtilityState> {
  UtilityCubit() : super(Initial());

  bool isDark = false;
  Locale locale = KeyConstants.englishLocale;

  ThemeMode currentTheme() => isDark ? ThemeMode.dark : ThemeMode.light;

  Future<void> getCurrentTheme() async {
    await getIt<CacheHelper>().has(KeyConstants.theme).then((hasToken) async {
      if (hasToken) {
        await getIt<CacheHelper>().get(KeyConstants.theme).then((value) async {
          isDark = value as bool;
        });
      } else {
        isDark = false;
      }
    });
    emit(const UtilityState.changeState());
  }

  Future<void> switchTheme() async {
    isDark = !isDark;
    await getIt<CacheHelper>().put(KeyConstants.theme, isDark);
    emit(UtilityState.reloadingTheme(isDark: isDark));
  }

  Future<void> getCurrentLocale() async {
    await getIt<CacheHelper>().has(KeyConstants.locale).then((hasToken) async {
      if (hasToken) {
        await getIt<CacheHelper>().get(KeyConstants.locale).then((value) async {
          value as String;
          locale = Locale.fromSubtags(
            languageCode: value.split('_').first,
            countryCode: value.split('_').last,
          );
        });
      } else {
        locale = KeyConstants.englishLocale;
      }
    });
    emit(const UtilityState.changeState());
  }

  Future<void> changeLocale(Locale lc) async {
    locale = lc;
    await getIt<CacheHelper>().put(KeyConstants.locale, locale.toString());
    emit(UtilityState.reloadingLocale(locale));
  }
}
