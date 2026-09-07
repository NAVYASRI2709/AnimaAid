```dart
import 'package:flutter/material.dart';

class AdoptionApplicationTrackingPage extends StatelessWidget {
  const AdoptionApplicationTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Application'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.pets,
                          size: 32,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Buddy',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Adoption Application'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Application ID: #AD-2048',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Submitted recently',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Application Progress',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _statusStep(
            title: 'Application Submitted',
            subtitle: 'Your adoption application has been submitted.',
            icon: Icons.check_circle_outline,
            isCompleted: true,
          ),

          _statusStep(
            title: 'Under Review',
            subtitle: 'The application is being reviewed.',
            icon: Icons.rate_review_outlined,
            isCompleted: true,
          ),

          _statusStep(
            title: 'Meet & Greet',
            subtitle: 'A meeting with the animal may be scheduled.',
            icon: Icons.handshake_outlined,
            isCurrent: true,
          ),

          _statusStep(
            title: 'Approved',
            subtitle: 'The adoption application will be approved after review.',
            icon: Icons.verified_outlined,
          ),

          _statusStep(
            title: 'Adoption Completed',
            subtitle: 'The animal has been successfully adopted.',
            icon: Icons.favorite_outline,
            showLine: false,
          ),

          const SizedBox(height: 20),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.notifications_none),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You will receive a notification when your application status changes.',
                      style: Theme.of(context).textTheme.bodyMedium,
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

  Widget _statusStep({
    required String title,
    required String subtitle,
    required IconData icon,
    bool isCompleted = false,
    bool isCurrent = false,
    bool showLine = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              icon,
              size: 28,
            ),
            if (showLine)
              Container(
                width: 2,
                height: 50,
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isCompleted || isCurrent
                            ? FontWeight.bold
                            : FontWeight.normal,
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
