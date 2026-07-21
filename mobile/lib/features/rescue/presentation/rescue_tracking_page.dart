import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RescueTrackingPage extends StatelessWidget {
  const RescueTrackingPage({super.key});

  static const LatLng _rescueLocation = LatLng(
    13.0827,
    80.2707,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rescue Tracking'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildStatusCard(context),
              _buildMap(context),
              _buildRescueDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
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
                        'Rescue In Progress',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'A rescue volunteer is responding to this request.',
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
              isCompleted: true,
            ),
            _buildProgressStep(
              context,
              icon: Icons.directions_car,
              title: 'Rescue In Progress',
              subtitle: 'The volunteer is travelling to the location.',
              isCompleted: false,
              isCurrent: true,
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
    return SizedBox(
      height: 280,
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: _rescueLocation,
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
                point: _rescueLocation,
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
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.pets_outlined),
              title: Text('Animal'),
              subtitle: Text('Animal rescue request'),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.location_on_outlined),
              title: Text('Location'),
              subtitle: Text('Chennai'),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.volunteer_activism_outlined),
              title: Text('Assigned Volunteer'),
              subtitle: Text('Rescue volunteer assigned'),
            ),
          ],
        ),
      ),
    );
  }
}