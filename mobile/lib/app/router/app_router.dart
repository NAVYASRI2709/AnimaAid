import 'package:go_router/go_router.dart';

import '../../features/adoption/presentation/adoption_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/rescue/presentation/rescue_page.dart';
import '../app_shell.dart';
import '../../features/ai_assistant/presentation/ai_assistant_page.dart';

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
      GoRoute(
        path: '/rescue',
        builder: (context, state) {
          return const AppShell(
            child: RescuePage(),
          );
        },
      ),
      GoRoute(
        path: '/adoption',
        builder: (context, state) {
          return const AppShell(
            child: AdoptionPage(),
          );
        },
      ),
      GoRoute(
        path: '/ai-assistant',
        builder: (context, state) {
          return const AppShell(
            child: AiAssistantPage(),
          );
        },
      ),
    ],
  );
}