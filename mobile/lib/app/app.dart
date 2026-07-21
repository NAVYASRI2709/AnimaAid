import 'package:flutter/material.dart';

import '../core/services/app_settings_service.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class AnimaAidApp extends StatelessWidget {
  const AnimaAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = AppSettingsService.instance;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: settings.themeModeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp.router(
          title: 'AnimaAid',
          theme: AppTheme.lightTheme,
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: themeMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}