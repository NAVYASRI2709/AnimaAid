import 'package:flutter/material.dart';

class AppSettingsService {
  AppSettingsService._();

  static final AppSettingsService instance = AppSettingsService._();

  // General notifications
  final ValueNotifier<bool> notificationsEnabledNotifier =
      ValueNotifier<bool>(true);

  // Emergency notifications
  final ValueNotifier<bool> emergencyNotificationsEnabledNotifier =
      ValueNotifier<bool>(true);

  final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier<ThemeMode>(ThemeMode.system);

  final ValueNotifier<String> languageNotifier =
      ValueNotifier<String>('English');

  bool get notificationsEnabled => notificationsEnabledNotifier.value;

  bool get emergencyNotificationsEnabled =>
      emergencyNotificationsEnabledNotifier.value;

  ThemeMode get themeMode => themeModeNotifier.value;

  String get language => languageNotifier.value;

  void setNotificationsEnabled(bool value) {
    notificationsEnabledNotifier.value = value;
  }

  void setEmergencyNotificationsEnabled(bool value) {
    emergencyNotificationsEnabledNotifier.value = value;
  }

  void setThemeMode(ThemeMode value) {
    themeModeNotifier.value = value;
  }

  void setLanguage(String value) {
    languageNotifier.value = value;
  }
}