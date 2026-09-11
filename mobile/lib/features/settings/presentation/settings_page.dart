import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/services/app_settings_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'AnimaAid',
      applicationVersion: '1.0.0',
      applicationLegalese:
          'AI-powered animal rescue and welfare platform.',
    );
  }

  void _showAppearanceDialog(
    BuildContext context,
    AppSettingsService settings,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: settings.themeModeNotifier,
          builder: (context, themeMode, _) {
            return AlertDialog(
              title: const Text('Appearance'),
              content: RadioGroup<ThemeMode>(
                groupValue: themeMode,
                onChanged: (value) {
                  if (value != null) {
                    settings.setThemeMode(value);
                    Navigator.pop(context);
                  }
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<ThemeMode>(
                      title: Text('System default'),
                      value: ThemeMode.system,
                    ),
                    RadioListTile<ThemeMode>(
                      title: Text('Light'),
                      value: ThemeMode.light,
                    ),
                    RadioListTile<ThemeMode>(
                      title: Text('Dark'),
                      value: ThemeMode.dark,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showLanguageDialog(
    BuildContext context,
    AppSettingsService settings,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return ValueListenableBuilder<String>(
          valueListenable: settings.languageNotifier,
          builder: (context, language, _) {
            return AlertDialog(
              title: const Text('Language'),
              content: RadioGroup<String>(
                groupValue: language,
                onChanged: (value) {
                  if (value != null) {
                    settings.setLanguage(value);
                    Navigator.pop(context);
                  }
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<String>(
                      title: Text('English'),
                      value: 'English',
                    ),
                    RadioListTile<String>(
                      title: Text('தமிழ்'),
                      value: 'Tamil',
                    ),
                    RadioListTile<String>(
                      title: Text('हिन्दी'),
                      value: 'Hindi',
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = AppSettingsService.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // General Notifications
          ValueListenableBuilder<bool>(
            valueListenable: settings.notificationsEnabledNotifier,
            builder: (context, notificationsEnabled, _) {
              return SwitchListTile(
                secondary: const Icon(
                  Icons.notifications_outlined,
                ),
                title: const Text('Notifications'),
                subtitle: const Text(
                  'Enable rescue and welfare notifications',
                ),
                value: notificationsEnabled,
                onChanged: settings.setNotificationsEnabled,
              );
            },
          ),

          const Divider(),

          // Emergency Notifications
          ValueListenableBuilder<bool>(
            valueListenable:
                settings.emergencyNotificationsEnabledNotifier,
            builder: (context, emergencyNotificationsEnabled, _) {
              return SwitchListTile(
                secondary: const Icon(
                  Icons.warning_amber_rounded,
                ),
                title: const Text('Emergency Alerts'),
                subtitle: const Text(
                  'Receive notifications for urgent emergency situations',
                ),
                value: emergencyNotificationsEnabled,
                onChanged:
                    settings.setEmergencyNotificationsEnabled,
              );
            },
          ),

          const Divider(),

          ValueListenableBuilder<ThemeMode>(
            valueListenable: settings.themeModeNotifier,
            builder: (context, themeMode, _) {
              return ListTile(
                leading: const Icon(Icons.palette_outlined),
                title: const Text('Appearance'),
                subtitle: Text(_themeModeLabel(themeMode)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () => _showAppearanceDialog(
                  context,
                  settings,
                ),
              );
            },
          ),

          const Divider(),

          ValueListenableBuilder<String>(
            valueListenable: settings.languageNotifier,
            builder: (context, language, _) {
              return ListTile(
                leading: const Icon(Icons.language_outlined),
                title: const Text('Language'),
                subtitle: Text(language),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () => _showLanguageDialog(
                  context,
                  settings,
                ),
              );
            },
          ),

          const Divider(),

          // Admin Dashboard
          ListTile(
            leading: const Icon(
              Icons.admin_panel_settings_outlined,
            ),
            title: const Text('Admin Dashboard'),
            subtitle: const Text(
              'Monitor and manage AnimaAid activity',
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () => context.go('/admin'),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About AnimaAid'),
            subtitle: const Text('Version 1.0.0'),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () => _showAboutDialog(context),
          ),
        ],
      ),
    );
  }

  static String _themeModeLabel(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return 'System default';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }
}