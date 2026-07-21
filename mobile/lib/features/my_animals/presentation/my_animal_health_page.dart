import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                child: Icon(Icons.health_and_safety_outlined),
              ),
              title: const Text(
                'Complete Health Records',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  'Manage vaccinations, medical history, medications, '
                  'veterinary visits, age, and other health information.',
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/health-records'),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.vaccines_outlined),
              title: const Text('Vaccinations'),
              subtitle: const Text(
                'Track Buddy’s vaccination history.',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/health-records'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.medical_information_outlined),
              title: const Text('Medical History'),
              subtitle: const Text(
                'Review important medical information.',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/health-records'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.event_available_outlined),
              title: const Text('Upcoming Care'),
              subtitle: const Text(
                'Keep track of important care reminders.',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/health-records'),
            ),
          ),
        ],
      ),
    );
  }
}