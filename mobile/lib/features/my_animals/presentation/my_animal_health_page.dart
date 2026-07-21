import 'package:flutter/material.dart';

class MyAnimalHealthPage extends StatelessWidget {
  const MyAnimalHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buddy Health Records'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Health Overview',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Keep Buddy’s important health information organized.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          _buildHealthCard(
            context,
            icon: Icons.vaccines_outlined,
            title: 'Vaccinations',
            subtitle: 'Track Buddy’s vaccination history.',
          ),
          const SizedBox(height: 12),
          _buildHealthCard(
            context,
            icon: Icons.medical_information_outlined,
            title: 'Medical History',
            subtitle: 'Review important medical information.',
          ),
          const SizedBox(height: 12),
          _buildHealthCard(
            context,
            icon: Icons.event_available_outlined,
            title: 'Upcoming Care',
            subtitle: 'Keep track of important care reminders.',
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Health record creation will be connected to backend storage.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Health Record'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}