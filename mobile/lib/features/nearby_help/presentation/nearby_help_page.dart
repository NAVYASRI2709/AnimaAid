import 'package:flutter/material.dart';

import '../../emergency_report/presentation/emergency_report_page.dart';
import '../../reports/presentation/welfare_report_page.dart';
import '../../shelters/presentation/shelters_page.dart';
import '../../vet_services/presentation/veterinary_services_page.dart';

class NearbyHelpPage extends StatelessWidget {
  const NearbyHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Help'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Find Help Near You',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Quickly find animal care, rescue and support services nearby.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          // Veterinary Services
          _buildCategoryCard(
            context,
            icon: Icons.local_hospital_outlined,
            title: 'Veterinary Services',
            description:
                'Find veterinary hospitals, clinics and animal healthcare.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VeterinaryServicesPage(),
                ),
              );
            },
          ),

          // Animal Shelters
          _buildCategoryCard(
            context,
            icon: Icons.home_work_outlined,
            title: 'Animal Shelters',
            description:
                'Discover animal shelters and their available locations.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SheltersPage(),
                ),
              );
            },
          ),

          // Animal Rescue & Welfare
          _buildCategoryCard(
            context,
            icon: Icons.volunteer_activism_outlined,
            title: 'Animal Rescue & Welfare',
            description:
                'Find rescue organizations and welfare support for animals in need.',
            onTap: () {
              _showRescueWelfareOptions(context);
            },
          ),

          // Pet Care Services
          _buildCategoryCard(
            context,
            icon: Icons.pets_outlined,
            title: 'Pet Care Services',
            description:
                'Find nearby animal-care and support services.',
            onTap: () {
              _showPetCareOptions(context);
            },
          ),

          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 30,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location-based Help',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Nearby services and distances will be shown using your location after maps and backend integration.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRescueWelfareOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rescue & Welfare Help',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),

                // Emergency Animal Rescue
                ListTile(
                  leading: const Icon(Icons.emergency_outlined),
                  title: const Text('Emergency Animal Rescue'),
                  subtitle: const Text(
                    'Get help for an animal requiring urgent rescue.',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EmergencyReportPage(),
                      ),
                    );
                  },
                ),

                // Animal Welfare Support
                ListTile(
                  leading:
                      const Icon(Icons.volunteer_activism_outlined),
                  title: const Text('Animal Welfare Support'),
                  subtitle: const Text(
                    'Find organizations supporting animal welfare.',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const WelfareReportPage(),
                      ),
                    );
                  },
                ),

                // Report an Animal Welfare Issue
                ListTile(
                  leading: const Icon(Icons.report_problem_outlined),
                  title: const Text('Report an Animal Welfare Issue'),
                  subtitle: const Text(
                    'Report concerns involving animal welfare.',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const WelfareReportPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPetCareOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pet Care Services',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),

                // Pet Boarding
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: const Text('Pet Boarding'),
                  subtitle: const Text(
                    'Find nearby pet boarding services.',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Pet boarding services will be available after location integration.',
                        ),
                      ),
                    );
                  },
                ),

                // Pet Grooming
                ListTile(
                  leading: const Icon(Icons.content_cut_outlined),
                  title: const Text('Pet Grooming'),
                  subtitle: const Text(
                    'Find nearby grooming services.',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Pet grooming services will be available after location integration.',
                        ),
                      ),
                    );
                  },
                ),

                // Pet Walking & Care
                ListTile(
                  leading: const Icon(Icons.directions_walk_outlined),
                  title: const Text('Pet Walking & Care'),
                  subtitle: const Text(
                    'Find pet walking and care support.',
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Pet walking and care services will be available after location integration.',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 26,
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(description),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}