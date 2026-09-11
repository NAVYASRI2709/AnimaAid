import 'package:flutter/material.dart';

class AdminMessagesPage extends StatelessWidget {
  const AdminMessagesPage({
    super.key,
    this.location = 'All Locations',
  });

  final String location;

  final List<Map<String, String>> messages = const [
    {
      'title': 'Rescue Assistance Needed',
      'user': 'Community User',
      'location': 'Chennai',
      'time': 'Today',
      'status': 'New',
      'message':
          'A community member requested help for an injured animal nearby.',
    },
    {
      'title': 'Volunteer Available',
      'user': 'Volunteer',
      'location': 'Bangalore',
      'time': 'Today',
      'status': 'Active',
      'message':
          'A volunteer has reported availability for rescue assistance.',
    },
    {
      'title': 'Welfare Concern',
      'user': 'Animal Lover',
      'location': 'Chennai',
      'time': 'Yesterday',
      'status': 'Under Review',
      'message':
          'A welfare concern was discussed in the community chat.',
    },
    {
      'title': 'Shelter Information',
      'user': 'Community User',
      'location': 'Mumbai',
      'time': '2 days ago',
      'status': 'Resolved',
      'message':
          'A user shared information regarding a nearby animal shelter.',
    },
    {
      'title': 'Rescue Coordination',
      'user': 'Volunteer',
      'location': 'Chennai',
      'time': '2 days ago',
      'status': 'Active',
      'message':
          'Community members coordinated assistance for an active rescue.',
    },
  ];

  List<Map<String, String>> get filteredMessages {
    if (location == 'All Locations') {
      return messages;
    }

    return messages
        .where((message) => message['location'] == location)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredMessages;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          location == 'All Locations'
              ? 'Admin Messages'
              : 'Admin Messages — $location',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.chat),
              ),
              title: Text(
                location == 'All Locations'
                    ? 'All Community Messages'
                    : 'Community Messages — $location',
              ),
              subtitle: const Text(
                'Shared live chat activity filtered by location',
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            '${filtered.length} message activities',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          if (filtered.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    'No messages found for this location.',
                  ),
                ),
              ),
            )
          else
            ...filtered.map(
              (message) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      message['status'] == 'New'
                          ? Icons.mark_chat_unread
                          : Icons.chat_bubble_outline,
                    ),
                  ),
                  title: Text(message['title']!),
                  subtitle: Text(
                    '${message['user']} • '
                    '${message['location']}\n'
                    '${message['time']} • '
                    '${message['status']}',
                  ),
                  isThreeLine: true,
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  onTap: () {
                    _showMessageDetails(
                      context,
                      message,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showMessageDetails(
    BuildContext context,
    Map<String, String> message,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message['title']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User: ${message['user']}'),
              const SizedBox(height: 8),
              Text('Location: ${message['location']}'),
              const SizedBox(height: 8),
              Text('Time: ${message['time']}'),
              const SizedBox(height: 8),
              Text('Status: ${message['status']}'),
              const SizedBox(height: 16),
              Text(message['message']!),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Admin response will connect to backend later.',
                    ),
                  ),
                );
              },
              child: const Text('Respond'),
            ),
          ],
        );
      },
    );
  }
}