import 'package:flutter/material.dart';

class AdminLocationMapPage extends StatelessWidget {
  const AdminLocationMapPage({
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
              ? 'Admin Location Map'
              : 'Map — $location',
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(
                location == 'All Locations'
                    ? 'All Locations'
                    : location,
              ),
              subtitle: const Text(
                'Monitor rescue and report locations',
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      size: 64,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Admin Activity Map',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Live rescue and report markers will appear here.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Card(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.emergency),
                  title: Text('Active Rescue'),
                  subtitle: Text('Rescue case location'),
                ),
                ListTile(
                  leading: Icon(Icons.report_outlined),
                  title: Text('Welfare Report'),
                  subtitle: Text('Reported issue location'),
                ),
                ListTile(
                  leading: Icon(Icons.volunteer_activism),
                  title: Text('Volunteer Activity'),
                  subtitle: Text('Volunteer activity location'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}