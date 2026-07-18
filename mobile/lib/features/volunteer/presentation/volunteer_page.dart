import 'package:flutter/material.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  bool _isVolunteer = false;
  String? _selectedOpportunity;

  void _joinAsVolunteer() {
    setState(() {
      _isVolunteer = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You have joined the volunteer community.'),
      ),
    );
  }

  void _selectOpportunity(String opportunity) {
    setState(() {
      _selectedOpportunity = opportunity;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$opportunity selected.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Make a Difference',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Support animals and help create a safer community for every paw.',
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _isVolunteer ? null : _joinAsVolunteer,
                icon: const Icon(Icons.volunteer_activism),
                label: Text(
                  _isVolunteer
                      ? 'You Are a Volunteer'
                      : 'Join as a Volunteer',
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Volunteer Opportunities',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _buildOpportunityCard(
              context,
              icon: Icons.pets_outlined,
              title: 'Animal Rescue Support',
              subtitle:
                  'Help support rescue and welfare activities.',
            ),
            const SizedBox(height: 12),
            _buildOpportunityCard(
              context,
              icon: Icons.home_outlined,
              title: 'Shelter Assistance',
              subtitle:
                  'Support local shelters and animal care centers.',
            ),
            const SizedBox(height: 28),
            Text(
              'Your Activity',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    _selectedOpportunity == null
                        ? 'No volunteer activity yet.'
                        : 'Selected opportunity:\n$_selectedOpportunity',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpportunityCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isSelected = _selectedOpportunity == title;

    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(
          isSelected
              ? Icons.check_circle
              : Icons.chevron_right,
        ),
        onTap: () => _selectOpportunity(title),
      ),
    );
  }
}