import 'package:flutter/material.dart';

class SheltersPage extends StatelessWidget {
  const SheltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Shelters'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Find help near you',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Explore nearby animal shelters and welfare organizations.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            _buildShelterCard(
              context,
              name: 'Hope Animal Shelter',
              location: 'Chennai',
              distance: '2.4 km away',
            ),
            const SizedBox(height: 12),
            _buildShelterCard(
              context,
              name: 'Animal Care Center',
              location: 'Chennai',
              distance: '4.8 km away',
            ),
            const SizedBox(height: 12),
            _buildShelterCard(
              context,
              name: 'Paws Rescue Foundation',
              location: 'Chennai',
              distance: '6.2 km away',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShelterCard(
    BuildContext context, {
    required String name,
    required String location,
    required String distance,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.home_work_outlined,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(location),
                  const SizedBox(height: 4),
                  Text(
                    distance,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Contact options for $name coming soon.'),
                  ),
                );
              },
              icon: const Icon(Icons.phone_outlined),
              tooltip: 'Contact shelter',
            ),
          ],
        ),
      ),
    );
  }
}