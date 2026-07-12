import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

class AnimaAidApp extends StatelessWidget {
  const AnimaAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimaAid',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: Scaffold(
        body: Center(
          child: Text(
            'AnimaAid',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}