import 'package:flutter/material.dart';

class RescuePage extends StatefulWidget {
  const RescuePage({super.key});

  @override
  State<RescuePage> createState() => _RescuePageState();
}

class _RescuePageState extends State<RescuePage> {
  bool _emergencyRequested = false;
  bool _dangerReportStarted = false;
  bool _helpSearchStarted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rescue Center',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Help animals get the care and safety they need.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            _buildEmergencyCard(context),
            const SizedBox(height: 28),
            _buildSectionTitle(context, 'Rescue Services'),
            const SizedBox(height: 14),
            _buildServiceCard(
              context,
              icon: Icons.report_problem_outlined,
              title: 'Report an Animal in Danger',
              subtitle:
                  'Report an injured, abandoned, or endangered animal.',
              buttonText: _dangerReportStarted
                  ? 'Report Started'
                  : 'Report Now',
              onPressed: () {
                setState(() {
                  _dangerReportStarted = true;
                });
              },
            ),
            const SizedBox(height: 12),
            _buildServiceCard(
              context,
              icon: Icons.location_on_outlined,
              title: 'Find Nearby Help',
              subtitle:
                  'Discover shelters, rescuers, and veterinary support nearby.',
              buttonText: _helpSearchStarted
                  ? 'Help Search Started'
                  : 'Find Help',
              onPressed: () {
                setState(() {
                  _helpSearchStarted = true;
                });
              },
            ),
            const SizedBox(height: 28),
            _buildSectionTitle(context, 'Active Rescue'),
            const SizedBox(height: 14),
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const CircleAvatar(
                  child: Icon(Icons.map_outlined),
                ),
                title: Text(
                  _emergencyRequested
                      ? 'Emergency rescue request active'
                      : 'No active rescue requests',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  _emergencyRequested
                      ? 'Rescue assistance has been requested.'
                      : 'Your active rescue activities will appear here.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.emergency_outlined,
              size: 40,
            ),
            const SizedBox(height: 14),
            Text(
              'Emergency Rescue',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Is an animal in immediate danger? Request urgent rescue assistance.',
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    _emergencyRequested = true;
                  });
                },
                child: Text(
                  _emergencyRequested
                      ? 'Emergency Request Submitted'
                      : 'Request Emergency Rescue',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
  ) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Icon(icon),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(subtitle),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: onPressed,
                    child: Text(buttonText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}