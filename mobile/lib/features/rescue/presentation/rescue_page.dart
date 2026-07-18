import 'package:flutter/material.dart';

class RescuePage extends StatelessWidget {
  const RescuePage({super.key});

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
              subtitle: 'Report an injured, abandoned, or endangered animal.',
              buttonText: 'Report Now',
            ),
            const SizedBox(height: 12),
            _buildServiceCard(
              context,
              icon: Icons.location_on_outlined,
              title: 'Find Nearby Help',
              subtitle: 'Discover shelters, rescuers, and veterinary support nearby.',
              buttonText: 'Find Help',
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
                title: const Text(
                  'No active rescue requests',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Your active rescue activities will appear here.',
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
                onPressed: () {},
                child: const Text('Request Emergency Rescue'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
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
                    onPressed: () {},
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