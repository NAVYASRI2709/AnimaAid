import 'package:flutter/material.dart';

class AdminActivityPage extends StatelessWidget {
  const AdminActivityPage({
    super.key,
    this.location = 'All Locations',
    this.initialSection,
  });

  final String location;
  final String? initialSection;

  final List<Map<String, String>> rescueCases = const [
    {
      'id': '#ER-1024',
      'animal': 'Dog',
      'location': 'Chennai',
      'severity': 'High',
      'status': 'In Progress',
    },
    {
      'id': '#ER-1021',
      'animal': 'Cat',
      'location': 'Bangalore',
      'severity': 'Medium',
      'status': 'Assigned',
    },
    {
      'id': '#ER-1018',
      'animal': 'Cow',
      'location': 'Chennai',
      'severity': 'Low',
      'status': 'Completed',
    },
    {
      'id': '#ER-1015',
      'animal': 'Dog',
      'location': 'Mumbai',
      'severity': 'High',
      'status': 'In Progress',
    },
  ];

  final List<Map<String, String>> reports = const [
    {
      'id': '#RP-2048',
      'type': 'Animal Welfare Issue',
      'location': 'Chennai',
      'status': 'Under Review',
    },
    {
      'id': '#RP-2045',
      'type': 'Veterinary Service',
      'location': 'Bangalore',
      'status': 'Action Taken',
    },
    {
      'id': '#RP-2041',
      'type': 'Shelter Information',
      'location': 'Mumbai',
      'status': 'Resolved',
    },
    {
      'id': '#RP-2038',
      'type': 'Animal Welfare Issue',
      'location': 'Chennai',
      'status': 'Under Review',
    },
  ];

  List<Map<String, String>> _filter(
    List<Map<String, String>> items,
  ) {
    if (location == 'All Locations') {
      return items;
    }

    return items
        .where((item) => item['location'] == location)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredRescues = _filter(rescueCases);
    final filteredReports = _filter(reports);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          location == 'All Locations'
              ? 'Admin Activity'
              : 'Admin Activity — $location',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.location_on),
              ),
              title: Text(
                location == 'All Locations'
                    ? 'All Locations'
                    : location,
              ),
              subtitle: const Text(
                'Showing location-based operational activity',
              ),
            ),
          ),

          const SizedBox(height: 20),

          if (initialSection == null ||
              initialSection == 'Rescue Monitoring')
            _buildSection(
              context,
              title: 'Rescue Monitoring',
              icon: Icons.emergency,
              items: filteredRescues,
              emptyMessage: 'No rescue activity in this location.',
              isRescue: true,
            ),

          if (initialSection == null ||
              initialSection == 'Report Monitoring') ...[
            const SizedBox(height: 24),
            _buildSection(
              context,
              title: 'Report Monitoring',
              icon: Icons.report_problem,
              items: filteredReports,
              emptyMessage: 'No reports in this location.',
              isRescue: false,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Map<String, String>> items,
    required String emptyMessage,
    required bool isRescue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        if (items.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(emptyMessage),
              ),
            ),
          )
        else
          ...items.map(
            (item) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    isRescue
                        ? Icons.pets
                        : Icons.description,
                  ),
                ),
                title: Text(
                  '${item['id']} • '
                  '${item['animal'] ?? item['type']}',
                ),
                subtitle: Text(
                  '${item['location']} • '
                  '${item['status']}',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () {
                  _showDetails(context, item, isRescue);
                },
              ),
            ),
          ),
      ],
    );
  }

  void _showDetails(
    BuildContext context,
    Map<String, String> item,
    bool isRescue,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '${item['id']} Details',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isRescue
                    ? 'Animal: ${item['animal']}'
                    : 'Report Type: ${item['type']}',
              ),
              const SizedBox(height: 8),
              Text('Location: ${item['location']}'),
              const SizedBox(height: 8),
              Text('Status: ${item['status']}'),

              if (isRescue) ...[
                const SizedBox(height: 8),
                Text('Severity: ${item['severity']}'),
              ],
            ],
          ),
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