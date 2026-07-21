import 'package:flutter/material.dart';

class AppSettingsService {
  AppSettingsService._();

  static final AppSettingsService instance = AppSettingsService._();

  final ValueNotifier<bool> notificationsEnabledNotifier =
      ValueNotifier<bool>(true);

  final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier<ThemeMode>(ThemeMode.system);

  final ValueNotifier<String> languageNotifier =
      ValueNotifier<String>('English');

  bool get notificationsEnabled => notificationsEnabledNotifier.value;

  ThemeMode get themeMode => themeModeNotifier.value;

  String get language => languageNotifier.value;

  void setNotificationsEnabled(bool value) {
    notificationsEnabledNotifier.value = value;
  }

  void setThemeMode(ThemeMode value) {
    themeModeNotifier.value = value;
  }

  void setLanguage(String value) {
    languageNotifier.value = value;
  }
}