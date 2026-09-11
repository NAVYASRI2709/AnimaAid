import 'package:go_router/go_router.dart';

import '../../features/adoption/presentation/adoption_page.dart';
import '../../features/adoption/presentation/adoption_application_page.dart';
import '../../features/adoption/presentation/adoption_application_tracking_page.dart';
import '../../features/adoption/presentation/adoption_listing_status_page.dart';
import '../../features/adoption/presentation/adoption_matching_page.dart';
import '../../features/adoption/presentation/list_animal_for_adoption_page.dart';

import '../../features/ai_assistant/presentation/ai_assistant_page.dart';
import '../../features/animal_profile/presentation/animal_profile_page.dart';
import '../../features/auth/presentation/auth_page.dart';
import '../../features/auth/presentation/forgot_password_page.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/signup_page.dart';

import '../../features/breed_identification/presentation/breed_identification_page.dart';
import '../../features/chat/presentation/shared_chat_page.dart';
import '../../features/community/presentation/community_page.dart';
import '../../features/disease_prediction/presentation/disease_prediction_page.dart';
import '../../features/donations/presentation/donations_page.dart';

import '../../features/emergency_report/presentation/emergency_case_details_page.dart';
import '../../features/emergency_report/presentation/emergency_report_page.dart';
import '../../features/emergency_report/presentation/issue_resolved_page.dart';

import '../../features/favorites/presentation/favorites_page.dart';
import '../../features/first_aid/presentation/first_aid_page.dart';
import '../../features/found_pets/presentation/found_pets_page.dart';
import '../../features/health_records/presentation/health_record_page.dart';
import '../../features/help_support/presentation/help_support_page.dart';
import '../../features/home/presentation/home_page.dart';

import '../../features/missing_pets/presentation/missing_pets_page.dart';
import '../../features/my_animals/presentation/my_animal_health_page.dart';
import '../../features/my_animals/presentation/my_animal_profile_page.dart';
import '../../features/my_animals/presentation/my_animals_page.dart';

import '../../features/nearby_help/presentation/nearby_help_page.dart';
import '../../features/notifications/presentation/notifications_page.dart';

import '../../features/profile/presentation/profile_page.dart';

import '../../features/reports/presentation/found_pet_report_page.dart';
import '../../features/reports/presentation/missing_pet_report_page.dart';
import '../../features/reports/presentation/report_details_page.dart';

import '../../features/rescue/presentation/rescue_location_page.dart';
import '../../features/rescue/presentation/rescue_page.dart';
import '../../features/rescue/presentation/rescue_tracking_page.dart';

import '../../features/search/presentation/search_page.dart';
import '../../features/settings/presentation/settings_page.dart';

import '../../features/shelters/presentation/shelter_location_page.dart';
import '../../features/shelters/presentation/shelters_page.dart';

import '../../features/symptom_checker/presentation/symptom_checker_page.dart';

import '../../features/vet_services/presentation/veterinary_services_page.dart';

import '../../features/volunteer/presentation/my_volunteer_activities_page.dart';
import '../../features/volunteer/presentation/volunteer_page.dart';

import '../../features/admin/presentation/admin_activity_page.dart';
import '../../features/admin/presentation/admin_dashboard_page.dart';
import '../../features/admin/presentation/admin_messages_page.dart';
import '../../features/emergency_notifications/presentation/emergency_notifications_page.dart';


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

      // Authentication
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupPage(),
      ),

      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),

      // Shared live chat
      GoRoute(
        path: '/chat',
        builder: (context, state) => const SharedChatPage(),
      ),

      // Global search
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchPage(),
      ),

      // Help & Support
      GoRoute(
        path: '/help-support',
        builder: (context, state) => const HelpSupportPage(),
      ),

      // Admin
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminDashboardPage(),
      ),

      GoRoute(
        path: '/admin/messages',
        builder: (context, state) => const AdminMessagesPage(),
      ),

      GoRoute(
        path: '/admin/activity',
        builder: (context, state) => const AdminActivityPage(),
      ),

      // Reports
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
  path: '/emergency-notifications',
  builder: (context, state) =>
      const EmergencyNotificationsPage(),
),

      GoRoute(
        path: '/report-details',
        builder: (context, state) {
          final reportType =
              state.uri.queryParameters['type'] ?? 'Other Issue';

          return AppShell(
            child: ReportDetailsPage(
              reportType: reportType,
            ),
          );
        },
      ),

      // Veterinary services
      GoRoute(
        path: '/veterinary-services',
        builder: (context, state) {
          return const AppShell(
            child: VeterinaryServicesPage(),
          );
        },
      ),

      // Emergency
      GoRoute(
        path: '/emergency-report',
        builder: (context, state) {
          return const AppShell(
            child: EmergencyReportPage(),
          );
        },
      ),

      GoRoute(
        path: '/emergency-case-details',
        builder: (context, state) {
          final animalType =
              state.uri.queryParameters['animal'] ?? 'Unknown';

          final severity =
              state.uri.queryParameters['severity'] ?? 'Unknown';

          return AppShell(
            child: EmergencyCaseDetailsPage(
              animalType: animalType,
              severity: severity,
            ),
          );
        },
      ),

      GoRoute(
        path: '/issue-resolved',
        builder: (context, state) {
          return const AppShell(
            child: IssueResolvedPage(),
          );
        },
      ),

      // Adoption
      GoRoute(
        path: '/adoption-application',
        builder: (context, state) {
          final animalName =
              state.uri.queryParameters['name'] ?? 'Buddy';

          return AppShell(
            child: AdoptionApplicationPage(
              animalName: animalName,
            ),
          );
        },
      ),

      GoRoute(
        path: '/adoption-application-tracking',
        builder: (context, state) {
          return const AppShell(
            child: AdoptionApplicationTrackingPage(),
          );
        },
      ),

      GoRoute(
        path: '/adoption-listing-status',
        builder: (context, state) {
          return const AppShell(
            child: AdoptionListingStatusPage(),
          );
        },
      ),

      GoRoute(
        path: '/adoption-matching',
        builder: (context, state) {
          return const AppShell(
            child: AdoptionMatchingPage(),
          );
        },
      ),

      GoRoute(
        path: '/list-animal-for-adoption',
        builder: (context, state) {
          return const AppShell(
            child: ListAnimalForAdoptionPage(),
          );
        },
      ),

      // Volunteer
      GoRoute(
        path: '/volunteer',
        builder: (context, state) {
          return const AppShell(
            child: VolunteerPage(),
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

      // AI
      GoRoute(
        path: '/ai-assistant',
        builder: (context, state) {
          return const AppShell(
            child: AiAssistantPage(),
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
        path: '/disease-prediction',
        builder: (context, state) {
          return const AppShell(
            child: DiseasePredictionPage(),
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

      // Missing / Found pets
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

      // Shelters
      GoRoute(
        path: '/shelters',
        builder: (context, state) {
          return const AppShell(
            child: SheltersPage(),
          );
        },
      ),

      GoRoute(
        path: '/shelter-location',
        builder: (context, state) {
          return AppShell(
            child: ShelterLocationPage(
              name: state.uri.queryParameters['name'] ?? 'Shelter',
              location:
                  state.uri.queryParameters['location'] ??
                      'Unknown location',
              distance:
                  state.uri.queryParameters['distance'] ??
                      'Distance unavailable',
            ),
          );
        },
      ),

      // Animals
      GoRoute(
        path: '/animal-profile',
        builder: (context, state) {
          return AppShell(
            child: AnimalProfilePage(
              name: state.uri.queryParameters['name'] ?? 'Buddy',
            ),
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
              species:
                  state.uri.queryParameters['species'] ?? 'Unknown',
              breed:
                  state.uri.queryParameters['breed'] ?? 'Unknown',
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
        path: '/health-records',
        builder: (context, state) {
          return const AppShell(
            child: HealthRecordsPage(),
          );
        },
      ),

      // Rescue location and tracking
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

      // Nearby help
      GoRoute(
        path: '/nearby-help',
        builder: (context, state) {
          return const AppShell(
            child: NearbyHelpPage(),
          );
        },
      ),

      // Community
      GoRoute(
        path: '/community',
        builder: (context, state) {
          return const AppShell(
            child: CommunityPage(),
          );
        },
      ),

      // Profile and settings
      GoRoute(
        path: '/profile',
        builder: (context, state) {
          return const AppShell(
            child: ProfilePage(),
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

      // Notifications
      GoRoute(
        path: '/notifications',
        builder: (context, state) {
          return const AppShell(
            child: NotificationsPage(),
          );
        },
      ),

      // Donations
      GoRoute(
        path: '/donate',
        builder: (context, state) {
          return const AppShell(
            child: DonationsPage(),
          );
        },
      ),

      // First aid
      GoRoute(
        path: '/first-aid',
        builder: (context, state) {
          return const AppShell(
            child: FirstAidPage(),
          );
        },
      ),

      // Favorites
      GoRoute(
        path: '/favorites',
        builder: (context, state) {
          return const AppShell(
            child: FavoritesPage(),
          );
        },
      ),
    ],
  );
}