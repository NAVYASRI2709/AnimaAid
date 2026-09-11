import 'package:flutter/material.dart';

class AdminVolunteersPage extends StatelessWidget {
  const AdminVolunteersPage({
    super.key,
    this.location = 'All Locations',
  });

  final String location;

  static const List<Map<String, String>> volunteers = [
    {
      'name': 'Karthik',
      'location': 'Chennai',
      'activity': 'Rescue Assistance',
      'status': 'Active',
    },
    {
      'name': 'Meera',
      'location': 'Bangalore',
      'activity': 'Animal Welfare',
      'status': 'Available',
    },
    {
      'name': 'Vikram',
      'location': 'Mumbai',
      'activity': 'Rescue Transport',
      'status': 'Active',
    },
    {
      'name': 'Divya',
      'location': 'Chennai',
      'activity': 'Community Support',
      'status': 'Available',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredVolunteers = location == 'All Locations'
        ? volunteers
        : volunteers
            .where((volunteer) => volunteer['location'] == location)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          location == 'All Locations'
              ? 'Admin Volunteers'
              : 'Volunteers — $location',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.volunteer_activism),
              ),
              title: Text('${filteredVolunteers.length} Volunteers'),
              subtitle: Text(
                location == 'All Locations'
                    ? 'All registered volunteers'
                    : 'Volunteers operating in $location',
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...filteredVolunteers.map(
            (volunteer) => Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.volunteer_activism),
                ),
                title: Text(volunteer['name']!),
                subtitle: Text(
                  '${volunteer['activity']}\n'
                  '${volunteer['location']} • '
                  '${volunteer['status']}',
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  _showVolunteerDetails(
                    context,
                    volunteer,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showVolunteerDetails(
    BuildContext context,
    Map<String, String> volunteer,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(volunteer['name']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${volunteer['location']}'),
            const SizedBox(height: 8),
            Text('Activity: ${volunteer['activity']}'),
            const SizedBox(height: 8),
            Text('Status: ${volunteer['status']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}