import 'package:flutter/material.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  final Set<String> _joinedOpportunities = {};

  final List<Map<String, dynamic>> _opportunities = [
    {
      'title': 'Animal Rescue Support',
      'subtitle': 'Help support rescue and welfare activities.',
      'icon': Icons.pets_outlined,
    },
    {
      'title': 'Shelter Assistance',
      'subtitle': 'Support local shelters and animal care centers.',
      'icon': Icons.home_outlined,
    },
  ];

  final List<Map<String, String>> _rescueRequests = [
    {
      'animal': 'Injured Dog',
      'location': 'Chennai',
      'urgency': 'High Priority',
    },
    {
      'animal': 'Stray Cat',
      'location': 'Nearby Area',
      'urgency': 'Needs Assistance',
    },
  ];

  String? _acceptedRescue;

  void _toggleOpportunity(String opportunity) {
    if (_joinedOpportunities.contains(opportunity)) {
      _showLeaveConfirmation(opportunity);
    } else {
      setState(() {
        _joinedOpportunities.add(opportunity);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You joined $opportunity.'),
        ),
      );
    }
  }

  void _showLeaveConfirmation(String opportunity) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Leave Opportunity?'),
          content: Text(
            'Are you sure you want to leave $opportunity?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Stay'),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  _joinedOpportunities.remove(opportunity);
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'You left $opportunity.',
                    ),
                  ),
                );
              },
              child: const Text('Leave'),
            ),
          ],
        );
      },
    );
  }

  void _acceptRescue(String animal) {
    setState(() {
      _acceptedRescue = animal;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'You accepted the rescue request for $animal.',
        ),
      ),
    );
  }

  void _updateRescueStatus() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Rescue status updates will be connected to backend services.',
        ),
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
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Support animals and help create a safer community for every paw.',
            ),
            const SizedBox(height: 28),

            Text(
              'Available Rescue Requests',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            ..._rescueRequests.map(
              (request) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildRescueRequestCard(
                  context,
                  animal: request['animal']!,
                  location: request['location']!,
                  urgency: request['urgency']!,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Volunteer Opportunities',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            ..._opportunities.map(
              (opportunity) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildOpportunityCard(
                  context,
                  title: opportunity['title'] as String,
                  subtitle: opportunity['subtitle'] as String,
                  icon: opportunity['icon'] as IconData,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Your Activity',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            _buildActivityCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRescueRequestCard(
    BuildContext context, {
    required String animal,
    required String location,
    required String urgency,
  }) {
    final isAccepted = _acceptedRescue == animal;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.pets_outlined),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    animal,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  urgency,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(location),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: isAccepted
                    ? _updateRescueStatus
                    : () => _acceptRescue(animal),
                child: Text(
                  isAccepted
                      ? 'Update Rescue Status'
                      : 'Accept Rescue',
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
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isJoined = _joinedOpportunities.contains(title);

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
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () => _toggleOpportunity(title),
                    child: Text(
                      isJoined ? 'Joined' : 'Join',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(BuildContext context) {
    if (_joinedOpportunities.isEmpty && _acceptedRescue == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              'No volunteer activity yet.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_acceptedRescue != null)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.local_shipping_outlined,
                ),
                title: Text(
                  'Rescue: $_acceptedRescue',
                ),
                subtitle: const Text(
                  'You accepted this rescue request.',
                ),
              ),
            ..._joinedOpportunities.map(
              (opportunity) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.check_circle_outline,
                ),
                title: Text(opportunity),
                subtitle: const Text(
                  'You are participating in this opportunity.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}