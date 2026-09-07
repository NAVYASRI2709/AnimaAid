import 'package:flutter/material.dart';

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

          _buildCategoryCard(
            context,
            icon: Icons.local_hospital_outlined,
            title: 'Veterinary Services',
            description: 'Find veterinary hospitals, clinics and animal healthcare.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VeterinaryServicesPage(),
                ),
              );
            },
          ),

          _buildCategoryCard(
            context,
            icon: Icons.home_work_outlined,
            title: 'Animal Shelters',
            description: 'Discover animal shelters and their available locations.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SheltersPage(),
                ),
              );
            },
          ),

          _buildCategoryCard(
            context,
            icon: Icons.volunteer_activism_outlined,
            title: 'Animal Rescue & Welfare',
            description: 'Find organizations and people who can help animals in need.',
            onTap: () {},
          ),

          _buildCategoryCard(
            context,
            icon: Icons.pets_outlined,
            title: 'Pet Care Services',
            description: 'Find nearby animal-care and support services.',
            onTap: () {},
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