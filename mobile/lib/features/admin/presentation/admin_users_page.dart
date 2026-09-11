import 'package:flutter/material.dart';

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({
    super.key,
    this.location = 'All Locations',
  });

  final String location;

  static const List<Map<String, String>> users = [
    {
      'name': 'Arun Kumar',
      'role': 'Community User',
      'location': 'Chennai',
      'status': 'Active',
    },
    {
      'name': 'Priya Sharma',
      'role': 'Community User',
      'location': 'Bangalore',
      'status': 'Active',
    },
    {
      'name': 'Rahul Verma',
      'role': 'Community User',
      'location': 'Mumbai',
      'status': 'Active',
    },
    {
      'name': 'Ananya Rao',
      'role': 'Community User',
      'location': 'Chennai',
      'status': 'Inactive',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredUsers = location == 'All Locations'
        ? users
        : users.where((user) => user['location'] == location).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          location == 'All Locations'
              ? 'Admin Users'
              : 'Users — $location',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.people_outline),
              ),
              title: Text('${filteredUsers.length} Users'),
              subtitle: Text(
                location == 'All Locations'
                    ? 'All registered platform users'
                    : 'Users registered in $location',
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...filteredUsers.map(
            (user) => Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(user['name']!),
                subtitle: Text(
                  '${user['role']} • ${user['location']}\n'
                  'Status: ${user['status']}',
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  _showUserDetails(context, user);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showUserDetails(
    BuildContext context,
    Map<String, String> user,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user['name']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Role: ${user['role']}'),
            const SizedBox(height: 8),
            Text('Location: ${user['location']}'),
            const SizedBox(height: 8),
            Text('Status: ${user['status']}'),
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
