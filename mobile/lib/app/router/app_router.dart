import 'package:go_router/go_router.dart';

import '../../features/adoption/presentation/adoption_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/rescue/presentation/rescue_page.dart';
import '../app_shell.dart';
import '../../features/ai_assistant/presentation/ai_assistant_page.dart';
import '../../features/missing_pets/presentation/missing_pets_page.dart';
import '../../features/found_pets/presentation/found_pets_page.dart';
import '../../features/shelters/presentation/shelters_page.dart';
import '../../features/animal_profile/presentation/animal_profile_page.dart';
import '../../features/health_records/presentation/health_record_page.dart';
import '../../features/volunteer/presentation/volunteer_page.dart';


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
      GoRoute(
        path: '/missing-pets',
        builder: (context, state) {
          return const AppShell(
            child: MissingPetsPage(),
          );
        },
      ),
      GoRoute(
        path: '/found-pets',
        builder: (context, state) {
          return const AppShell(
            child: FoundPetsPage(),
          );
        },
      ),
      GoRoute(
        path: '/shelters',
        builder: (context, state) {
          return const AppShell(
            child: SheltersPage(),
          );
        },
      ),
      GoRoute(
        path: '/animal-profile',
        builder: (context, state) {
          return const AppShell(
            child: AnimalProfilePage(),
          );
        },
      ),
      GoRoute(
        path: '/health-records',
        builder: (context, state) {
          return const AppShell(
            child: HealthRecordsPage(),
          );
        },
      ),
      GoRoute(
        path: '/volunteer',
        builder: (context, state) {
          return const AppShell(
            child: VolunteerPage(),
          );
        },
      ),
    ],
  );
}