import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_page.dart';
import '../app_shell.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const AppShell(
            child: HomePage(),
          );
        },
      ),
    ],
  );
}