import 'package:flutter/material.dart';

import '../../../core/services/app_settings_service.dart';

class EmergencyNotificationsPage extends StatefulWidget {
  const EmergencyNotificationsPage({super.key});

  @override
  State<EmergencyNotificationsPage> createState() =>
      _EmergencyNotificationsPageState();
}

class _EmergencyNotificationsPageState
    extends State<EmergencyNotificationsPage> {
  final AppSettingsService settings = AppSettingsService.instance;

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Emergency Rescue Update',
      'message': 'Rescue team has been assigned to an urgent case.',
      'time': '10 min ago',
      'urgent': true,
      'read': false,
    },
    {
      'title': 'Rescue Status Updated',
      'message': 'The rescue operation is currently in progress.',
      'time': '35 min ago',
      'urgent': true,
      'read': false,
    },
    {
      'title': 'Volunteer Coordination',
      'message': 'A volunteer has accepted a nearby rescue request.',
      'time': '1 hour ago',
      'urgent': false,
      'read': true,
    },
    {
      'title': 'Emergency Case Resolved',
      'message':
          'A previously reported emergency has been marked resolved.',
      'time': '2 hours ago',
      'urgent': false,
      'read': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable:
          settings.emergencyNotificationsEnabledNotifier,
      builder: (context, emergencyEnabled, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Emergency Alerts'),
            actions: [
              if (emergencyEnabled)
                IconButton(
                  tooltip: 'Mark all as read',
                  icon: const Icon(Icons.done_all),
                  onPressed: _markAllAsRead,
                ),
            ],
          ),
          body: !emergencyEnabled
              ? _buildDisabledView()
              : notifications.isEmpty
                  ? const Center(
                      child: Text('No emergency alerts'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];

                        return Card(
                          margin:
                              const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.all(12),
                            leading: CircleAvatar(
                              child: Icon(
                                notification['urgent'] == true
                                    ? Icons.warning_amber_rounded
                                    : Icons.notifications_outlined,
                              ),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    notification['title'] as String,
                                    style: TextStyle(
                                      fontWeight:
                                          notification['read'] == false
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                if (notification['urgent'] == true)
                                  const Text(
                                    'URGENT',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                            subtitle: Padding(
                              padding:
                                  const EdgeInsets.only(top: 6),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notification['message']
                                        as String,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    notification['time'] as String,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                notification['read'] = true;
                              });

                              _showDetails(
                                context,
                                notification['title'] as String,
                                notification['message'] as String,
                              );
                            },
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }

  Widget _buildDisabledView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 64,
              color: Theme.of(context)
                  .colorScheme
                  .onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            const Text(
              'Emergency Alerts are disabled',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Enable Emergency Alerts in Settings to receive '
              'urgent emergency notifications.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _markAllAsRead() {
    setState(() {
      for (final notification in notifications) {
        notification['read'] = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All emergency alerts marked as read'),
      ),
    );
  }

  void _showDetails(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}