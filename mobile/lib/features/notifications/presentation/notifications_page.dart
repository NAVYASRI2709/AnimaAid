import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Adoption Application Update',
        'subtitle': 'Buddy is waiting for your application review.',
        'icon': Icons.pets,
        'time': '2 hours ago',
      },
      {
        'title': 'Rescue Request Assigned',
        'subtitle': 'A volunteer has accepted your rescue request.',
        'icon': Icons.emergency,
        'time': '5 hours ago',
      },
      {
        'title': 'Donation Successful',
        'subtitle': 'Thank you for supporting AnimaAid!',
        'icon': Icons.favorite,
        'time': 'Yesterday',
      },
      {
        'title': 'Vaccination Reminder',
        'subtitle': 'Luna is due for vaccination tomorrow.',
        'icon': Icons.health_and_safety,
        'time': 'Tomorrow',
      },
      {
        'title': 'Shelter Event',
        'subtitle': 'Visit Hope Animal Shelter this weekend.',
        'icon': Icons.location_on,
        'time': 'Saturday',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text('No notifications yet'),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Icon(notification['icon'] as IconData),
                    title: Text(notification['title'] as String),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification['subtitle'] as String),
                        const SizedBox(height: 4),
                        Text(
                          notification['time'] as String,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}