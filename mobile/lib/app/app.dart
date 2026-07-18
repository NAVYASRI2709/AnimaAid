import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

class AnimaAidApp extends StatelessWidget {
  const AnimaAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AnimaAid',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}