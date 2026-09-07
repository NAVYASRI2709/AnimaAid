import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Emergency Rescue Update',
      'subtitle': 'A volunteer has accepted your rescue request.',
      'icon': Icons.emergency,
      'time': '5 hours ago',
      'category': 'Emergency',
      'isRead': false,
    },
    {
      'title': 'Report Status Update',
      'subtitle': 'Your animal welfare report is currently under review.',
      'icon': Icons.report_problem_outlined,
      'time': '3 hours ago',
      'category': 'Reports',
      'isRead': false,
    },
    {
      'title': 'Adoption Application Update',
      'subtitle': 'Buddy is waiting for your application review.',
      'icon': Icons.pets,
      'time': '2 hours ago',
      'category': 'Adoption',
      'isRead': false,
    },
    {
      'title': 'Health Reminder',
      'subtitle': 'Luna is due for vaccination tomorrow.',
      'icon': Icons.health_and_safety,
      'time': 'Tomorrow',
      'category': 'Health',
      'isRead': true,
    },
    {
      'title': 'New Chat Activity',
      'subtitle': 'There is new activity in the AnimaAid live chat.',
      'icon': Icons.chat_outlined,
      'time': 'Yesterday',
      'category': 'Chat',
      'isRead': true,
    },
    {
      'title': 'Donation Successful',
      'subtitle': 'Thank you for supporting AnimaAid!',
      'icon': Icons.favorite,
      'time': 'Yesterday',
      'category': 'Other',
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

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Emergency':
        return Icons.emergency;
      case 'Reports':
        return Icons.report_problem_outlined;
      case 'Adoption':
        return Icons.pets;
      case 'Health':
        return Icons.health_and_safety;
      case 'Chat':
        return Icons.chat_outlined;
      default:
        return Icons.notifications_none;
    }
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
                final category = notification['category'] as String;

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    onTap: () => _markAsRead(index),
                    leading: CircleAvatar(
                      child: Icon(
                        _categoryIcon(category),
                      ),
                    ),
                    title: Text(
                      notification['title'] as String,
                      style: TextStyle(
                        fontWeight:
                            isRead ? FontWeight.normal : FontWeight.bold,
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
                          Row(
                            children: [
                              Text(
                                category,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '• ${notification['time']}',
                                style:
                                    Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
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