import 'package:go_router/go_router.dart';

import '../../features/adoption/presentation/adoption_page.dart';
import '../../features/ai_assistant/presentation/ai_assistant_page.dart';
import '../../features/animal_profile/presentation/animal_profile_page.dart';
import '../../features/breed_identification/presentation/breed_identification_page.dart';
import '../../features/disease_prediction/presentation/disease_prediction_page.dart';
import '../../features/donations/presentation/donations_page.dart';
import '../../features/emergency_report/presentation/emergency_report_page.dart';
import '../../features/favorites/presentation/favorites_page.dart';
import '../../features/first_aid/presentation/first_aid_page.dart';
import '../../features/found_pets/presentation/found_pets_page.dart';
import '../../features/health_records/presentation/health_record_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/missing_pets/presentation/missing_pets_page.dart';
import '../../features/my_animals/presentation/my_animal_health_page.dart';
import '../../features/my_animals/presentation/my_animal_profile_page.dart';
import '../../features/my_animals/presentation/my_animals_page.dart';
import '../../features/notifications/presentation/notifications_page.dart';
import '../../features/profile/presentation/profile_page.dart';
import '../../features/reports/presentation/found_pet_report_page.dart';
import '../../features/reports/presentation/missing_pet_report_page.dart';
import '../../features/rescue/presentation/rescue_location_page.dart';
import '../../features/rescue/presentation/rescue_page.dart';
import '../../features/rescue/presentation/rescue_tracking_page.dart';
import '../../features/settings/presentation/settings_page.dart';
import '../../features/shelters/presentation/shelter_location_page.dart';
import '../../features/symptom_checker/presentation/symptom_checker_page.dart';
import '../../features/volunteer/presentation/my_volunteer_activities_page.dart';
import '../../features/volunteer/presentation/volunteer_page.dart';
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
        path: '/report-missing-pet',
        builder: (context, state) {
          return const AppShell(
            child: MissingPetReportPage(),
          );
        },
      ),
      GoRoute(
        path: '/report-found-pet',
        builder: (context, state) {
          return const AppShell(
            child: FoundPetReportPage(),
          );
        },
      ),
      GoRoute(
        path: '/my-volunteer-activities',
        builder: (context, state) {
          return const AppShell(
            child: MyVolunteerActivitiesPage(),
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
  path: '/shelter-location',
  builder: (context, state) {
    return AppShell(
      child: ShelterLocationPage(
        name: state.uri.queryParameters['name'] ?? 'Shelter',
        location: state.uri.queryParameters['location'] ?? 'Unknown location',
        distance: state.uri.queryParameters['distance'] ??
            'Distance unavailable',
      ),
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
      GoRoute(
        path: '/profile',
        builder: (context, state) {
          return const AppShell(
            child: ProfilePage(),
          );
        },
      ),
      GoRoute(
        path: '/donate',
        builder: (context, state) {
          return const AppShell(
            child: DonationsPage(),
          );
        },
      ),
      GoRoute(
        path: '/disease-prediction',
        builder: (context, state) {
          return const AppShell(
            child: DiseasePredictionPage(),
          );
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) {
          return const AppShell(
            child: SettingsPage(),
          );
        },
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) {
          return const AppShell(
            child: NotificationsPage(),
          );
        },
      ),
      GoRoute(
        path: '/emergency-report',
        builder: (context, state) {
          return const AppShell(
            child: EmergencyReportPage(),
          );
        },
      ),
      GoRoute(
        path: '/my-animals',
        builder: (context, state) {
          return const AppShell(
            child: MyAnimalsPage(),
          );
        },
      ),
      GoRoute(
        path: '/my-animal-profile',
        builder: (context, state) {
          return AppShell(
            child: MyAnimalProfilePage(
              name: state.uri.queryParameters['name'] ?? 'Animal',
              species: state.uri.queryParameters['species'] ?? 'Unknown',
              breed: state.uri.queryParameters['breed'] ?? 'Unknown',
            ),
          );
        },
      ),
      GoRoute(
        path: '/my-animal-health',
        builder: (context, state) {
          return const AppShell(
            child: MyAnimalHealthPage(),
          );
        },
      ),
      GoRoute(
        path: '/first-aid',
        builder: (context, state) {
          return const AppShell(
            child: FirstAidPage(),
          );
        },
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) {
          return const AppShell(
            child: FavoritesPage(),
          );
        },
      ),
      GoRoute(
        path: '/symptom-checker',
        builder: (context, state) {
          return const AppShell(
            child: SymptomCheckerPage(),
          );
        },
      ),
      GoRoute(
        path: '/breed-identification',
        builder: (context, state) {
          return const AppShell(
            child: BreedIdentificationPage(),
          );
        },
      ),
      GoRoute(
        path: '/rescue-location',
        builder: (context, state) {
          return const RescueLocationPage();
        },
      ),
      GoRoute(
        path: '/rescue-tracking',
        builder: (context, state) {
          return const RescueTrackingPage();
        },
      ),
    ],
  );
}