import 'package:flutter/material.dart';

class AnimaAidApp extends StatelessWidget {
  const AnimaAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimaAid',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('AnimaAid'),
        ),
      ),
    );
  }
}