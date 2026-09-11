import 'package:flutter/material.dart';

class AdminAnalyticsPage extends StatelessWidget {
  const AdminAnalyticsPage({
    super.key,
    this.location = 'All Locations',
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location == 'All Locations'
              ? 'Admin Analytics'
              : 'Analytics — $location',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.analytics_outlined),
              ),
              title: Text(
                location == 'All Locations'
                    ? 'Platform Analytics'
                    : '$location Analytics',
              ),
              subtitle: const Text(
                'Operational statistics and animal welfare activity',
              ),
            ),
          ),

          const SizedBox(height: 20),

          _analyticsCard(
            context,
            'Rescue Cases',
            '12',
            Icons.emergency,
          ),

          _analyticsCard(
            context,
            'Welfare Reports',
            '24',
            Icons.report_outlined,
          ),

          _analyticsCard(
            context,
            'Active Volunteers',
            '48',
            Icons.volunteer_activism,
          ),

          _analyticsCard(
            context,
            'Registered Users',
            '156',
            Icons.people_outline,
          ),

          const SizedBox(height: 20),

          Text(
            'Activity Summary',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 12),

          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.trending_up),
                  title: Text('Rescue Activity'),
                  subtitle: Text(
                    'Active rescue operations are being monitored.',
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.report),
                  title: Text('Reports'),
                  subtitle: Text(
                    'Welfare and service reports are under review.',
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('Community'),
                  subtitle: Text(
                    'Users and volunteers are contributing to activities.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _analyticsCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(title),
        trailing: Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}