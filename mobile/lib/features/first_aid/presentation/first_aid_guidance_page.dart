import 'package:flutter/material.dart';

class FirstAidGuidancePage extends StatelessWidget {
  const FirstAidGuidancePage({
    required this.title,
    required this.icon,
    required this.immediateSteps,
    required this.warningSigns,
    super.key,
  });

  final String title;
  final IconData icon;
  final List<String> immediateSteps;
  final List<String> warningSigns;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 44,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'These are general supportive steps only. They do not replace professional veterinary care.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Immediate Supportive Steps',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          ...immediateSteps.asMap().entries.map(
                (entry) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${entry.key + 1}'),
                    ),
                    title: Text(entry.value),
                  ),
                ),
              ),
          const SizedBox(height: 24),
          Text(
            'Seek Veterinary Help Immediately If',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          ...warningSigns.map(
            (warning) => Card(
              child: ListTile(
                leading: const Icon(
                  Icons.warning_amber_rounded,
                ),
                title: Text(warning),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'If the animal appears seriously injured, unconscious, has difficulty breathing, or is rapidly getting worse, contact a qualified veterinarian or emergency animal-care service immediately.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}