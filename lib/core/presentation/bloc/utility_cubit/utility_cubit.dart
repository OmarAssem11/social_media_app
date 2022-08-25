import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/data/constants/key_constants.dart';
import 'package:social_media_app/core/presentation/bloc/utility_cubit/utility_state.dart';

class UtilityCubit extends Cubit<UtilityState> {
  UtilityCubit() : super(UtilityInitial());

  Locale locale = KeyConstants.englishLocale;
  bool isDark = false;

  ThemeMode currentTheme() => isDark ? ThemeMode.dark : ThemeMode.light;

  Future<void> getCurrentTheme() async {}

  Future<void> switchTheme() async {}

  Future<void> getCurrentLocal() async {}

  Future<void> changeLocal() async {}
}
