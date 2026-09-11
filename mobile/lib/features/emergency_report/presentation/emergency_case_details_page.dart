```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'issue_resolved_page.dart';

class EmergencyCaseDetailsPage extends StatelessWidget {
  const EmergencyCaseDetailsPage({
    super.key,
    this.animalType = 'Unknown',
    this.severity = 'Unknown',
  });

  final String animalType;
  final String severity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Case'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.emergency_outlined,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Emergency Rescue Request',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your emergency rescue request has been received.',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Case Information',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.pets_outlined),
                    title: const Text('Animal Type'),
                    subtitle: Text(animalType),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.warning_amber_outlined),
                    title: const Text('Severity'),
                    subtitle: Text(severity),
                  ),
                  const Divider(height: 1),
                  const ListTile(
                    leading: Icon(Icons.confirmation_number_outlined),
                    title: Text('Case ID'),
                    subtitle: Text('#ER-1024'),
                  ),
                  const Divider(height: 1),
                  const ListTile(
                    leading: Icon(Icons.pending_actions_outlined),
                    title: Text('Status'),
                    subtitle: Text('Rescue Request Received'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Rescue Progress',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _timelineItem(
                      context,
                      icon: Icons.check_circle,
                      title: 'Emergency Request Submitted',
                      subtitle: 'Your request has been received.',
                      completed: true,
                    ),
                    _timelineItem(
                      context,
                      icon: Icons.search,
                      title: 'Rescue Team Reviewing',
                      subtitle:
                          'A rescue team is reviewing the request.',
                      completed: false,
                    ),
                    _timelineItem(
                      context,
                      icon: Icons.directions_car_outlined,
                      title: 'Rescue Team Dispatched',
                      subtitle:
                          'Rescue coordination will begin shortly.',
                      completed: false,
                    ),
                    _timelineItem(
                      context,
                      icon: Icons.home_outlined,
                      title: 'Rescue Completed',
                      subtitle:
                          'The rescue will be marked complete.',
                      completed: false,
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need Help?',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'You can communicate with people involved in the rescue and view the rescue location.',
                    ),
                    const SizedBox(height: 16),

                    // Live Chat
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Connect to the existing shared live chat route.
                        },
                        icon: const Icon(Icons.chat_outlined),
                        label: const Text('Open Live Chat'),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Rescue Location
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          context.go('/rescue-location');
                        },
                        icon: const Icon(
                          Icons.location_on_outlined,
                        ),
                        label: const Text('View Rescue Location'),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Issue Resolved
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const IssueResolvedPage(
                                caseId: '#ER-1024',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.check_circle_outline,
                        ),
                        label: const Text(
                          'Confirm Issue Resolved',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timelineItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool completed,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              icon,
              color: completed
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).disabledColor,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 42,
                color: Theme.of(context).dividerColor,
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
```
