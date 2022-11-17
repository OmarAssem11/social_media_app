import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState.initial() = Initial;
  const factory SettingsState.loading() = Loading;
  const factory SettingsState.reloadingTheme({required bool isDark}) =
      ReloadingTheme;
  const factory SettingsState.reloadingLocale(Locale locale) = ReloadingLocale;
  const factory SettingsState.changeState() = ChangeState;
  const factory SettingsState.error({required String message}) = Error;
}
