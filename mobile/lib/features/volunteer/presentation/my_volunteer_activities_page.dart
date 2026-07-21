import 'package:flutter/material.dart';

class MyVolunteerActivitiesPage extends StatelessWidget {
  const MyVolunteerActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Volunteer Activities'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'My Activities',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Track your assigned and completed volunteer activities.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text(
              'Currently Assigned',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _ActivityCard(
              title: 'Weekend Animal Rescue Support',
              location: 'Chennai',
              date: 'Assigned activity',
              status: 'Currently Assigned',
              icon: Icons.assignment_ind_outlined,
            ),
            const SizedBox(height: 24),
            Text(
              'Completed Activities',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _ActivityCard(
              title: 'Community Pet Care Drive',
              location: 'Chennai',
              date: 'Completed',
              status: 'Completed',
              icon: Icons.check_circle_outline,
            ),
            const SizedBox(height: 12),
            _ActivityCard(
              title: 'Animal Awareness Campaign',
              location: 'Chennai',
              date: 'Completed',
              status: 'Completed',
              icon: Icons.check_circle_outline,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({
    required this.title,
    required this.location,
    required this.date,
    required this.status,
    required this.icon,
  });

  final String title;
  final String location;
  final String date;
  final String status;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(top: 8),
          child: Text('$location\n$date'),
        ),
        isThreeLine: true,
        trailing: Text(
          status,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}