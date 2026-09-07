```dart
import 'package:flutter/material.dart';

class AdoptionListingStatusPage extends StatelessWidget {
  const AdoptionListingStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Listing Status'),
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
                            Text('Dog • Male'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.pending_outlined),
                        SizedBox(width: 10),
                        Text(
                          'Under Review',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Listing Progress',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _statusStep(
            title: 'Listing Submitted',
            subtitle: 'Your adoption listing was submitted.',
            icon: Icons.check_circle_outline,
            isCompleted: true,
          ),

          _statusStep(
            title: 'Under Review',
            subtitle: 'The listing is being reviewed.',
            icon: Icons.rate_review_outlined,
            isCompleted: false,
            isCurrent: true,
          ),

          _statusStep(
            title: 'Approved',
            subtitle: 'The listing will be approved after review.',
            icon: Icons.verified_outlined,
            isCompleted: false,
          ),

          _statusStep(
            title: 'Published',
            subtitle: 'The animal will become available for adoption.',
            icon: Icons.public_outlined,
            isCompleted: false,
          ),

          _statusStep(
            title: 'Adoption Pending',
            subtitle: 'An adoption application is being processed.',
            icon: Icons.hourglass_empty,
            isCompleted: false,
          ),

          _statusStep(
            title: 'Adopted',
            subtitle: 'The adoption process has been completed.',
            icon: Icons.favorite_outline,
            isCompleted: false,
            showLine: false,
          ),

          const SizedBox(height: 20),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You will be notified when the status of your adoption listing changes.',
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
    required bool isCompleted,
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
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontStyle:
                        isCurrent ? FontStyle.normal : FontStyle.normal,
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
