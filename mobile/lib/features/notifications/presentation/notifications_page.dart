import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Adoption Application Update',
      'subtitle': 'Buddy is waiting for your application review.',
      'icon': Icons.pets,
      'time': '2 hours ago',
      'isRead': false,
    },
    {
      'title': 'Rescue Request Assigned',
      'subtitle': 'A volunteer has accepted your rescue request.',
      'icon': Icons.emergency,
      'time': '5 hours ago',
      'isRead': false,
    },
    {
      'title': 'Donation Successful',
      'subtitle': 'Thank you for supporting AnimaAid!',
      'icon': Icons.favorite,
      'time': 'Yesterday',
      'isRead': true,
    },
    {
      'title': 'Vaccination Reminder',
      'subtitle': 'Luna is due for vaccination tomorrow.',
      'icon': Icons.health_and_safety,
      'time': 'Tomorrow',
      'isRead': true,
    },
    {
      'title': 'Shelter Event',
      'subtitle': 'Visit Hope Animal Shelter this weekend.',
      'icon': Icons.location_on,
      'time': 'Saturday',
      'isRead': true,
    },
  ];

  int get _unreadCount {
    return _notifications
        .where((notification) => notification['isRead'] == false)
        .length;
  }

  void _markAsRead(int index) {
    setState(() {
      _notifications[index]['isRead'] = true;
    });
  }

  void _markAllAsRead() {
    setState(() {
      for (final notification in _notifications) {
        notification['isRead'] = true;
      }
    });
  }

  void _clearAll() {
    setState(() {
      _notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _unreadCount == 0
              ? 'Notifications'
              : 'Notifications ($_unreadCount)',
        ),
        actions: [
          if (_unreadCount > 0)
            IconButton(
              onPressed: _markAllAsRead,
              tooltip: 'Mark all as read',
              icon: const Icon(Icons.done_all),
            ),
          if (_notifications.isNotEmpty)
            IconButton(
              onPressed: _clearAll,
              tooltip: 'Clear all',
              icon: const Icon(Icons.delete_outline),
            ),
        ],
      ),
      body: _notifications.isEmpty
          ? const Center(
              child: Text('No notifications yet'),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                final isRead = notification['isRead'] as bool;

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    onTap: () => _markAsRead(index),
                    leading: CircleAvatar(
                      child: Icon(
                        notification['icon'] as IconData,
                      ),
                    ),
                    title: Text(
                      notification['title'] as String,
                      style: TextStyle(
                        fontWeight: isRead
                            ? FontWeight.normal
                            : FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification['subtitle'] as String,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notification['time'] as String,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ],
                      ),
                    ),
                    trailing: isRead
                        ? null
                        : Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ),
                  ),
                );
              },
            ),
    );
  }
}