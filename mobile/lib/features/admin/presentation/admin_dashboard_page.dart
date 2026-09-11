import 'package:flutter/material.dart';

import 'admin_activity_page.dart';
import 'admin_analytics_page.dart';
import 'admin_location_map_page.dart';
import 'admin_messages_page.dart';
import 'admin_users_page.dart';
import 'admin_volunteers_page.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  String selectedLocation = 'All Locations';

  final List<String> locations = [
    'All Locations',
    'Chennai',
    'Bangalore',
    'Mumbai',
    'Hyderabad',
    'Delhi',
    'Coimbatore',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'AnimaAid Administration',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Monitor animal welfare activity, reports, rescues, and community activity.',
          ),

          const SizedBox(height: 20),

          // LOCATION FILTER
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                value: selectedLocation,
                decoration: const InputDecoration(
                  labelText: 'Monitor Location',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                items: locations.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            selectedLocation == 'All Locations'
                ? 'Global Overview'
                : 'Overview — $selectedLocation',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  context,
                  'Active Rescues',
                  '12',
                  Icons.emergency,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  context,
                  'Reports',
                  '24',
                  Icons.report_outlined,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _statCard(
                  context,
                  'Users',
                  '156',
                  Icons.people_outline,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  context,
                  'Volunteers',
                  '48',
                  Icons.volunteer_activism,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            'Management',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 12),

          _managementTile(
            context,
            icon: Icons.emergency,
            title: 'Rescue Monitoring',
            subtitle: 'Monitor rescue cases in the selected location.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminActivityPage(
                    location: selectedLocation,
                    initialSection: 'Rescue Monitoring',
                  ),
                ),
              );
            },
          ),

          _managementTile(
            context,
            icon: Icons.report_outlined,
            title: 'Reports',
            subtitle: 'Review reports by location.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminActivityPage(
                    location: selectedLocation,
                    initialSection: 'Report Monitoring',
                  ),
                ),
              );
            },
          ),

          _managementTile(
            context,
            icon: Icons.people_outline,
            title: 'Users',
            subtitle: 'Manage platform users and account activity.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminUsersPage(
                    location: selectedLocation,
                  ),
                ),
              );
            },
          ),

          _managementTile(
            context,
            icon: Icons.volunteer_activism,
            title: 'Volunteers',
            subtitle: 'Monitor volunteer activity and assignments.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminVolunteersPage(
                    location: selectedLocation,
                  ),
                ),
              );
            },
          ),

          _managementTile(
            context,
            icon: Icons.chat_outlined,
            title: 'Admin Messages',
            subtitle: 'Monitor shared community chat activity.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminMessagesPage(
                    location: selectedLocation,
                  ),
                ),
              );
            },
          ),

          _managementTile(
            context,
            icon: Icons.map_outlined,
            title: 'Location Map',
            subtitle: 'View rescue and report activity on the map.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminLocationMapPage(
                    location: selectedLocation,
                  ),
                ),
              );
            },
          ),

          _managementTile(
            context,
            icon: Icons.analytics_outlined,
            title: 'Analytics',
            subtitle: 'View location-based welfare statistics.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminAnalyticsPage(
                    location: selectedLocation,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _statCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _managementTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}