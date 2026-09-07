import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';


class RescueTrackingPage extends StatefulWidget {
  const RescueTrackingPage({super.key});

  @override
  State<RescueTrackingPage> createState() => _RescueTrackingPageState();
}

class _RescueTrackingPageState extends State<RescueTrackingPage> {
  final List<Map<String, dynamic>> _rescueRequests = [
    {
      'id': 'RES-1001',
      'animal': 'Injured Dog',
      'location': 'Chennai',
      'volunteer': 'Rescue volunteer assigned',
      'status': 'Rescue In Progress',
      'description':
          'A rescue volunteer is responding to this request.',
      'locationCoordinates': const LatLng(13.0827, 80.2707),
    },
    {
      'id': 'RES-1002',
      'animal': 'Stray Cat',
      'location': 'Adyar, Chennai',
      'volunteer': 'Volunteer assignment pending',
      'status': 'Volunteer Assigned',
      'description':
          'A volunteer has accepted the rescue request.',
      'locationCoordinates': const LatLng(13.0067, 80.2572),
    },
    {
      'id': 'RES-1003',
      'animal': 'Abandoned Puppy',
      'location': 'T. Nagar, Chennai',
      'volunteer': 'Rescue request received',
      'status': 'Request Submitted',
      'description':
          'Your rescue request was received.',
      'locationCoordinates': const LatLng(13.0418, 80.2341),
    },
  ];

  int _selectedRescueIndex = 0;

  Map<String, dynamic> get _selectedRescue =>
      _rescueRequests[_selectedRescueIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Rescue Tracking'),
  actions: [
    IconButton(
      onPressed: () => context.go('/'),
      icon: const Icon(Icons.home_outlined),
      tooltip: 'Home',
    ),
  ],
),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildRescueSelector(context),
              _buildStatusCard(context),
              _buildMap(context),
              _buildRescueDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRescueSelector(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<int>(
          initialValue: _selectedRescueIndex,
          decoration: const InputDecoration(
            labelText: 'Select Rescue Request',
            prefixIcon: Icon(Icons.emergency_outlined),
            border: OutlineInputBorder(),
          ),
          items: List.generate(
            _rescueRequests.length,
            (index) {
              final rescue = _rescueRequests[index];

              return DropdownMenuItem<int>(
                value: index,
                child: Text(
                  '${rescue['id']} • ${rescue['animal']}',
                ),
              );
            },
          ),
          onChanged: (index) {
            if (index == null) {
              return;
            }

            setState(() {
              _selectedRescueIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    final rescue = _selectedRescue;
    final status = rescue['status'] as String;

    return Card(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.local_shipping_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        rescue['description'] as String,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildProgressStep(
              context,
              icon: Icons.check_circle,
              title: 'Request Submitted',
              subtitle: 'Your rescue request was received.',
              isCompleted: true,
            ),
            _buildProgressStep(
              context,
              icon: Icons.check_circle,
              title: 'Volunteer Assigned',
              subtitle: 'A volunteer has accepted the rescue request.',
              isCompleted: status != 'Request Submitted',
            ),
            _buildProgressStep(
              context,
              icon: Icons.directions_car,
              title: 'Rescue In Progress',
              subtitle: 'The volunteer is travelling to the location.',
              isCompleted: false,
              isCurrent: status == 'Rescue In Progress',
            ),
            _buildProgressStep(
              context,
              icon: Icons.pets,
              title: 'Animal Safe',
              subtitle: 'The rescue will be completed here.',
              isCompleted: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isCurrent = false,
  }) {
    final color = isCompleted || isCurrent
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.outline;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                ),
                const SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMap(BuildContext context) {
    final location =
        _selectedRescue['locationCoordinates'] as LatLng;

    return SizedBox(
      height: 280,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: location,
          initialZoom: 14,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.animaaid.mobile',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: location,
                width: 50,
                height: 50,
                child: const Icon(
                  Icons.location_pin,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRescueDetails(BuildContext context) {
    final rescue = _selectedRescue;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rescue Details',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.confirmation_number_outlined),
              title: const Text('Request ID'),
              subtitle: Text(rescue['id'] as String),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.pets_outlined),
              title: const Text('Animal'),
              subtitle: Text(rescue['animal'] as String),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.location_on_outlined),
              title: const Text('Location'),
              subtitle: Text(rescue['location'] as String),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.volunteer_activism_outlined),
              title: const Text('Assigned Volunteer'),
              subtitle: Text(rescue['volunteer'] as String),
            ),
          ],
        ),
      ),
    );
  }
}