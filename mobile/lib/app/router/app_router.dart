import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_shell.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return AppShell(
            child: const Placeholder(),
          );
        },
      ),
    ],
  );
}